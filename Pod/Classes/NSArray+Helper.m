//
//  NSArray+Helper.m
//  myfab5
//
//  Created by John Gulbronson on 5/23/13.
//  Copyright (c) 2013 myfab5. All rights reserved.
//

#import "NSArray+Helper.h"

@implementation NSArray (Helper)


/*
 * This function enumerates a property of a class and joins the components
 */
- (NSString *)componentsJoinedByString:(NSString *)separator
                          fromProperty:(NSString *(^)(id))property
{
    NSMutableArray *components = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *str = property(obj);
        if(str)
            [components addObject:str];
        else
            NSLog(@"Bad Component!");
    }];
    return [components componentsJoinedByString:separator];
}

- (NSArray *)objectBy:(NSInteger)value
{
    NSMutableArray *objects = [NSMutableArray array];
    
    __block NSMutableArray *array = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
        [array addObject:object];
        if(array.count == value){
            [objects addObject:array];
            array = [NSMutableArray array];
        }
    }];
    
    if(array.count)
        [objects addObject:array];
    
    return objects;
}

- (NSArray *)limit:(NSInteger)limit
{
    NSRange range;
    range.location = 0;
    range.length = MIN(limit,self.count);
    return [self subarrayWithRange:range];
}

@end
