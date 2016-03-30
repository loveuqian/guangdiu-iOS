//
//  GDHotModel.h
//  guangdiu
//
//  Created by WangShengFeng on 16/3/30.
//  Copyright © 2016年 WangShengFeng. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 "id": 2399157,
 "title": "Adidas 阿迪达斯 多功能越野鞋 B27253 \t 218元包邮（268-50）",
 "image": "http://7bv7rb.com1.z0.glb.clouddn.com/dea6ee710541f2da96e168ad631e9813.jpg"
 */

@interface GDHotModel : NSObject

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *image;

@end
