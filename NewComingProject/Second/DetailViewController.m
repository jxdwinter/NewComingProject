//
//  DetailViewController.m
//  NewComingProject
//
//  Created by Xiaodong Jiang on 10/11/2016.
//  Copyright © 2016 jxdwinter. All rights reserved.
//

#import "DetailViewController.h"
#import "UIConfig.h"
#import "DetailTableViewCell.h"

@interface DetailViewController () <UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configDataSource];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) configDataSource {
    if ([self.menuName isEqualToString:@"出租土地"]) {
        self.dataSource = @[@{@"name":@"自家五十亩土地招租",
                              @"info":@"自家五十亩优质土地招租，租金可谈。多年起租，价格更优。地址：呼兰区石人城镇石头村",
                              @"time":@"2016-10-22",
                              @"phone":@"18723548261"},
                            @{@"name":@"绥化肇东市 60亩 工业用地 出租",@"info":@"占地面积4万平方米，含办公楼厂房，库房，住宅，动力电，上下水，基本设施齐全，距离哈尔滨40分钟车程",
                              @"time":@"2016-11-01",
                              @"phone":@"18723832651"},
                            @{@"name":@"哈尔滨木兰县 1000亩 有林地 转让",@"info":@"林中有60多年成材的红松，落叶松，章松，山坡上有各种山野菜和中草药，有天然水库700亩，库里有各种野生杂鱼.",
                              @"time":@"2016-09-21",
                              @"phone":@"18723322651"},
                            @{@"name":@"哈尔滨双城区 530亩 工业用地 转让",
                              @"info":@"土地出售信息 地址：哈尔滨市双城区高铁小镇规划区内 临近：铁路、高铁、机场 面积：530亩 土地年限：2012年至2060年.",
                              @"time":@"2016-08-11",
                              @"phone":@"18723322252"}];
    }else if ([self.menuName isEqualToString:@"出租农机具"]) {
        self.dataSource = @[@{@"name":@"三一75、135挖掘机",
                              @"info":@"三一75、135；久保田15；山河智能70、90等品牌挖掘机(型号齐全)低价转让，纯土方车，机子手续齐全，车况良好.",
                              @"time":@"2016-07-23",
                              @"phone":@"18723548261"},
                            @{@"name":@"沃尔沃挖掘机",
                              @"info":@"沃尔沃60B、140B、210B、240B、360B等挖掘机-低价出售（型号齐全）公司实拍图片，原版原样，性能稳定,品牌值得信赖,手续齐全， 市场提供试机场地.",
                              @"time":@"2016-11-01",
                              @"phone":@"18723832651"},
                            @{@"name":@"出售雷沃GE25,12年5月份购买",
                              @"info":@"8成新，铂金斯发动机，110马力带增压，新式抛撒粉碎机，带卸粮筒，高2档速度快，车内带挂式大空调，因家有2辆，忙不过来，所以出售一辆，价格:3万6.",
                              @"time":@"2016-09-21",
                              @"phone":@"18723322651"},
                            @{@"name":@"液压翻转犁.平犁.拖拉机带翻地机.耕地机.旋地机",
                              @"info":@"液压翻转犁是拖拉机配套使用的，由双联分配器控制犁的升降和犁的翻转。主架采用16Mn厚壁矩管焊接，犁壁（犁镜）、犁铧（犁铲）均采用优质65Mn高锰钢",
                              @"time":@"2016-09-11",
                              @"phone":@"18723322252"}];
    }else if ([self.menuName isEqualToString:@"承租土地"]) {
        
    }else if ([self.menuName isEqualToString:@"承租农机具"]) {
        self.dataSource = @[@{@"name":@"求购沃尔沃挖掘机",
                              @"info":@"要求手续齐全，车况良好.",
                              @"time":@"2016-10-13",
                              @"phone":@"18723548261"},
                            @{@"name":@"求租勇猛收割机",
                              @"info":@"日租金500，每日结帐。",
                              @"time":@"2016-11-01",
                              @"phone":@"18723832651"},
                            @{@"name":@"求购大轮子拖拉机",
                              @"info":@"要求：8成新，车况良好，手续齐全.",
                              @"time":@"2016-09-21",
                              @"phone":@"18723322651"},
                            @{@"name":@"求租液压翻转犁.平犁",
                              @"info":@"价格面议.",
                              @"time":@"2016-09-11",
                              @"phone":@"18723322252"}];
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CELL = @"CELL";
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL];
    if(cell == nil){
        cell = [[DetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL];
    }
    NSDictionary *dic = self.dataSource[indexPath.row];
    cell.nameLabel.text = dic[@"name"];
    cell.infoLabel.text = dic[@"info"];
    cell.timeLabel.text = [NSString stringWithFormat:@"发布时间:%@",dic[@"time"]];
    cell.phoneLabel.text = [NSString stringWithFormat:@"联系电话:%@",dic[@"phone"]];;
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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


- (UITableView *) tableView {
    if (!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0,0.0,SCREEN_WIDTH,SCREEN_HEIGHT - NAVIGATIONBARHEIGHT - MENUHEIGHT )];
        _tableView.backgroundView = nil;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 120.0;
        _tableView.tableFooterView = [UIView new];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
        _tableView.emptyDataSetSource = self;
        _tableView.emptyDataSetDelegate = self;
    }
    return _tableView;
}

@end
