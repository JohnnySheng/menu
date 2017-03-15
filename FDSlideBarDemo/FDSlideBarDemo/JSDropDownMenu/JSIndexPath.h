//
//  JSIndexPath.h
//  JSDropDownMenuDemo
//
//  Created by Yuangang Sheng on 2017/3/15.
//  Copyright © 2017年 jsfu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSIndexPath : NSObject

@property (nonatomic, assign) NSInteger column;
@property (nonatomic, assign) NSInteger leftOrRight;
@property (nonatomic, assign) NSInteger leftRow;
@property (nonatomic, assign) NSInteger row;

- (instancetype)initWithColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow row:(NSInteger)row;
+ (instancetype)indexPathWithCol:(NSInteger)col leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow row:(NSInteger)row;

@end
