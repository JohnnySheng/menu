//
//  JSCollectionViewCell.h
//  JSDropDownMenuDemo
//
//  Created by Yuangang Sheng on 2017/3/15.
//  Copyright © 2017年 jsfu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSCollectionViewCell:UICollectionViewCell

@property(nonatomic,strong) UILabel *textLabel;
@property(nonatomic,strong) UIImageView *accessoryView;

-(void)removeAccessoryView;

@end
