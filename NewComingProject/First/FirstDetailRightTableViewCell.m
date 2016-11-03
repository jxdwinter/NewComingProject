//
//  FirstDetailRightTableViewCell.m
//  NewComingProject
//
//  Created by Xiaodong Jiang on 03/11/2016.
//  Copyright © 2016 jxdwinter. All rights reserved.
//

#import "FirstDetailRightTableViewCell.h"
#import "UIConfig.h"

@implementation FirstDetailRightTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.productImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.productImageView];
        [self.productImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).with.offset(10.0);
            make.left.equalTo(self.contentView.mas_left).with.offset(10.0);
            make.width.equalTo(@60.0);
            make.height.equalTo(@60.0);
        }];
        
        self.productNameLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
        self.productNameLabel.verticalAlignment = TTTAttributedLabelVerticalAlignmentTop;
        self.productNameLabel.numberOfLines = 0;
        self.productNameLabel.font = DEFAULTFONT;
        self.productNameLabel.textColor = DEFAULTTEXTCOLOR;
        [self.contentView addSubview:self.productNameLabel];
        [self.productNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).with.offset(10.0);
            make.left.equalTo(self.productImageView.mas_right).with.offset(10.0);
            make.right.equalTo(self.contentView.mas_right).with.offset(-10.0);
            make.height.equalTo(@40.0);
        }];

        self.priceLabel = [[UILabel alloc] init];
        self.priceLabel.font = DEFAULTSMALLFONT;
        self.priceLabel.textColor = DEFAULTTEXTCOLOR;
        [self.contentView addSubview:self.priceLabel];
        [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.productNameLabel.mas_bottom).with.offset(0.0);
            make.left.equalTo(self.productImageView.mas_right).with.offset(10.0);
            make.right.equalTo(self.contentView.mas_right).with.offset(-10.0);
            make.height.equalTo(@20.0);
        }];

        self.buyButton = [[UIButton alloc] init];
        [self.buyButton.layer setMasksToBounds:YES];
        [self.buyButton.layer setCornerRadius:2.0];
        self.buyButton.titleLabel.font = [UIFont systemFontOfSize:10.0];
        self.buyButton.backgroundColor = DEFAULTCOLOR;
        [self.buyButton setTitle:@"立即购买" forState:UIControlStateNormal];
        [self addSubview:self.buyButton];
        [self.buyButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.priceLabel.mas_bottom).with.offset(10.0);
            make.right.equalTo(self.contentView.mas_right).with.offset(-10.0);
            make.width.equalTo(@((SCREEN_WIDTH*3/4 - 100.0)/2));
            make.height.equalTo(@25.0);
        }];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
