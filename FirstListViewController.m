//
//  FirstListViewController.m
//  InterviewDemo
//
//  Created by YunInfo on 14-2-28.
//  Copyright (c) 2014年 Robin. All rights reserved.
//

#import "FirstListViewController.h"
#import "BlockDemoViewController.h"

@interface FirstListViewController ()

@end

@implementation FirstListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
    
}
- (CGFloat)tableView:(UITableView *)tableview heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    switch (indexPath.row) {
		case 0:
			cell.textLabel.text = @"1. arc strong weak";
			break;
		case 1:
			cell.textLabel.text = @"2. CAKeyframeAnimation";
			break;
		case 2:
			cell.textLabel.text = @"3. M & kvo ";
			break;
        default:
			break;
	}
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;

    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *controller = nil;
	switch (indexPath.row) {
		case 0:
		{
			controller = [[BlockDemoViewController alloc] init];
		}
			break;
		case 1:
		{
			//controller = [[ZBPathViewController alloc] init];
		}
			break;
		case 2:
		{
			//controller = [[ZBTransitionViewController alloc] init];
		}
			break;
		default:
			break;
	}
	if (controller) {
		[self.navigationController pushViewController:controller animated:YES];
	}

}


@end
