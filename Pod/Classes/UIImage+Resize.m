//
//  UIImage+Resize.m
//  myfab5
//
//  Created by John Gulbronson on 6/17/14.
//  Copyright (c) 2014 John Gulbronson. All rights reserved.
//

#import "UIImage+Resize.h"

@implementation UIImage (Resize)

- (UIImage *)scaledToSize:(CGSize)newSize
{
    // If drawing a retina, cut new size in half
    if([UIScreen mainScreen].scale == 2.0)
        newSize = CGSizeMake(newSize.width / 2.0, newSize.height / 2.0);

    NSLog(@"Original Size: (%.0f,%.0f)",self.size.width,self.size.height);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);

    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSLog(@"New Image Size: (%.0f,%.0f)",newImage.size.width,newImage.size.height);
    return newImage;
}

@end
