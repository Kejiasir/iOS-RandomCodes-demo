//
//  UIView+Extension.h
//  iOS-RandomCodes-demo
//
//  Created by Arvin on 16/9/19.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat w;
@property (nonatomic, assign) CGFloat h;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
- (void)showMessage:(NSString *)message duration:(NSTimeInterval)duration;

@end
