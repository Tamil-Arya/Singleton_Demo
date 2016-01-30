//
//  SecondViewController.h
//  Singleton_Demo
//
//  Created by Dvios on 30/01/16.
//  Copyright © 2016 Dvois. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTTPServerClass.h"
@interface SecondViewController : UIViewController
{
NSArray *serverdatas;
HTTPServerClass *singletonobj;
}
@end
