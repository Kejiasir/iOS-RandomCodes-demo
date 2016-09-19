//
//  YYRandomCodes.m
//  iOS-RandomCodes-demo
//
//  Created by Arvin on 16/9/18.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import "YYRandomCodes.h"

#define LINECOUNT 6  // 干扰线数量
#define CHARCOUNT 4  // 字符串数量

@interface YYRandomCodes ()
@property (nonatomic, strong) NSArray *changeArray;
@property (nonatomic, strong) NSMutableString *changeString;
@end

@implementation YYRandomCodes

/// 代码创建
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[self randomColor]];
        [self.layer setCornerRadius:CGRectGetHeight(frame)*.1f];
        [self.layer setMasksToBounds:YES];
        [self didChangeRandomStr];
    }
    return self;
}

/// storyboard/xib创建, 需要自行设置圆角
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setBackgroundColor:[self randomColor]];
        [self didChangeRandomStr];
    }
    return self;
}

#pragma mark - private method
- (void)didChangeRandomStr {
    self.changeArray = [[NSArray alloc] initWithContentsOfFile:
                        [[NSBundle mainBundle] pathForResource:@"RandomCodes.plist" ofType:nil]];
    self.changeString = [[NSMutableString alloc] initWithCapacity:CHARCOUNT];
    for(NSInteger i = 0; i < CHARCOUNT; i++) {
        NSInteger index = arc4random_uniform((u_int32_t)[self.changeArray count]);
        NSMutableString *getStr = [self.changeArray objectAtIndex:index];
        self.changeString = [[self.changeString stringByAppendingString:getStr] mutableCopy];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.CurrentStrBlock) {
            self.CurrentStrBlock(self.changeString);
        }
    });
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self didChangeRandomStr];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    self.backgroundColor = [self randomColor];
    NSString *text = [NSString stringWithFormat:@"%@",self.changeString];
    CGSize size = [@"S" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    NSInteger width = rect.size.width / text.length - size.width;
    NSInteger height = rect.size.height - size.height;
    CGPoint point; float pX, pY;
    for (NSInteger i = 0; i < text.length; i++) {
        pX = arc4random() % width + rect.size.width / text.length * i;
        pY = arc4random() % height;
        point = CGPointMake(pX, pY);
        unichar cStr = [text characterAtIndex:i];
        NSString *string = [NSString stringWithFormat:@"%C", cStr];
        CGAffineTransform matrix = CGAffineTransformMake(1, 0, tanf(15 * (CGFloat)M_PI / 180), 1, 0, 0);
        UIFontDescriptor *descriptor = [UIFontDescriptor fontDescriptorWithName:
                                        [UIFont systemFontOfSize:20].fontName matrix:matrix];
        UIFont *italicFont= [UIFont fontWithDescriptor:descriptor size:arc4random_uniform(10)+15];
        [string drawAtPoint:point withAttributes:@{NSFontAttributeName:italicFont,
                                                   NSForegroundColorAttributeName:[self randomColor]}];
    }
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    for(NSInteger i = 0; i < LINECOUNT; i++) {
        UIColor *color = [self randomColor];
        CGContextSetStrokeColorWithColor(context, [color CGColor]);
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextMoveToPoint(context, pX, pY);
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextAddLineToPoint(context, pX, pY);
        CGContextStrokePath(context);
    }
}

- (UIColor *)randomColor {
    CGFloat r = arc4random_uniform(256)/255.0f;
    CGFloat g = arc4random_uniform(256)/255.0f;
    CGFloat b = arc4random_uniform(256)/255.0f;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0f];
}

- (void)dealloc {
    //NSLog(@"%s",__func__);
}

@end
