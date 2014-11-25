//
//  NSString+Helper.m
//  myfab5
//
//  Created by John Gulbronson on 10/25/13.
//  Copyright (c) 2013 John Gulbronson. All rights reserved.
//

#import "NSString+Helper.h"

@implementation NSString (Helper)

- (NSString *)trimWhitespace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}


- (NSString *)percentEscape
{
    return [NSString urlEncodeValue:self];
}

+ (NSString *)urlEncodeValue:(NSString *)str
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)str, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8));
    return result;
}

- (NSDate *)dateFromStringWithFormat:(NSString *)format
{
    return [self dateFromStringWithFormat:format fromZone:nil];
}

- (NSDate *)dateFromStringWithFormat:(NSString *)format fromZone:(NSString *)timeZone
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSLocale *loc = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [dateFormatter setLocale:loc];
    if(timeZone)
        [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:timeZone]];
    return [dateFormatter dateFromString:self];
}

- (NSDate *)dateWithFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSLocale *loc = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [dateFormatter setLocale:loc];
    return [dateFormatter dateFromString:self];
}

@end
