//
//  UIView+Styling.m
//  Pods
//
//  Created by John Gulbronson on 10/31/14.
//
//

#import "UIView+Styling.h"

@implementation UIView (Styling)

+ (styleBlock)styleBlockRoundedCornersWithBorderWidth:(CGFloat)borderWidth
                                             andColor:(UIColor *)color
{
    styleBlock block = ^(UIView *view){
        [view addBorderWithWidth:borderWidth radius:view.frame.size.height / 2 andColor:color];
    };
    return block;
}


+ (styleBlock)styleBlockWithWidth:(CGFloat)borderWidth
                           radius:(CGFloat)radius
                         andColor:(UIColor *)color
{
    styleBlock block = ^(UIView *view){
        [view addBorderWithWidth:borderWidth radius:radius andColor:color];
    };
    return block;
}

- (void)addBorderWithWidth:(CGFloat)borderWidth radius:(CGFloat)radius
{
    [self addBorderWithWidth:borderWidth radius:radius andColor:nil];
}

- (void)addBorderWithWidth:(CGFloat)borderWidth radius:(CGFloat)radius andColor:(UIColor *)color
{
    self.layer.borderWidth = borderWidth;
    self.layer.cornerRadius = radius;
    if(color)
        self.layer.borderColor = color.CGColor;
}

@end
