//
//  PersonalCeterViewController.m
//  SideMenuAndTabar
//
//  Created by egood001 on 15/11/25.
//  Copyright (c) 2015年 hjq. All rights reserved.
//

#import "PersonalCeterViewController.h"
#import "AppDelegate.h"

@implementation PersonalCeterViewController
- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:243.0/255.0 green:244.0/255 blue:245.0/255 alpha:1];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"info"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appdelegate.bY goHome];
}

@end
