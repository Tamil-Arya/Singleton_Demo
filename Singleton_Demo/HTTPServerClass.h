//
//  HTTPServerClass.h
//  DemoShare
//
//  Created by Dvios on 29/01/16.
//  Copyright © 2016 Dvois. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface HTTPServerClass : NSObject<NSURLSessionDataDelegate,NSURLSessionDelegate>
{
    NSString *someProperty;
    NSMutableArray *ServerDataArray;
}

@property (nonatomic, retain) NSString *someProperty;
@property (nonatomic, retain) NSMutableArray *ServerDataArray;


+ (id)sharedManager;
-(void)HTTPServerCall:(NSString *)urlstring;
-(NSMutableArray *)Getserverdata;
@end
