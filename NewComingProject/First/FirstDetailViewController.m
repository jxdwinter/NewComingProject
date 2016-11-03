//
//  FirstDetailViewController.m
//  NewComingProject
//
//  Created by Xiaodong Jiang on 03/11/2016.
//  Copyright © 2016 jxdwinter. All rights reserved.
//

#import "FirstDetailViewController.h"
#import "FirstDetailLeftTableViewCell.h"
#import "FirstDetailRightTableViewCell.h"
#import "UIConfig.h"

@interface FirstDetailViewController () <UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@property (nonatomic, strong) NSArray *leftMenus;
@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) NSMutableArray *rightDataSource;
@property (nonatomic, strong) UITableView *rightTableView;

@property (nonatomic, strong) NSDictionary *dataSource;

@end

@implementation FirstDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.rightDataSource = [NSMutableArray new];
    [self configData];
    [self.view addSubview:self.leftTableView];
    [self.view addSubview:self.rightTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) configData {
    if ([self.menu isEqualToString:@"食品饮料"]) {
        self.leftMenus = @[@"饮料",@"副食",@"小食品",@"罐头",@"茗茶"];
    }else if ([self.menu isEqualToString:@"粮油副食"]){
        self.leftMenus = @[@"食用油",@"米面/面粉",@"健康杂粮",@"厨房调味",@"方便速食"];
    }else if ([self.menu isEqualToString:@"个人护理"]){
        self.leftMenus = @[@"洗发护理",@"身体护理",@"口腔护理",@"卫生护理"];
    }else if ([self.menu isEqualToString:@"护肤美妆"]){
        self.leftMenus = @[@"面部护肤",@"香水",@"身体护肤"];
    }else if ([self.menu isEqualToString:@"家居清洁"]){
        self.leftMenus = @[@"清洁用品",@"衣物清洁",@"家庭清洁",@"居家日用",@"厨具"];
    }else if ([self.menu isEqualToString:@"母婴用品"]){
        self.leftMenus = @[@"奶粉",@"营养辅食",@"尿裤湿巾",@"喂养用品",@"洗护用品"];
    }else if ([self.menu isEqualToString:@"中外名酒"]){
        self.leftMenus = @[@"白酒",@"啤酒",@"葡萄酒",@"洋酒"];
    }else if ([self.menu isEqualToString:@"生鲜水果"]){
        self.leftMenus = @[@"水果",@"蔬菜",@"牛羊肉",@"海鲜",@"禽类蛋品"];
    }
    NSIndexPath* selectedCellIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self tableView:self.leftTableView didSelectRowAtIndexPath:selectedCellIndexPath];
    [self.leftTableView selectRowAtIndexPath:selectedCellIndexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
}

