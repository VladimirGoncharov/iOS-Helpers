//
//  NSDictionary+Helper.m
//  myfab5
//
//  Created by John Gulbronson on 10/13/13.
//  Copyright (c) 2013 John Gulbronson. All rights reserved.
//

#import "NSDictionary+Helper.h"
#import "NSString+Helper.h"

@implementation NSDictionary (Helper)

- (NSString *)paramterString
{
    NSMutableArray *params = [NSMutableArray array];
    for (NSString *key in self.allKeys) {
        id object = [self objectForKey:key];
        NSString *param = [NSString stringWithFormat:@"%@=%@",key,[object description].percentEscape];
        [params addObject:param];
    }
    if(params.count)
        return [params componentsJoinedByString:@"&"];
    else
        return  nil;
}

- (id)objectForKeyNotNull:(id)aKey
{
    if(![self isKindOfClass:[NSDictionary class]])
        return nil;
    if ([self objectForKey:aKey] == [NSNull null])
        return nil;
    else
        return [self objectForKey:aKey];
}

- (void)loadKey:(NSString *)key forProperty:(__strong id *)property ofClass:(Class)class
{
    id value = [self objectForKeyNotNull:key];
    if([[value class] isSubclassOfClass:class])
        *property = value;
}

- (void)loadKey:(NSString *)key forObject:(__strong id *)property deserialize:(id(^)(NSDictionary *info))block
{
    id value = [self objectForKeyNotNull:key];
    if([value isKindOfClass:[NSDictionary class]])
        *property = block(value);
}


- (void)loadKey:(NSString *)key forArray:(__strong NSArray **)property deserialize:(id(^)(NSDictionary *info))block
{
    id value = [self objectForKeyNotNull:key];
    if([value isKindOfClass:[NSArray class]]){
        NSArray *array = (NSArray *)value;
        NSMutableArray *results = [NSMutableArray array];
        for (NSDictionary *info in array) {
            id object = block(info);
            if(object)
                [results addObject:object];
        }
        *property = results;
    }
}

@end
