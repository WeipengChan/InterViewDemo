//
//  BlockDemoViewController.h
//  InterviewDemo
//
//  Created by YunInfo on 14-2-28.
//  Copyright (c) 2014年 Robin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  void (^HelloBlock)(void);
typedef NSString* (^IntToStringConverter)(id self, NSInteger paramInteger);

@interface BlockDemoViewController : UIViewController

@property (nonatomic, strong) NSString *stringProperty;//类属性，用于演示
@property (nonatomic, strong) id observer;
@end
