//
//  FirstDtailLeftTableViewCell.m
//  NewComingProject
//
//  Created by Xiaodong Jiang on 03/11/2016.
//  Copyright © 2016 jxdwinter. All rights reserved.
//

#import "FirstDetailLeftTableViewCell.h"
#import "UIConfig.h"

@interface FirstDetailLeftTableViewCell ()

@property (nonatomic, strong) UIView *leftView;

@end

@implementation FirstDetailLeftTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.leftView = [[UIView alloc] init];
        self.leftView.backgroundColor = DEFAULTCOLOR;
        [self.contentView addSubview:self.leftView];
        [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(.0);
            make.left.equalTo(self.contentView.mas_left).with.offset(0.0);
            make.top.equalTo(self.contentView.mas_top).with.offset(0.0);
            make.width.equalTo(@5.0);
        }];
        
        self.menuNameLabel = [[UILabel alloc] init];
        self.menuNameLabel.textAlignment = NSTextAlignmentCenter;
        self.menuNameLabel.numberOfLines = 0;
        self.menuNameLabel.font = DEFAULTSMALLFONT;
        self.menuNameLabel.textColor = DEFAULTTEXTCOLOR;
        self.menuNameLabel.highlightedTextColor = DEFAULTCOLOR;
        [self.contentView addSubview:self.menuNameLabel];
        [self.menuNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).with.offset(10.0);
            make.left.equalTo(self.leftView.mas_right).with.offset(10.0);
            make.right.equalTo(self.contentView.mas_right).with.offset(-10.0);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-10.0);
        }];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];
    self.contentView.backgroundColor = selected ? [UIColor whiteColor] : [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    self.highlighted = selected;
    self.menuNameLabel.highlighted = selected;
    self.leftView.hidden = !selected;
}

@end
