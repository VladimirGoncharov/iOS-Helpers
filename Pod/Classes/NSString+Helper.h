//
//  NSString+Helper.h
//  myfab5
//
//  Created by John Gulbronson on 10/25/13.
//  Copyright (c) 2013 John Gulbronson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Helper)

- (NSString *)percentEscape;
- (NSDate *)dateFromStringWithFormat:(NSString *)format;
- (NSDate *)dateWithFormat:(NSString *)format;
- (NSDate *)dateFromStringWithFormat:(NSString *)format fromZone:(NSString *)timeZone;

@end
