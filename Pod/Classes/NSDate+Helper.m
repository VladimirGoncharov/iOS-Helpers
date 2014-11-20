//
//  NSDate+Helper.m
//  myfab5
//
//  Created by John Gulbronson on 3/28/13.
//  Copyright (c) 2013 myfab5. All rights reserved.
//

#import "NSDate+Helper.h"

@implementation NSDate (Helper)

- (NSString *)formatAsString:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSLocale *loc = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [dateFormatter setLocale:loc];
    return [dateFormatter stringFromDate:self];
}

- (NSString *)timeElapsed
{
    
    NSTimeInterval seconds = -[self timeIntervalSinceNow];
    if (seconds >= 60*60*24) {
        return [NSString stringWithFormat:@"%dd",(int)(seconds/(60*60*24))];
    }else if (seconds >= 60*60) {
        return [NSString stringWithFormat:@"%dh",(int)(seconds/(60*60))];
    }else if (seconds >= 60) {
        return [NSString stringWithFormat:@"%dm",(int)(seconds/60)];
    }else {
        return [NSString stringWithFormat:@"%ds",(int)(seconds)];
    }
    
}


@end
