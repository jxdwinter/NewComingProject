//
//  UIConfig.h
//  NewComingProject
//
//  Created by Xiaodong Jiang on 03/11/2016.
//  Copyright © 2016 jxdwinter. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <MBProgressHUD.h>
#import <YYModel.h>
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

#define DEFAULTCOLOR [UIColor colorWithRed:(32/255.0) green:(141/255.0) blue:(58/255.0) alpha:1.0]
#define DEFAULTGRAYCOLOR [UIColor colorWithRed:(191/255.0) green:(191/255.0) blue:(191/255.0) alpha:1.0]
#define DEFAULTTEXTCOLOR [UIColor colorWithRed:(100/255.0) green:(100/255.0) blue:(100/255.0) alpha:1.0]
#define DEFAULTLIGHTGRAYCOLOR [UIColor lightGrayColor]

#define DEFAULTFONT [UIFont systemFontOfSize:14.0]
#define DEFAULTSMALLFONT [UIFont systemFontOfSize:12.0]
#define DEFAULNAVIGATIONBARFONT [UIFont systemFontOfSize:17.0]

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define NAVIGATIONBARHEIGHT 64.0
#define TABBARHEIGHT 49.0
#define SEARCHBARHEIGHT 44.0
#define STATUSBARHEIGHT 20.0
#define MENUHEIGHT 60.0

@interface UIConfig : NSObject

@end
