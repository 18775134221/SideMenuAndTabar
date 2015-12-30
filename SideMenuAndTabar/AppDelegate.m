//
//  AppDelegate.m
//  SideMenuAndTabar
//
//  Created by egood001 on 15/10/28.
//  Copyright (c) 2015年 hjq. All rights reserved.
//

#import "AppDelegate.h"
//侧滑菜单
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationController.h"


#import "LeftMenuViewController.h"

#define kLoginNotificationCenter @"kLoginNotificationCenter"

@interface AppDelegate ()<UIAlertViewDelegate>
{
    BOOL isShowLoginMode;
}

@end

@implementation AppDelegate

/**
 *  初始化导航根控制器并配置侧滑菜单
 */
- (void) initNavigationVC_SetLeftMenu:(UIView *) welcomeView
{
    //HomeViewController *homeViewController = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    //homeViewController.welComeView = welcomeView;
    //    homeViewController.homeDataMutableDictionary = self.homeDataMutableDictionary;
    
    BYTabBarViewController *tabBarViewControllerVc =[[BYTabBarViewController alloc]init];
    _bY = tabBarViewControllerVc;
    
    SlideNavigationController *slideNavigationController = [[SlideNavigationController alloc]initWithRootViewController:tabBarViewControllerVc];
   // SlideNavigationController *slideNavigationController = [[SlideNavigationController alloc] initWithRootViewController:tabBarViewControllerVc];
    
    
//    //设置导航条背景
//    UIImage *nvigationImage = [Common createImageWithColor:[Common hexStringToColor:@"#ffd900"]];
//    
//    [slideNavigationController.navigationBar setBackgroundImage:nvigationImage forBarMetrics:UIBarMetricsDefault];
    
    //slideNavigationController.navigationBar.translucent = NO;
    
    
    //动画配置
    /*
     1.revealAnimator = [[SlideNavigationContorllerAnimatorFade alloc] init];
     2.revealAnimator = [[SlideNavigationContorllerAnimatorSlideAndFade alloc] initWithMaximumFadeAlpha:.8 fadeColor:[UIColor blackColor] andSlideMovement:100];
     3.revealAnimator = [[SlideNavigationContorllerAnimatorScaleAndFade alloc] initWithMaximumFadeAlpha:.6 fadeColor:[UIColor blackColor] andMinimumScale:.8];
     */
    
    id <SlideNavigationContorllerAnimator> revealAnimator = [[SlideNavigationContorllerAnimatorScale alloc] init];
    [[SlideNavigationController sharedInstance] closeMenuWithCompletion:^{
        [SlideNavigationController sharedInstance].menuRevealAnimator = revealAnimator;
    }];
    
    //设置左边菜单占的宽度
    [SlideNavigationController sharedInstance].portraitSlideOffset = 160.0f;
    //是否开启左边菜单阴影
    [SlideNavigationController sharedInstance].enableShadow = NO;
    //是否可在主视图上滑动呼出菜单
    [SlideNavigationController sharedInstance].enableSwipeGesture = NO;
    
    LeftMenuViewController *leftMenu = [[LeftMenuViewController alloc] initWithNibName:@"LeftMenuViewController" bundle:nil];
    
    //[SlideNavigationController sharedInstance].rightMenu = nil;
    [SlideNavigationController sharedInstance].leftMenu = leftMenu;
    //[SlideNavigationController sharedInstance].;
    
    _window.rootViewController = slideNavigationController;
    
    /*
     [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidClose object:nil queue:nil usingBlock:^(NSNotification *note) {
     NSString *menu = note.userInfo[@"menu"];
     NSLog(@"Closed %@", menu);
     }];
     
     [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidOpen object:nil queue:nil usingBlock:^(NSNotification *note) {
     NSString *menu = note.userInfo[@"menu"];
     NSLog(@"Opened %@", menu);
     }];
     
     [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidReveal object:nil queue:nil usingBlock:^(NSNotification *note) {
     NSString *menu = note.userInfo[@"menu"];
     NSLog(@"Revealed %@", menu);
     }];
     */
    
    
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    [self initNavigationVC_SetLeftMenu:nil];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//判断用户是否已经登录
-(BOOL)isLogin:(BOOL)isMode{
    
        //isShowLoginMode = isMode;
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您还未登陆, 是否现在去登陆?" delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
    [alertView show];
    
    return YES;
}


#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kLoginNotificationCenter object:self userInfo:@{@"isMode":[NSString stringWithFormat:@"%d",isShowLoginMode]}];
    }
}

@end
