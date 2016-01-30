//
//  NSURLSessionVc.m
//  DemoShare
//
//  Created by Dvios on 29/01/16.
//  Copyright © 2016 Dvois. All rights reserved.
//

#import "NSURLSessionVc.h"
#import "HTTPServerClass.h"

@interface NSURLSessionVc ()

@end

@implementation NSURLSessionVc

- (void)viewDidLoad {
    [super viewDidLoad];
 

    singletonobj=[HTTPServerClass sharedManager];
   
    [singletonobj HTTPServerCall:@"Request url" ServerCallsequenceNumber:2];
  
    
   [self performSelector:@selector(serverCallMethod) withObject:nil afterDelay:3.0];
    // Do any additional setup after loading the view.
}
-(void)serverCallMethod
{
   
   serverdatas=[singletonobj Getserverdata:2];
    
    NSLog(@"Return server data : %@",serverdatas);
  
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
