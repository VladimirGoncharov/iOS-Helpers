//
//  NSArray+Helper.h
//  myfab5
//
//  Created by John Gulbronson on 10/13/13.
//  Copyright (c) 2013 John Gulbronson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Helper)

- (NSString *)componentsJoinedByString:(NSString *)separator fromProperty:(NSString *(^)(id object))property;

- (NSArray *)objectBy:(NSInteger)value;

- (NSArray *)limit:(NSInteger)limit;

@end
