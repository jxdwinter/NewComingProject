//
//  FirstDetailRightTableViewCell.h
//  NewComingProject
//
//  Created by Xiaodong Jiang on 03/11/2016.
//  Copyright © 2016 jxdwinter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TTTAttributedLabel.h>

#define RIGHTTABLEVIEWCELL @"RIGHTTABLEVIEWCELL"

@interface FirstDetailRightTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *productImageView;
@property (nonatomic, strong) TTTAttributedLabel *productNameLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UIButton *buyButton;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UIButton *plusButton;
@property (nonatomic, strong) UIButton *minusButton;

@end
