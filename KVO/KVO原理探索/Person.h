//
//  Person.h
//  KVO
//
//  Created by JackMa on 2019/11/12.
//  Copyright © 2019 fire. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
{
    @public
    NSString *nickName;
}

@property (nonatomic, copy) NSString *name;

- (void)run;

- (void)work;

@end

NS_ASSUME_NONNULL_END
