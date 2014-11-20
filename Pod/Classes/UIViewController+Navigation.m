//
//  UIViewController+Navigation.m
//  myfab5
//
//  Created by John Gulbronson on 8/26/14.
//  Copyright (c) 2014 John Gulbronson. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

#pragma mark Page Navigation

- (UINavigationController *)embedInNavigationVC
{
    UINavigationController *navigationVC = nil;
    
    // embed in navigation view controller or return current nav controller
    if (self.navigationController)
        navigationVC = self.navigationController;
    else
        navigationVC = [[UINavigationController alloc] initWithRootViewController:self];
    
    // ensure white tint color
    navigationVC.navigationBar.tintColor = [UIColor whiteColor];
    
    return navigationVC;
}

@end
