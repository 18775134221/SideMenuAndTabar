//
//  LoginViewController.m
//  SideMenuAndTabar
//
//  Created by egood001 on 15/11/25.
//  Copyright (c) 2015年 hjq. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"

@implementation LoginViewController
- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"登录";
}

- (void) viewDidLoad
{
    [super viewDidLoad];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[NSUserDefaults standardUserDefaults] setObject:@"11" forKey:@"info"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appdelegate.bY goHome];
}
@end
