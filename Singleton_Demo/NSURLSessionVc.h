//
//  NSURLSessionVc.h
//  DemoShare
//
//  Created by Dvios on 29/01/16.
//  Copyright © 2016 Dvois. All rights reserved.
//

#import "ViewController.h"
#import "HTTPServerClass.h"
@interface NSURLSessionVc : ViewController
{
    NSArray *serverdatas;
    HTTPServerClass *singletonobj;
}
@end
