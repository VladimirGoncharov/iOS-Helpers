//
//  NSDate+Helper.h
//  myfab5
//
//  Created by John Gulbronson on 3/28/13.
//  Copyright (c) 2013 myfab5. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Helper)

- (NSString *)formatAsString:(NSString *)format;
- (NSString *)timeElapsed;

@end
