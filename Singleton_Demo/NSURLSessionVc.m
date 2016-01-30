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
 
    //Call the NSObject
    singletonobj=[HTTPServerClass sharedManager];
    //Pass the server url
    [singletonobj HTTPServerCall:@"pass the url"];
   //server responce will get time so keep as 3 s 
    [self performSelector:@selector(serverCallMethod) withObject:nil afterDelay:3.0];
    // Do any additional setup after loading the view.
}

-(void)serverCallMethod{

    NSLog(@"%@",[singletonobj Getserverdata]);
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
