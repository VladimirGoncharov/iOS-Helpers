//
//  UILabel+Resize.m
//  myfab5
//
//  Created by John Gulbronson on 12/13/13.
//  Copyright (c) 2013 John Gulbronson. All rights reserved.
//

#import "UILabel+Resize.h"
#import "UIView+FrameHelp.h"

@implementation UILabel (Resize)

- (void)resize
{
    self.height = self.estimatedSize.height + 5;
}

- (CGSize)estimatedSize
{
    return [self fittedSizeForAttributedTextWithWidth:self.width];
}

- (void)resizeForText
{
    self.height = [self fittedSizeForWidth:self.width].height + 5;
}

- (CGSize)fittedSizeForWidth:(CGFloat)width
{
    // get base line height
    CGSize baseSize = [@"X" sizeWithFont:self.font constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:self.lineBreakMode];
    
    CGFloat height = baseSize.height * self.numberOfLines + 5;
    
    // get max size
    CGSize size = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(width, height) lineBreakMode:self.lineBreakMode];
    
    return size;
}

- (CGSize)fittedSizeForAttributedTextWithWidth:(CGFloat)width
{
    // get base line height
    CGSize baseSize = [@"X" boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:nil context:nil].size;
    
    CGFloat height = baseSize.height * self.numberOfLines + 5;
    
    if(self.attributedText){
        NSAttributedString *attributedText = self.attributedText;
        UIFont *font = [attributedText attributesAtIndex:0 effectiveRange:nil][NSFontAttributeName];

        // Skip if system default text is used, because this is likely set by non-attributed string
        if(font.pointSize != 13 && ![font.familyName isEqualToString:@".Helvetica Neue Interface"])
            return [attributedText boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil].size;
    }
    
    NSString *text = self.text;
    return [text boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size;
}

- (void)resizeMaxWidth:(CGFloat)width
{
    CGSize size = [self fittedSizeForAttributedTextWithWidth:width];
    // resize
    self.height = size.height + 2;
    self.width = size.width + 2;
}

@end
