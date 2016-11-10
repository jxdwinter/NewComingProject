//
//  SecondTabbarViewController.m
//  NewComingProject
//
//  Created by Xiaodong Jiang on 10/11/2016.
//  Copyright © 2016 jxdwinter. All rights reserved.
//

#import "SecondTabbarViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"

@interface SecondTabbarViewController ()

@property (strong, nonatomic) UITabBarController *tabBarController;

@end

@implementation SecondTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.tabBar.translucent = NO;
    
    UINavigationController *one = [[UINavigationController alloc] initWithRootViewController:[[OneViewController alloc] init]];
    UINavigationController *two = [[UINavigationController alloc] initWithRootViewController:[[TwoViewController alloc] init]];
    
    NSArray* controllers = @[one,two];
    self.tabBarController.viewControllers = controllers;
    
    UITabBar *tabBar = self.tabBarController.tabBar;
    UITabBarItem *tabBarItem0 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:1];
    
    tabBarItem0.title = @"出租";
    tabBarItem0.titlePositionAdjustment = UIOffsetMake(0.0, -2.0);
    tabBarItem0.image = [[UIImage imageNamed:@"1_1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabBarItem0.selectedImage = [[UIImage imageNamed:@"1_2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    
    tabBarItem1.title = @"承租";
    tabBarItem1.titlePositionAdjustment = UIOffsetMake(0.0, -2.0);
    tabBarItem1.image = [[UIImage imageNamed:@"2_1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabBarItem1.selectedImage = [[UIImage imageNamed:@"2_2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    
    self.tabBarController.selectedIndex = 0;
    [self addChildViewController:self.tabBarController];
    [self.view addSubview:self.tabBarController.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
