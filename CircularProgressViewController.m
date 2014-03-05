//
//  CircularProgressViewController.m
//  InterviewDemo
//
//  Created by YunInfo on 14-3-3.
//  Copyright (c) 2014年 Robin. All rights reserved.
//

#import "CircularProgressViewController.h"

@interface CircularProgressViewController ()

@end

@implementation CircularProgressViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        //get a audio path
        NSString *audioPath = [[NSBundle mainBundle] pathForResource:@"In my song" ofType:@"mp3"];
        
        //set back color & progress color
        UIColor *backColor = [UIColor colorWithRed:236.0/255.0
                                             green:236.0/255.0
                                              blue:236.0/255.0
                                             alpha:1.0];
        UIColor *progressColor = [UIColor colorWithRed:82.0/255.0
                                                 green:135.0/255.0
                                                  blue:237.0/255.0
                                                 alpha:1.0];
        
        //alloc CircularProgressView instance
         //set CircularProgressView delegate
        self.circularProgressView.delegate = self;
        
        //add CircularProgressView
        [self.view addSubview:self.circularProgressView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
