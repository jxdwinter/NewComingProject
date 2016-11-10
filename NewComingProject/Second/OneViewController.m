//
//  OneViewController.m
//  NewComingProject
//
//  Created by Xiaodong Jiang on 10/11/2016.
//  Copyright © 2016 jxdwinter. All rights reserved.
//

#import "OneViewController.h"
#import <WMPageController.h>
#import "UIConfig.h"
#import "DetailViewController.h"

@interface OneViewController () <WMPageControllerDataSource>

@property (nonatomic, strong) NSArray *menus;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    self.menus = @[@"出租土地",@"出租农机具"];
    [self configController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configController{
    WMPageController *pageViewController = [[WMPageController alloc] init];
    pageViewController.dataSource = self;
    pageViewController.menuViewStyle = WMMenuViewStyleLine;
    pageViewController.pageAnimatable = YES;
    pageViewController.menuItemWidth = 85;
    pageViewController.titleColorSelected = DEFAULTCOLOR;
    pageViewController.titleColorNormal = DEFAULTTEXTCOLOR;
    pageViewController.titleSizeNormal = 12;
    pageViewController.titleSizeSelected = 14;
    pageViewController.menuHeight = MENUHEIGHT;
    pageViewController.menuBGColor = [UIColor whiteColor];
    [self addChildViewController:pageViewController];
    [self.view addSubview:pageViewController.view];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0.0, MENUHEIGHT + NAVIGATIONBARHEIGHT, SCREEN_WIDTH, 1.0)];
    lineView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    [self.view addSubview:lineView];
}

#pragma mark - WMPageControllerDataSource

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.menus.count;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.menus[index];
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    detailViewController.menuName = self.menus[index];
    return detailViewController;
}

@end
