//
//  UIView+FrameHelp.h
//  SeatSideService
//
//  Created by John Gulbronson on 12/28/12.
//  Copyright (c) 2012 SeatSideService. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FrameHelp)

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat right;

- (void)setBottom:(CGFloat)bottom resize:(BOOL)resize;
- (void)setTop:(CGFloat)top resize:(BOOL)resize;
- (void)setWitdh:(CGFloat)width;
- (void)setOrigin:(CGPoint)origin;
- (void)setSize:(CGSize)size;
- (void)centerHorizontal;
- (void)centerVertical;
- (void)centerView;
- (void)hideAnimated;
- (void)showAnimated;
- (void)logFrame;

@end
