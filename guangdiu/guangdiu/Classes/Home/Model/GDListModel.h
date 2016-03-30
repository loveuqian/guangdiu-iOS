//
//  GDListModel.h
//  guangdiu
//
//  Created by WangShengFeng on 16/3/30.
//  Copyright © 2016年 WangShengFeng. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 {
 buyurl = "http://detail.tmall.com/item.htm?id=521024715021";
 cates = 0;
 country = cn;
 dealfeature = 0;
 fromsite = "没得比";
 id = 2398747;
 iftobuy = 1;
 image = "http://7bv7rb.com1.z0.glb.clouddn.com/625c37fc957a58e9ed6fedabc7f530b1.jpg";
 imgh = 250;
 imgw = 250;
 mall = "天猫";
 pubtime = "2016-03-30 10:21:09";
 title = "肯客 韩国卡通超薄迷你 皮套 9.9元包邮";
 },
 */

@interface GDListModel : NSObject

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, copy) NSString *pubtime;
@property (nonatomic, copy) NSString *buyurl;
@property (nonatomic, copy) NSString *fromsite;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, strong) NSNumber *iftobuy;
@property (nonatomic, strong) NSArray *cates;
@property (nonatomic, copy) NSString *dealfeature;
@property (nonatomic, strong) NSNumber *imgh;
@property (nonatomic, copy) NSString *mall;
@property (nonatomic, strong) NSNumber *imgw;
@property (nonatomic, copy) NSString *country;

@end
