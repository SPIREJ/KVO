//
//  SPKVOSecondViewController.m
//  KVO
//
//  Created by JackMa on 2019/11/12.
//  Copyright © 2019 fire. All rights reserved.
//

#import "SPKVOSecondViewController.h"
#import <objc/runtime.h>
#import "Student.h"

@interface SPKVOSecondViewController ()
@property (nonatomic, strong) Person *person;
@property (nonatomic, strong) Student *student;
@end

@implementation SPKVOSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Person -- ClassAllMethod");
    [self printClassAllMethod:[Person class]];
    NSLog(@"Student -- ClassAllMethod");
    [self printClassAllMethod:[Student class]];

    NSLog(@"Person -- Classes");
    [self printClasses:[Person class]];
    NSLog(@"Student -- Classes");
    [self printClasses:[Student class]];
    
    
    self.person = [[Person alloc] init];
    [self.person addObserver:self forKeyPath:@"nickName" options:(NSKeyValueObservingOptionNew) context:nil];
    [self.person addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew) context:nil];
    
    NSLog(@"观察者之后");
    [self printClassAllMethod:[Person class]];
    [self printClasses:[Person class]];
    
    NSLog(@"NSKVONotifying_Person");
    [self printClassAllMethod:NSClassFromString(@"NSKVONotifying_Person")];
    [self printClasses:NSClassFromString(@"NSKVONotifying_Person")];
    
    // 赋值
    self.person.name = @"spirej";
    self.person->nickName = @"nick_spirej";
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@", change);
}

- (void)dealloc {
    [self.person removeObserver:self forKeyPath:@"nickName"];
    [self.person removeObserver:self  forKeyPath:@"name"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"实际情况:%@-%@",self.person.name,self.person->nickName);
}

#pragma mark - 遍历方法

- (void)printClassAllMethod:(Class)cls {
    unsigned int count = 0;
    Method *methodList = class_copyMethodList(cls, &count);
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        Method method = methodList[i];
        SEL sel = method_getName(method);
        IMP imp = class_getMethodImplementation(cls, sel);
        NSLog(@"%@ -- %p", NSStringFromSelector(sel), imp);
        [mArray addObject:NSStringFromSelector(sel)];
    }
    NSLog(@"allMethod = %@", mArray);
}


#pragma mark - 遍历类及子类

- (void)printClasses:(Class)cls {
    // 注册类的总数
    int count = objc_getClassList(NULL, 0);
    // 创建一个数组，其中包含给定的对象
    NSMutableArray *mArray = [NSMutableArray arrayWithObject:cls];
    // 获取所有已注册的类
    Class *classes = (Class *)malloc(sizeof(Class) * count);
    objc_getClassList(classes, count);
    for (int i = 0; i < count; i++) {
        if (cls == class_getSuperclass(classes[i])) {
            [mArray addObject:classes[i]];
        }
    }
    free(classes);
    NSLog(@"classes = %@", mArray);
}


@end
