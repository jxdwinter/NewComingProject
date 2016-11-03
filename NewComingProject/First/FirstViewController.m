//
//  FirstViewController.m
//  NewComingProject
//
//  Created by Xiaodong Jiang on 03/11/2016.
//  Copyright © 2016 jxdwinter. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstDetailViewController.h"
#import <WMPageController.h>
#import "UIConfig.h"

@interface FirstViewController () <WMPageControllerDataSource>

@property (nonatomic, strong) NSArray *menus;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"电子商务";
    self.menus = @[@"食品饮料",@"粮油副食",@"中外名酒",@"个人护理",@"护肤美妆",@"家居清洁",@"母婴用品",@"生鲜水果"];
    [self configController];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configController{
    WMPageController *pageViewController = [[WMPageController alloc] init ];
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
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0.0, MENUHEIGHT, SCREEN_WIDTH, 1.0)];
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
    FirstDetailViewController *detailViewController = [[FirstDetailViewController alloc] init];
    detailViewController.menu = self.menus[index];
    return detailViewController;
}

@end
