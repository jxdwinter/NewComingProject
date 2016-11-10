//
//  SecondViewController.m
//  NewComingProject
//
//  Created by Xiaodong Jiang on 03/11/2016.
//  Copyright © 2016 jxdwinter. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondTabbarViewController.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
#import <BaiduMapAPI_Search/BMKSearchComponent.h>//引入检索功能所有的头文件
#import <BaiduMapAPI_Cloud/BMKCloudSearchComponent.h>//引入云检索功能所有的头文件
#import <BaiduMapAPI_Location/BMKLocationComponent.h>//引入定位功能所有的头文件
#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>//引入计算工具所有的头文件
#import <BaiduMapAPI_Radar/BMKRadarComponent.h>//引入周边雷达功能所有的头文件
#import <BaiduMapAPI_Map/BMKMapView.h>//只引入所需的单个头文件

@interface SecondViewController () <BMKMapViewDelegate,BMKLocationServiceDelegate>

@property (nonatomic, strong) BMKMapView* mapView;
@property (nonatomic, strong) BMKLocationService *locService;
@property (nonatomic, strong) BMKPointAnnotation* annotation;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"滴滴速配";
    
    self.mapView = [[BMKMapView alloc]initWithFrame:self.view.frame];
    self.mapView.zoomLevel = 15;
    self.view = self.mapView;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self.mapView viewWillAppear];
    self.mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.mapView viewWillDisappear];
    self.mapView.delegate = nil; // 不用时，置nil
}

- (void) viewDidAppear:(BOOL)animated {
    //启动LocationService
    [self.locService startUserLocationService];
}

- (void) viewDidDisappear:(BOOL)animated {
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//实现相关delegate 处理位置信息更新
//处理方向变更信息
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation{
    NSLog(@"heading is %@",userLocation.heading);
}

//处理位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation{
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    //追踪到当前位置
    self.mapView.centerCoordinate = CLLocationCoordinate2DMake(userLocation.location.coordinate.latitude, userLocation.location.coordinate.longitude);
    //显示用户位置蓝点
    //self.mapView.showsUserLocation = YES;//显示定位图层
    [self.mapView updateLocationData:userLocation];
    //描点
    CLLocationCoordinate2D coor;
    coor.latitude = userLocation.location.coordinate.latitude;
    coor.longitude = userLocation.location.coordinate.longitude;
    self.annotation.coordinate = coor;
    self.annotation.title = @"  查看周边发布  ";
    [self.mapView addAnnotation:self.annotation];
    
    //不再继续定位
    [self.locService stopUserLocationService];
}

// Override
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation{
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
        newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
        newAnnotationView.animatesDrop = YES;// 设置该标注点动画显示
        return newAnnotationView;
    }
    return nil;
}
/**
 *当点击annotation view弹出的泡泡时，调用此接口
 *@param mapView 地图View
 *@param view 泡泡所属的annotation view
 */
- (void)mapView:(BMKMapView *)mapView annotationViewForBubble:(BMKAnnotationView *)view {
    SecondTabbarViewController *secondTabbarViewController = [[SecondTabbarViewController alloc] init];
    secondTabbarViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:secondTabbarViewController animated:YES];
}

//标注 单击事件
-(void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view {

}

- (BMKPointAnnotation *)annotation{
    if (!_annotation) {
        _annotation = [[BMKPointAnnotation alloc]init];
    }
    return _annotation;
}

- (BMKLocationService *)locService{
    if (!_locService) {
        //初始化BMKLocationService
        _locService = [[BMKLocationService alloc]init];
        _locService.delegate = self;
    }
    return _locService;
}

@end
