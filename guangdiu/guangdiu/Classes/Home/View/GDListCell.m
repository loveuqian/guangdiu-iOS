//
//  GDListCell.m
//  guangdiu
//
//  Created by WangShengFeng on 16/3/30.
//  Copyright © 2016年 WangShengFeng. All rights reserved.
//

#import "GDListCell.h"
#import "GDListModel.h"

#import <UIImageView+WebCache.h>

@interface GDListCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *fromsiteLabel;
@property (weak, nonatomic) IBOutlet UILabel *pubtimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;

@end

@implementation GDListCell

- (void)setModel:(GDListModel *)model
{
    _model = model;
    
    self.titleLabel.text = model.title;
    self.fromsiteLabel.text = model.fromsite;
    self.pubtimeLabel.text = model.pubtime;
    [self.picImageView sd_setImageWithURL:[NSURL URLWithString:model.image]];
}

@end
