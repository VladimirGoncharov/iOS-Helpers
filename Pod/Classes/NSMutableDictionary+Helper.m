//
//  NSMutableDictionary+Helper.m
//  myfab5
//
//  Created by John Gulbronson on 5/15/13.
//  Copyright (c) 2013 myfab5. All rights reserved.
//

#import "NSMutableDictionary+Helper.h"

@implementation NSMutableDictionary (Helper)

- (void)setObjectIfNotNil:(id)anObject forKey:(id<NSCopying>)aKey
{
    if(anObject)
        [self setObject:anObject forKey:aKey];
}

@end
