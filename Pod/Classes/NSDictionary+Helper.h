//
//  NSDictionary+Helper.h
//  myfab5
//
//  Created by John Gulbronson on 10/13/13.
//  Copyright (c) 2013 John Gulbronson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Helper)

- (NSString *)paramterString;

- (id)objectForKeyNotNull:(id)aKey;

- (void)loadKey:(NSString *)key forProperty:(__strong id *)property ofClass:(Class)class;
- (void)loadKey:(NSString *)key forObject:(__strong id *)property deserialize:(id(^)(NSDictionary *info))block;
- (void)loadKey:(NSString *)key forArray:(__strong NSArray **)property deserialize:(id(^)(NSDictionary *info))block;

@end
