//
//  CTTelephonyManager.m
//

#import "CTTelephonyManager.h"

@interface CTTelephonyManager ()

@property (nonatomic, readwrite) CTCallState callState;

@end

static CTTelephonyManager *_instance;

@implementation CTTelephonyManager

#pragma mark - Singleton Implementation

+ (void)initialize {
    
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [[CTTelephonyManager alloc] initInternal];
        }
    }   // @synchronized
}

+ (CTTelephonyManager *)sharedInstance {
    
    return _instance;
}

- (id)init {
    
    [self doesNotRecognizeSelector:_cmd];
    
    return nil;
}

- (id)initInternal {
    
    self = [super init];
    
    if (self) {
        //[self setUpCallEventHandler];
    }
    
    return self;
}

#pragma mark - Handling CallState

- (CTCallState)callStateFromString:(NSString *)stateStr {
    
    if (stateStr == nil) {
        return CTCallNotDetermined;
    } else {
        if ([stateStr isEqualToString:CTCallStateDialing]) {
            return CTCallDialing;
        } else if ([stateStr isEqualToString:CTCallStateIncoming]) {
            return CTCallIncoming;
        } else if ([stateStr isEqualToString:CTCallStateDialing]) {
            return CTCallDisconnected;
        } else if ([stateStr isEqualToString:CTCallStateDisconnected]) {
            return CTCallDisconnected;
        } else {
            return CTCallNotDetermined;
        }
    }
}

- (NSString *)currentCTCallState {
    
    CTCallCenter *center = [[CTCallCenter alloc] init];
    NSArray *calls = [center.currentCalls allObjects];
    
    if (calls) {
        CTCall *call = [calls firstObject];
        return [call callState];
    } else {
        return nil;
    }
}

- (CTCallState)callState {
    
    _callState = [self callStateFromString:[self currentCTCallState]];
    
    return _callState;
}

#pragma mark - Call Event Handler

- (void)setUpCallEventHandler {
    
    _callCenter = [[CTCallCenter alloc] init];
    
    // Resolving lexical scope
    __block __weak typeof(self) _self = self;
    
    _callCenter.callEventHandler = ^(CTCall* call) {
        
        _self.callState = [_self callStateFromString:[_self currentCTCallState]];
    };
}

#pragma mark - for Debug

- (void)carrierInfoLog {

    CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [netinfo subscriberCellularProvider];
#ifdef DEBUG
    NSLog(@"Carrier: %@", [carrier debugDescription]);
#endif  // DEBUG
}

@end
