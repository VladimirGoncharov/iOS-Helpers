//
//  NSObject+Serialization.m
//  Pods
//
//  Created by John Gulbronson on 9/11/14.
//
//

#import "NSObject+Serialization.h"

@implementation NSObject (Serialization)

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if(self = [self init]){
        [self setWithDictionary:dictionary];
    }
    return self;
}

- (void)setWithDictionary:(NSDictionary *)dictionary
{

}

+ (NSArray *)listFromDictionaries:(NSArray *)dictionaries
{
    NSMutableArray *array = [NSMutableArray array];
    [dictionaries enumerateObjectsUsingBlock:^(NSMutableDictionary *dictionary, NSUInteger idx, BOOL *stop) {
        if([dictionary isKindOfClass:[NSDictionary class]]){
            deserialize block = [[self class] deserialize];
            id object = block(dictionary);
            if(object)
                [array addObject:object];
        }
    }];
    return array;
}

+ (deserialize)deserialize
{
    return ^(NSDictionary *dictionary){
        return [[[self class] alloc] initWithDictionary:dictionary];
    };
}

@end
