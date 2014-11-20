//
//  NSMutableArray+Helper.m
//  myfab5
//
//  Created by John Gulbronson on 10/13/13.
//  Copyright (c) 2013 John Gulbronson. All rights reserved.
//

#import "NSMutableArray+Helper.h"

@implementation NSMutableArray (Helper)

- (id)unshift
{
    if(!self.count)
        return nil;
    id obj = self[0];
    [self removeObjectAtIndex:0];
    return obj;
}

- (id)pop
{
    if(!self.count)
        return nil;
    id obj = [self lastObject];
    [self removeLastObject];
    return obj;
}

@end
