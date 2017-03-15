//
//  AnotherViewController.m
//  FDSlideBarDemo
//
//  Created by fergusding on 15/7/14.
//  Copyright (c) 2015年 fergusding. All rights reserved.
//

#import "ViewController.h"
#import "FDSlideBar.h"
#import "FDSlideContentView.h"
#import "YDBMenuViewController.h"

@interface ViewController () <FDSlideContentViewDataSource>

@property (strong, nonatomic) FDSlideBar *slideBar;
@property (strong, nonatomic) FDSlideContentView *slideContentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0 / 255.0 green:128 / 255.0 blue:128 / 255.0 alpha:1.0];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    [self setupSlideBar];
    [self setupSlideContentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupSlideContentView{
    CGRect frame = CGRectMake(0, CGRectGetMaxY(self.slideBar.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - CGRectGetMaxY(self.slideBar.frame));
    self.slideContentView = [[FDSlideContentView alloc] initWithFrame:frame];
    self.slideContentView.dataSource = self;
    [self.slideContentView slideContentViewScrollFinished:^(NSUInteger index) {
        
        [self.slideBar selectSlideBarItemAtIndex:index];
        NSLog(@"the current page is %lu", (unsigned long)index);
    }];
    
    [self.view addSubview:self.slideContentView];
}

#pragma mark - slide content view datasource
// Get the view controller for the index of the content view
- (UIViewController *)slideContentView:(FDSlideContentView *)contentView viewControllerForIndex:(NSUInteger)index{
    if (index == 1) {
        UIViewController *aVC = [UIViewController new];
        [aVC.view setBackgroundColor:[UIColor purpleColor]];
        return aVC;
    }else{
        YDBMenuViewController *aVC = [YDBMenuViewController new];
        return aVC;
    }
    
}

// Get the num of content view
- (NSInteger)numOfContentView{
    return 4;
}
#pragma mark - Private

// Set up a slideBar and add it into view
- (void)setupSlideBar {
    FDSlideBar *sliderBar = [[FDSlideBar alloc] init];
    sliderBar.backgroundColor = [UIColor colorWithRed:0 / 255.0 green:128 / 255.0 blue:128 / 255.0 alpha:1.0];
    
    // Init the titles of all the item
    sliderBar.itemsTitle = @[@"用户", @"标签", @"活动", @"内容"];
    
    // Set some style to the slideBar
    sliderBar.itemColor = [UIColor whiteColor];
    sliderBar.itemSelectedColor = [UIColor orangeColor];
    sliderBar.sliderColor = [UIColor orangeColor];
    
    // Add the callback with the action that any item be selected
    [sliderBar slideBarItemSelectedCallback:^(NSUInteger idx) {
        [self.slideContentView scrollSlideContentViewToIndex:idx];
//        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:idx inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
    }];
    [self.view addSubview:sliderBar];
    _slideBar = sliderBar;
}

@end
