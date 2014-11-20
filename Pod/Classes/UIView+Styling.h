//
//  UIView+Styling.h
//  Pods
//
//  Created by John Gulbronson on 10/31/14.
//
//

#import <UIKit/UIKit.h>

typedef void (^styleBlock)(UIView *view);

@interface UIView (Styling)

+ (styleBlock)styleBlockWithWidth:(CGFloat)borderWidth
                           radius:(CGFloat)radius
                         andColor:(UIColor *)color;

+ (styleBlock)styleBlockRoundedCornersWithBorderWidth:(CGFloat)borderWidth
                                             andColor:(UIColor *)color;

- (void)addBorderWithWidth:(CGFloat)borderWidth
                    radius:(CGFloat)radius;

- (void)addBorderWithWidth:(CGFloat)borderWidth
                    radius:(CGFloat)radius andColor:(UIColor *)color;


@end
