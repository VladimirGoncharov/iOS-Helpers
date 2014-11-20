//
//  NSURL+Helper.m
//  myfab5
//
//  Created by John Gulbronson on 6/19/14.
//  Copyright (c) 2014 John Gulbronson. All rights reserved.
//

#import "NSURL+Helper.h"

@implementation NSURL (Helper)

- (NSDictionary *)parameters
{
    NSMutableDictionary *queryStringDictionary = [[NSMutableDictionary alloc] init];
    NSArray *urlComponents = [self.query componentsSeparatedByString:@"&"];
    
    for (NSString *keyValuePair in urlComponents){
        NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
        NSString *key = [pairComponents objectAtIndex:0];
        NSString *value = [pairComponents objectAtIndex:1];
        NSString *decoded = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (CFStringRef)value, CFSTR(""), kCFStringEncodingUTF8);
        [queryStringDictionary setObject:decoded forKey:key];
    }
    
    return queryStringDictionary;
}

@end
