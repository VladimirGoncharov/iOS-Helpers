//
//  UILabel+Resize.h
//  myfab5
//
//  Created by John Gulbronson on 12/13/13.
//  Copyright (c) 2013 John Gulbronson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Resize)

- (void)resize;
- (void)resizeForText;
- (CGSize)estimatedSize;
- (void)resizeMaxWidth:(CGFloat)width;
- (CGSize)fittedSizeForWidth:(CGFloat)width;
- (CGSize)fittedSizeForAttributedTextWithWidth:(CGFloat)width;

@end
