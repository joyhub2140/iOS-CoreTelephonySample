//
//  CTTelephonyManager.h
//

#import <Foundation/Foundation.h>
#import <CoreTelephony/CTCall.h>
#import <CoreTelephony/CTCallCenter.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

@interface CTTelephonyManager : NSObject

#pragma mark - Property
@property (nonatomic, retain) CTCallCenter *callCenter;

#pragma mark - Singleton Implementation
+ (CTTelephonyManager *)sharedInstance;
- (id)init UNAVAILABLE_ATTRIBUTE;
#pragma mark - Call Event Handler
- (void)setUpCallEventHandler;
#pragma mark - for Debug
- (void)carrierInfoLog;

@end
