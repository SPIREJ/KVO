//
//  SPKVOFirstViewController.m
//  KVO
//
//  Created by JackMa on 2019/11/12.
//  Copyright © 2019 fire. All rights reserved.
//

#import "SPKVOFirstViewController.h"
#import "SPStudent.h"

static void *PersonNameContext = &PersonNameContext;
static void *PersonNickContext = &PersonNickContext;
static void *StudentNameContext = &StudentNameContext;
static void *StudentNickContext = &StudentNickContext;

@interface SPKVOFirstViewController ()

@property (nonatomic, strong) SPPerson *person;
@property (nonatomic, strong) SPStudent *student;

@end

@implementation SPKVOFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.person = [SPPerson new];
    self.student = [SPStudent new];
    
//    self.person.dataArray = @[@"world"].mutableCopy;
    
    // 注册观察
    [self.person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:PersonNameContext];
    [self.person addObserver:self forKeyPath:@"age" options:(NSKeyValueObservingOptionNew) context:NULL];
    [self.student addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew) context:StudentNameContext];

    [self.person addObserver:self forKeyPath:@"dataArray" options:NSKeyValueObservingOptionNew context:NULL];
        
    // 路径集合
    
    [self.person addObserver:self forKeyPath:@"downloadProgress" options:(NSKeyValueObservingOptionNew) context:NULL];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.person.name = @"spirej";
    self.student.name = @"sp_spirej";
    
    // 集合，取值和赋值过程和普通类型不一样
//    [self.person.dataArray addObject:@"hello"];
    [[self.person mutableArrayValueForKey:@"dataArray"] addObject:@"joo"];
    
    self.person.writtenData += 10;
    self.person.totalData  += 1;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if (context == PersonNameContext) {
        // ...
    }else if (context == StudentNameContext) {
        // ...
    }else if (context == PersonNickContext) {
        // ...
    }
    
//    NSLog(@"%@ -- %@", change, object);
    
    NSLog(@"%@",change);
    NSLog(@"downloadProgress == %@",self.person.downloadProgress);
}

- (void)dealloc {
    [self.person removeObserver:self forKeyPath:@"name" context:PersonNameContext];
    [self.person removeObserver:self forKeyPath:@"age"];
    [self.student removeObserver:self forKeyPath:@"name" context:StudentNameContext];
    [self.person removeObserver:self forKeyPath:@"dataArray"];
    [self.person removeObserver:self forKeyPath:@"downloadProgress"];
}


@end
