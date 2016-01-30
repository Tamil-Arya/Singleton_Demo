//
//  ViewController.m
//  DemoShare
//
//  Created by Dvios on 28/01/16.
//  Copyright © 2016 Dvois. All rights reserved.
//

#import "ViewController.h"
#import "HTTPServerClass.h"
#import "HUD.h"
@interface ViewController ()<UIAlertViewDelegate,UIActionSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [HUD showUIBlockingIndicatorWithText:@"Please wait,..."];
    
   singletonobjs=[HTTPServerClass sharedManager];
    [singletonobjs HTTPServerCall:@"http://adserver.i-on.in:8080/GetStates" ServerCallsequenceNumber:1];
    [self performSelector:@selector(getServerdata) withObject:nil afterDelay:3.0];
    
    
       // Do any additional setup after loading the view, typically from a nib.
}
-(void)getServerdata
{
    
    NSLog(@"%@",[singletonobjs Getserverdata:1]);
       [HUD hideUIBlockingIndicator];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
