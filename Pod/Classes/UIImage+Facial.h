//
//  UIImage+Facial.h
//  Pods
//
//  Created by John Gulbronson on 11/25/14.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (Facial)

- (BOOL)hasFace;
- (NSArray *)facialFeatures;

@end
