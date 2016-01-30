//
//  HTTPServerClass.m
//  DemoShare
//
//  Created by Dvios on 29/01/16.
//  Copyright © 2016 Dvois. All rights reserved.
//

#import "HTTPServerClass.h"

@implementation HTTPServerClass

@synthesize someProperty,PaidUserServerDataArray,ServerDataArray;

#pragma mark Singleton Methods

+ (id)sharedManager {
    static HTTPServerClass *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        someProperty = @"Default Property Value";
        PaidUserServerDataArray=nil;
        ServerDataArray=nil;
        
        
    }
    return self;
}

-(void)HTTPServerCall:(NSString *)urlstring ServerCallsequenceNumber:(NSInteger)sequenceNumbe
{
    
    NSURLSessionConfiguration *defaultObj=[NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaulturlobj=[NSURLSession sessionWithConfiguration:defaultObj delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURL *url=[NSURL URLWithString:urlstring];
    NSURLSessionDataTask *dataTask=[defaulturlobj dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
      
        if (error == nil && data.length>0) {
            
            if (sequenceNumbe ==1)
            {
                  NSLog(@"Firstb :%ld",(long)sequenceNumbe);
                 PaidUserServerDataArray=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            }
            else if(sequenceNumbe ==2)
            {
                  NSLog(@"Second :%ld",(long)sequenceNumbe);
                 ServerDataArray=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            }
           
            // NSLog(@"%@",ServerDataArray);
        }
    }];
    [dataTask resume];
    
}
-(NSArray *)Getserverdata:(NSInteger)sequenceNumber
{
    if (sequenceNumber==1) {
        return  PaidUserServerDataArray;;
    }
    else
    {
        return ServerDataArray;
    }
    
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}
@end
