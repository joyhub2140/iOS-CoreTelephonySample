//
//  AppDelegate.h
//

#import <UIKit/UIKit.h>
#import "CTTelephonyManager.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) CTTelephonyManager *telephonyManager;


@end

