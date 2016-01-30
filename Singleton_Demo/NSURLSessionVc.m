//
//  NSURLSessionVc.m
//  DemoShare
//
//  Created by Dvios on 29/01/16.
//  Copyright © 2016 Dvois. All rights reserved.
//

#import "NSURLSessionVc.h"
#import "HTTPServerClass.h"
#import "HUD.h"
@interface NSURLSessionVc ()

@end

@implementation NSURLSessionVc

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [HUD showAlertWithTitle:@"ION WiFi" text:@"Please wait,.."];
    
    singletonobj=[HTTPServerClass sharedManager];
   
    [singletonobj HTTPServerCall:@"http://adserver.i-on.in:8080/GetCustomerwithMob?id=8880724780" ServerCallsequenceNumber:2];
  
    
   [self performSelector:@selector(serverCallMethod) withObject:nil afterDelay:3.0];
    // Do any additional setup after loading the view.
}
-(void)serverCallMethod
{
   
   serverdatas=[singletonobj Getserverdata:2];
    
    NSLog(@"Return server data : %@",serverdatas);
    [HUD hideUIBlockingIndicator];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
