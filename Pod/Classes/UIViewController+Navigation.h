//
//  UIViewController+Navigation.h
//  myfab5
//
//  Created by John Gulbronson on 8/26/14.
//  Copyright (c) 2014 John Gulbronson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Navigation)

- (UINavigationController *)embedInNavigationVC;
- (UINavigationController *)embedInNavigationVCWithTabImageName:(NSString *)imageName;

@end
