//
//  JSTableViewCell.h
//  JSDropDownMenuDemo
//
//  Created by Yuangang Sheng on 2017/3/15.
//  Copyright © 2017年 jsfu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSTableViewCell : UITableViewCell

@property(nonatomic,readonly) UILabel *cellTextLabel;
@property(nonatomic,strong) UIImageView *cellAccessoryView;

-(void)setCellText:(NSString *)text align:(NSString*)align;

@end
