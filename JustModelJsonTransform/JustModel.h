//
//  JustModel.h
//  JustModelJsonTransform
//
//  Created by Just on 2017/5/19.
//  Copyright © 2017年 Just. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JustModel : NSObject

@property (nonatomic, copy) NSString *name; // 姓名
@property (nonatomic, strong) NSNumber *age; // 年龄
@property (nonatomic, copy) NSString *occupation; // 职业
@property (nonatomic, copy) NSString *nationality; // 国籍

- (instancetype)initWithDict:(NSDictionary *)dict;

- (NSDictionary *)covertToDict;

@end
