//
//  DetailTableViewCell.m
//  NewComingProject
//
//  Created by Xiaodong Jiang on 10/11/2016.
//  Copyright © 2016 jxdwinter. All rights reserved.
//

#import "DetailTableViewCell.h"
#import "UIConfig.h"

@implementation DetailTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.font = [UIFont systemFontOfSize:16.0];
        self.nameLabel.textColor = DEFAULTCOLOR;
        [self.contentView addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).with.offset(10.0);
            make.right.equalTo(self.contentView.mas_right).with.offset(-10.0);
            make.left.equalTo(self.contentView.mas_left).with.offset(10.0);
            make.height.equalTo(@20.0);
        }];
        
        self.infoLabel = [[UILabel alloc] init];
        self.infoLabel.numberOfLines = 0;
        self.infoLabel.font = [UIFont systemFontOfSize:12.0];
        self.infoLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.infoLabel];
        [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameLabel.mas_bottom).with.offset(10.0);
            make.right.equalTo(self.contentView.mas_right).with.offset(-10.0);
            make.left.equalTo(self.contentView.mas_left).with.offset(10.0);
            make.height.equalTo(@40.0);
        }];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.font = [UIFont systemFontOfSize:14.0];
        self.timeLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.timeLabel];
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.infoLabel.mas_bottom).with.offset(10.0);
            make.left.equalTo(self.contentView.mas_left).with.offset(10.0);
            make.width.equalTo(@((SCREEN_WIDTH - 20.0)/2));
            make.height.equalTo(@20.0);
        }];
        
        self.phoneLabel = [[UILabel alloc] init];
        self.phoneLabel.textAlignment = NSTextAlignmentRight;
        self.phoneLabel.font = [UIFont systemFontOfSize:14.0];
        self.phoneLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.phoneLabel];
        [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.infoLabel.mas_bottom).with.offset(10.0);
            make.left.equalTo(self.timeLabel.mas_right).with.offset(0.0);
            make.width.equalTo(@((SCREEN_WIDTH - 20.0)/2));
            make.height.equalTo(@20.0);
        }];
    }
    return self;
}


@end
