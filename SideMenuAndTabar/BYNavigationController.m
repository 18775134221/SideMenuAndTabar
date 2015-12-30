//
//  IWNavigationController.m
//  ItcastWeibo
//
//  Created by apple on 14-5-6.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "BYNavigationController.h"



@interface BYNavigationController ()

@end

@implementation BYNavigationController


- (void)viewDidLoad
{
    
    // 改变导航栏背景颜色
    self.navigationBar.barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"navigation_bg"]];
    
    // 设置标题字体颜色
    UIColor * color = [UIColor blackColor];
    // 这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    
    [dict setObject:color forKey:NSForegroundColorAttributeName];

    
//    [NSMutableDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
//    // 字体
//    dict[UITextAttributeFont]= [UIFont systemFontOfSize:17];
    
     dict[NSFontAttributeName]= [UIFont systemFontOfSize:17];
    
    //大功告成
    self.navigationBar.titleTextAttributes = dict;
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
   
    
    

}



/**
 *  第一次使用这个类的时候会调用(1个类只会调用1次)
 */
+ (void)initialize
{
    // 1.设置导航栏主题
    [self setupNavBarTheme];
    
    // 2.设置导航栏按钮主题
//    [self setupBarButtonItemTheme];
    



}

/**
 *  设置导航栏按钮主题
 */
+ (void)setupBarButtonItemTheme
{
//    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 设置文字属性
//    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
//    textAttrs[UITextAttributeTextColor] = [UIColor orangeColor];
//    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
//    textAttrs[UITextAttributeFont] = [UIFont systemFontOfSize:40];
//    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
//    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
    
//    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
//    disableTextAttrs[UITextAttributeTextColor] =  [UIColor lightGrayColor];
//    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}

/**
 *  设置导航栏主题
 */
+ (void)setupNavBarTheme
{
    // 取出appearance对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    // 设置标题属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
//    textAttrs[UITextAttributeTextColor] = [UIColor blackColor];
//    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
//    textAttrs[UITextAttributeFont] = [UIFont boldSystemFontOfSize:19];
    [navBar setTitleTextAttributes:textAttrs];
    

    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}




@end
