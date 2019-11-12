//
//  SPPerson.h
//  KVO
//
//  Created by JackMa on 2019/11/12.
//  Copyright © 2019 fire. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SPPerson : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *nick;
@property (nonatomic, copy) NSString *downloadProgress;
@property (nonatomic, assign) double writtenData;
@property (nonatomic, assign) double totalData;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end


NS_ASSUME_NONNULL_END
