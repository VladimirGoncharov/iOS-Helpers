//
//  UIView+ImageEffects.m
//  myfab5
//
//  Created by John Gulbronson on 12/11/13.
//  Copyright (c) 2013 John Gulbronson. All rights reserved.
//

#import "UIView+ImageEffects.h"
#import "UIImage+ImageEffects.h"

@implementation UIView (ImageEffects)


-(UIImage *)blurredSnapshot
{
    // Create the image context
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.window.screen.scale);
    
    // There he is! The new API method
    [self drawViewHierarchyInRect:self.frame afterScreenUpdates:NO];
    
    // Get the snapshot
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // Now apply the blur effect using Apple's UIImageEffect category
    UIImage *blurredSnapshotImage = [snapshotImage applyLightEffect];
    
    // Or apply any other effects available in "UIImage+ImageEffects.h"
    // UIImage *blurredSnapshotImage = [snapshotImage applyDarkEffect];
    // UIImage *blurredSnapshotImage = [snapshotImage applyExtraLightEffect];
    
    // Be nice and clean your mess up
    UIGraphicsEndImageContext();
    
    return blurredSnapshotImage;
}

@end