- (void) buy:(UIButton *) button {
    CGPoint pointInTable = [button convertPoint:button.bounds.origin toView:self.rightTableView];
    NSIndexPath *indexPath = [self.rightTableView indexPathForRowAtPoint:pointInTable];
    NSDictionary *d = self.rightDataSource[indexPath.row];
    NSString *name = d[@"name"];
    FirstDetailRightTableViewCell *cell = [self.rightTableView cellForRowAtIndexPath:indexPath];
    NSString *number = cell.numberLabel.text;
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"下单成功"
                                 message:[NSString stringWithFormat:@"您购买的%@个%@已成功下单，请耐心等待送达。",number,name]
                                 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"好的"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    //Handle your yes please button action here
                                }];
    [alert addAction:yesButton];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.leftTableView) {
        return [self.leftMenus count];
    }else return [self.rightDataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.leftTableView){
        FirstDetailLeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LEFTTABLEVIEWCELL];
        if(cell == nil){
            cell = [[FirstDetailLeftTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:LEFTTABLEVIEWCELL];
        }
        cell.menuNameLabel.text = self.leftMenus[indexPath.row];
        return cell;
    }else{
        FirstDetailRightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RIGHTTABLEVIEWCELL];
        if(cell == nil){
            cell = [[FirstDetailRightTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:RIGHTTABLEVIEWCELL];
        }
        [cell.productImageView sd_setImageWithURL:[NSURL URLWithString:self.rightDataSource[indexPath.row][@"url"]]];
        cell.productNameLabel.text = self.rightDataSource[indexPath.row][@"name"];
        NSString *string = [NSString stringWithFormat:@"￥%@元",self.rightDataSource[indexPath.row][@"price"]];
        NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:string];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor]
                                 range:[string rangeOfString:[NSString stringWithFormat:@"￥%@元",self.rightDataSource[indexPath.row][@"price"]]]];
        [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20.0]
                                 range:[string rangeOfString:[NSString stringWithFormat:@"%@",self.rightDataSource[indexPath.row][@"price"]]]];
        cell.priceLabel.attributedText = attributedString;
        [cell.buyButton removeTarget:nil  action:NULL forControlEvents:UIControlEventAllEvents];
        [cell.buyButton addTarget:self action:@selector(buy:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.leftTableView){
        [self.rightDataSource removeAllObjects];
        [self.rightDataSource addObjectsFromArray: self.dataSource[self.leftMenus[indexPath.row]]];
        [self.rightTableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
        [self.rightTableView reloadData];
    }else{
        
    }
}

#pragma mark -DZNEmptyDataSetSource

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    NSString *text = @"暂无数据";
    NSDictionary *attributes = @{NSFontAttributeName: DEFAULTFONT,
                                 NSForegroundColorAttributeName: DEFAULTTEXTCOLOR};
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView{
    return [UIColor whiteColor];
}

#pragma mark - getter and setter

- (UITableView *)leftTableView{
    if (!_leftTableView){
        _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                                       0,
                                                                       SCREEN_WIDTH/4,
                                                                       SCREEN_HEIGHT - NAVIGATIONBARHEIGHT - TABBARHEIGHT - MENUHEIGHT )];
        _leftTableView.backgroundView = nil;
        _leftTableView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
        _leftTableView.rowHeight = 60;
        _leftTableView.tableFooterView = [UIView new];
        _leftTableView.showsVerticalScrollIndicator = NO;
        [_leftTableView registerClass:[FirstDetailLeftTableViewCell class] forCellReuseIdentifier:LEFTTABLEVIEWCELL];
    }
    return _leftTableView;
}

- (UITableView *)rightTableView{
    if (!_rightTableView){
        _rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/4,
                                                                        0,
                                                                        SCREEN_WIDTH*3/4,
                                                                        SCREEN_HEIGHT - NAVIGATIONBARHEIGHT - TABBARHEIGHT - MENUHEIGHT )];
        _rightTableView.backgroundView = nil;
        _rightTableView.backgroundColor = [UIColor whiteColor];
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
        _rightTableView.rowHeight = 115;
        _rightTableView.tableFooterView = [UIView new];
        _rightTableView.showsVerticalScrollIndicator = NO;
        _rightTableView.separatorColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
        [_rightTableView registerClass:[FirstDetailRightTableViewCell class] forCellReuseIdentifier:RIGHTTABLEVIEWCELL];
        _rightTableView.emptyDataSetSource = self;
        _rightTableView.emptyDataSetDelegate = self;
    }
    return _rightTableView;
}

