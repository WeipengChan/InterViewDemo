//
//  BlockDemoViewController.m
//  InterviewDemo
//
//  Created by YunInfo on 14-2-28.
//  Copyright (c) 2014年 Robin. All rights reserved.
//

#import "BlockDemoViewController.h"

@interface BlockDemoViewController ()

@end

@implementation BlockDemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//内联block的情况
- (void)theWayToAvoidRetainCycle
{
    //在这里， 因为本身self强引用了observer，observer又持有了block，为了避免retain cycle，block只能弱引用
    __weak BlockDemoViewController * wself = self;
    _observer = [[NSNotificationCenter defaultCenter]
                 addObserverForName:@"TestNotificationKey"
                 object:nil queue:nil usingBlock:^(NSNotification *n) {
                     BlockDemoViewController * sself = wself;
                     if (sself) {//这里防御多线程下的self为nil的情况。
                         NSLog(@"%@", sself);
                     }
                     else {
                         NSLog(@"<self> dealloc before we could run this code.");
                     }
                 }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self blockTestSetter];
    [self blockTestSelfDot];
    
    [self theWayToAvoidRetainCycle];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *) convertIntToString:(NSInteger)paramInteger
                 usingBlockObject:(IntToStringConverter)paramBlockObject
{
    return paramBlockObject(self, paramInteger);
}

//非内联block的情况
- (void) blockTestSelfDot{
    HelloBlock myBlock= ^(void){
        self.stringProperty = @"Block Objects";
        NSLog(@"String property = %@", self.stringProperty);//现在运行ok，但以前的文档不推荐点的写法
    };
    myBlock();
};

- (void) blockTestSetter{
	HelloBlock myBlock= ^(void){
		[self setStringProperty:@"Block Objects"];
	    NSLog(@"self.stringProperty = %@", [self stringProperty]); //运行ok
	};
    myBlock();
};

-(void)dealloc
{
    if (_observer) {
        [[NSNotificationCenter defaultCenter] removeObserver:_observer];
    }
}

@end
