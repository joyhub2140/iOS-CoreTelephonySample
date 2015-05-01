//
//  ViewController.m
//

#import "ViewController.h"
#import "CTTelephonyManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CTTelephonyManager *telephonyMgr = [CTTelephonyManager sharedInstance];
    [telephonyMgr carrierInfoLog];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
