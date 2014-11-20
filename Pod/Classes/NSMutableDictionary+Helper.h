//
//  NSMutableDictionary+Helper.h
//  myfab5
//
//  Created by John Gulbronson on 5/15/13.
//  Copyright (c) 2013 myfab5. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Helper)

- (void)setObjectIfNotNil:(id)anObject forKey:(id<NSCopying>)aKey;

@end
