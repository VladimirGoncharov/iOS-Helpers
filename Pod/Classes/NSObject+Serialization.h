//
//  NSObject+Serialization.h
//  Pods
//
//  Created by John Gulbronson on 9/11/14.
//
//

#import <Foundation/Foundation.h>

typedef id (^deserialize)(NSDictionary *dictionary);

@interface NSObject (Serialization)

// Serialization
- (id)initWithDictionary:(NSDictionary *)dictionary;
- (void)setWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)listFromDictionaries:(NSArray *)dictionaries;
+ (deserialize)deserialize;

@end
