//
//  UIImage+Facial.m
//  Pods
//
//  Created by John Gulbronson on 11/25/14.
//
//

#import "UIImage+Facial.h"

@implementation UIImage (Facial)

- (BOOL)hasFace
{
    return [self facialFeatures].count ? YES : NO;
}

- (NSArray *)facialFeatures
{
    CIImage *ciImage = [CIImage imageWithCGImage:self.CGImage];
    
    // create a face detector - since speed is not an issue we'll use a high accuracy
    // detector
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeFace
                                              context:nil
                                              options:[NSDictionary dictionaryWithObject:CIDetectorAccuracyHigh
                                                                                  forKey:CIDetectorAccuracy]];
    
    // create an array containing all the detected faces from the detector
    return [detector featuresInImage:ciImage];
}

@end
