//
//  CTTelephonyManager.m
//

#import "CTTelephonyManager.h"

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

#pragma mark - Call Event Handler

- (void)setUpCallEventHandler {
    
    _callCenter = [[CTCallCenter alloc] init];
    _callCenter.callEventHandler = ^(CTCall* call) {
        NSString* callState = [call callState];
        NSLog(@"%@", callState);
    };
}

#pragma mark - for Debug

- (void)carrierInfoLog {

    CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [netinfo subscriberCellularProvider];
    NSLog(@"Carrier: %@", [carrier debugDescription]);
}

@end
