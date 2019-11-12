//
//  SPPerson.m
//  KVO
//
//  Created by JackMa on 2019/11/12.
//  Copyright © 2019 fire. All rights reserved.
//

#import "SPPerson.h"

@implementation SPPerson

// 路径合集
// 下载进度 -- writtenData/totalData

+ (NSSet<NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key{
    
    NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
    if ([key isEqualToString:@"downloadProgress"]) {
        NSArray *affectingKeys = @[@"totalData", @"writtenData"];
        keyPaths = [keyPaths setByAddingObjectsFromArray:affectingKeys];
    }
    return keyPaths;
}

- (NSString *)downloadProgress {
    if (self.writtenData == 0) {
        self.writtenData = 10;
    }
    if (self.totalData == 0) {
        self.totalData = 100;
    }
    return [[NSString alloc] initWithFormat:@"%f",1.0f*self.writtenData/self.totalData];
}

// 自动观察开关
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    return YES;
}

// 手动观察
//- (void)setName:(NSString *)name {
//    [self willChangeValueForKey:@"name"];
//    _name = name;
//    [self didChangeValueForKey:@"name"];
//}
//
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
