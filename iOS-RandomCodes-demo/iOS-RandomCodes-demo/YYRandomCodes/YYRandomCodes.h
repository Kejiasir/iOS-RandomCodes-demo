//
//  YYRandomCodes.h
//  iOS-RandomCodes-demo
//
//  Created by Arvin on 16/9/18.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYRandomCodes : UIView
/// 当前的随机字符串
@property (nonatomic, copy) void(^CurrentStrBlock)(NSString *);
@end
