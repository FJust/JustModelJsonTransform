//
//  JustModel.m
//  JustModelJsonTransform
//
//  Created by Just on 2017/5/19.
//  Copyright © 2017年 Just. All rights reserved.
//

#import "JustModel.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation JustModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        for (NSString *key in dict.allKeys) {
            id value = [dict objectForKey:key];
            SEL setter = NSSelectorFromString([NSString stringWithFormat:@"set%@:", key.capitalizedString]);
            if (setter) {
                ((void (*)(id, SEL, id))objc_msgSend)(self, setter, value);
            }
        }
    }
    
    return self;
}

- (NSDictionary *)covertToDict{
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList(self.class, &count);
    NSMutableDictionary *resultDict = [@{} mutableCopy];

    for (int i = 0; i < count; i ++) {
        const void *propertyName = property_getName(properties[i]);
        NSString *name = [NSString stringWithUTF8String:propertyName];
        SEL getter = NSSelectorFromString(name);
        if (getter) {
            id value = ((id (*)(id, SEL))objc_msgSend)(self, getter);
            if (value) {
                resultDict[name] = value;
            } else {
                resultDict[name] = @"字典set一个nil值是没有意义的！";
            }
        }
    }
    free(properties);
    return resultDict;
}

@end
