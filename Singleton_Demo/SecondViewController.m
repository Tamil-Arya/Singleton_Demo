//
//  SecondViewController.m
//  Singleton_Demo
//
//  Created by Dvios on 30/01/16.
//  Copyright © 2016 Dvois. All rights reserved.
//

#import "SecondViewController.h"
#import "HTTPServerClass.h"
@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    singletonobj=[HTTPServerClass sharedManager];
    [singletonobj HTTPServerCall:@"pass server url"];
    
    
    [self performSelector:@selector(serverCallMethod) withObject:nil afterDelay:3.0];
    // Do any additional setup after loading the view.
}
-(void)serverCallMethod{
    NSLog(@"2 :%@",[singletonobj Getserverdata]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
