//
//  NSString+YDBSize.h
//  JSDropDownMenuDemo
//
//  Created by Yuangang Sheng on 2017/3/15.
//  Copyright © 2017年 jsfu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (YDBSize)

- (CGSize)textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;

@end
