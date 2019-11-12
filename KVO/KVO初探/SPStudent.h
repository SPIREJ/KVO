//
//  SPStudent.h
//  KVO
//
//  Created by JackMa on 2019/11/12.
//  Copyright © 2019 fire. All rights reserved.
//

#import "SPPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface SPStudent : SPPerson<NSCopying>

+ (instancetype)shareInstance;

@end

NS_ASSUME_NONNULL_END