- (NSDictionary *) dataSource {
    return @{
             @"饮料":@[
                     @{@"name":@"康师傅冰红茶",@"price":@"2.50",@"url":@"http://image3.suning.cn/b2c/catentries/000000000128582171_1_200x200.jpg"},
                     @{@"name":@"康师傅绿茶",@"price":@"2.50",@"url":@"http://a2.att.hudong.com/12/07/20200000013920144729073742634_s.jpg"},
                     @{@"name":@"可口可乐",@"price":@"2.50",@"url":@"http://static.myhaohao.com/GoodsThumb/2012/11/20/20121120135918_50ab1c368e5c9.jpg"},
                     @{@"name":@"雪碧",@"price":@"2.50",@"url":@"http://img02.fn-mart.com/C/item/2013/1028/201310C280002603/_065144988_200x200.jpg"},
                     @{@"name":@"芬达",@"price":@"2.50",@"url":@"http://img01.fn-mart.com/C/item/2013/1028/201310C280002630/0_1_200x200.jpg"},
                     @{@"name":@"美年达",@"price":@"2.50",@"url":@"http://n.chinawutong.com/ThumbImg/s_635012984772877243.jpg"},
                     @{@"name":@"七喜",@"price":@"2.50",@"url":@"http://www.hsboss.com/file/upload/201401/15/1/07-46-07-83-90.jpg.middle.jpg"},
                     @{@"name":@"康师傅茉莉绿茶",@"price":@"2.50",@"url":@"http://thumb.webps.cn/i1/img/4/TB1SgLiHVXXXXXMapXXXXXXXXXX_!!0-item_pic.jpg_200x200.jpg"}
                     ],
             @"副食":@[
                     @{@"name":@"冰红茶",@"price":@"2.50",@"url":@""},
                     @{@"name":@"绿茶",@"price":@"2.50",@"url":@""},
                     @{@"name":@"可乐",@"price":@"2.50",@"url":@""},
                     @{@"name":@"雪碧",@"price":@"2.50",@"url":@""},
                     @{@"name":@"芬达",@"price":@"2.50",@"url":@""},
                     @{@"name":@"美年达",@"price":@"2.50",@"url":@""},
                     @{@"name":@"七夕",@"price":@"2.50",@"url":@""},
                     @{@"name":@"茉莉绿茶",@"price":@"2.50",@"url":@""}
                     ],
             @"小食品":@[
                     @{@"name":@"冰红茶",@"price":@"2.50",@"url":@""},
                     @{@"name":@"绿茶",@"price":@"2.50",@"url":@""},
                     @{@"name":@"可乐",@"price":@"2.50",@"url":@""},
                     @{@"name":@"雪碧",@"price":@"2.50",@"url":@""},
                     @{@"name":@"芬达",@"price":@"2.50",@"url":@""},
                     @{@"name":@"美年达",@"price":@"2.50",@"url":@""},
                     @{@"name":@"七夕",@"price":@"2.50",@"url":@""},
                     @{@"name":@"茉莉绿茶",@"price":@"2.50",@"url":@""}
                     ],
             @"罐头":@[
                     @{@"name":@"冰红茶",@"price":@"2.50",@"url":@""},
                     @{@"name":@"绿茶",@"price":@"2.50",@"url":@""},
                     @{@"name":@"可乐",@"price":@"2.50",@"url":@""},
                     @{@"name":@"雪碧",@"price":@"2.50",@"url":@""},
                     @{@"name":@"芬达",@"price":@"2.50",@"url":@""},
                     @{@"name":@"美年达",@"price":@"2.50",@"url":@""},
                     @{@"name":@"七夕",@"price":@"2.50",@"url":@""},
                     @{@"name":@"茉莉绿茶",@"price":@"2.50",@"url":@""}
                     ],
             @"茗茶":@[
                     @{@"name":@"冰红茶",@"price":@"2.50",@"url":@""},
                     @{@"name":@"绿茶",@"price":@"2.50",@"url":@""},
                     @{@"name":@"可乐",@"price":@"2.50",@"url":@""},
                     @{@"name":@"雪碧",@"price":@"2.50",@"url":@""},
                     @{@"name":@"芬达",@"price":@"2.50",@"url":@""},
                     @{@"name":@"美年达",@"price":@"2.50",@"url":@""},
                     @{@"name":@"七夕",@"price":@"2.50",@"url":@""},
                     @{@"name":@"茉莉绿茶",@"price":@"2.50",@"url":@""}
                     ],
             };
}

@end
