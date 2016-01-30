//
//  HTTPServerClass.m
//  DemoShare
//
//  Created by Dvios on 29/01/16.
//  Copyright © 2016 Dvois. All rights reserved.
//

#import "HTTPServerClass.h"

@implementation HTTPServerClass

@synthesize someProperty,ServerDataArray;

#pragma mark Singleton Methods

//allocate memory
+ (id)sharedManager {
    static HTTPServerClass *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    
    });
    return sharedMyManager;
}
//init
- (id)init {
    if (self = [super init]) {
        //We can hard the string 
        someProperty = @"Default Property Value";
        
    }
    return self;
}

//server call methods
-(void)HTTPServerCall:(NSString *)urlstring{
    
    NSURLSessionConfiguration *defaultObj=[NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaulturlobj=[NSURLSession sessionWithConfiguration:defaultObj delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURL *url=[NSURL URLWithString:urlstring];
    NSURLSessionDataTask *dataTask=[defaulturlobj dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil && data.length>0) {
            ServerDataArray=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        }
    }];
    [dataTask resume];
    
}

//Return the data
-(NSMutableArray *)Getserverdata{
        return ServerDataArray;
    
}

@end
