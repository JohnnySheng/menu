//
//  ViewController.m
//  JSDropDownMenuDemo
//
//  Created by Jsfu on 15-1-12.
//  Copyright (c) 2015年 jsfu. All rights reserved.
//

#import "YDBMenuViewController.h"
#import "JSDropDownMenu.h"
#import "JSIndexPath.h"

@interface YDBMenuViewController ()<JSDropDownMenuDataSource,JSDropDownMenuDelegate>{
    
    NSMutableArray *_data1;
    NSMutableArray *_data2;
    NSMutableArray *_data3;
    
    NSInteger _currentData1Index;
    NSInteger _currentData2Index;
    NSInteger _currentData3Index;
}

@end

@implementation YDBMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _data1 = _data2 = _data3 = [NSMutableArray arrayWithObjects:@"智能排序", @"离我最近", @"评价最高", @"最新发布", @"人气最高", @"价格最低", @"价格最高", nil];
    
    JSDropDownMenu *menu = [[JSDropDownMenu alloc] initWithOrigin:CGPointMake(0, 0) andHeight:45];
    menu.indicatorColor = [UIColor colorWithRed:175.0f/255.0f green:175.0f/255.0f blue:175.0f/255.0f alpha:1.0];
    menu.separatorColor = [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0];
    menu.textColor = [UIColor colorWithRed:83.f/255.0f green:83.f/255.0f blue:83.f/255.0f alpha:1.0f];
    menu.selectedTextColor = [UIColor redColor];
    menu.dataSource = self;
    menu.delegate = self;
    
    [self.view addSubview:menu];
}


- (NSInteger)numberOfColumnsInMenu:(JSDropDownMenu *)menu {
    return 3;
}

-(NSInteger)currentLeftSelectedRow:(NSInteger)column{
    switch (column) {
        case 0:
            return _currentData1Index;
            break;
        case 1:
            return _currentData2Index;
            break;
        default:
            return _currentData3Index;
            break;
    }
}

- (NSInteger)menu:(JSDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow{
    switch (column) {
        case 0:
            return _data1.count;
            break;
        case 1:
            return _data2.count;
            break;
        default:
            return _data3.count;
            break;
    }
   
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForColumn:(NSInteger)column{
    switch (column) {
        case 0:
            return _data1[0];
            break;
        case 1:
            return _data2[0];
            break;
        default:
            return _data3[0];
            break;
    }
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForRowAtIndexPath:(JSIndexPath *)indexPath {
    
    switch (indexPath.column) {
        case 0:
            return _data1[indexPath.row];
            break;
        case 1:
            return _data2[indexPath.row];
            break;
        default:
            return _data3[indexPath.row];
            break;
    }
}

- (void)menu:(JSDropDownMenu *)menu didSelectRowAtIndexPath:(JSIndexPath *)indexPath {
    
    switch (indexPath.column) {
        case 0:
            _currentData1Index = indexPath.row;
            break;
        case 1:
            _currentData2Index = indexPath.row;
            break;
        default:
            _currentData3Index = indexPath.row;
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
