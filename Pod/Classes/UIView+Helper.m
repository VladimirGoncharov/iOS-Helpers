//
//  UIView+Helper.m
//  Pods
//
//  Created by John Gulbronson on 10/8/14.
//
//

#import "UIView+Helper.h"

@implementation UIView (Helper)

- (UIImage *)image
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

- (UITableViewCell *)cell
{
    UIView *view = self.superview;
    while(view){
        if([view isKindOfClass:[UITableViewCell class]])
            return (UITableViewCell *)view;
        view = view.superview;
    }
    return nil;
}


@end
