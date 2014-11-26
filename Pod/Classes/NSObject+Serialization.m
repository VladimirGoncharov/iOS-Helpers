//
//  NSObject+Serialization.m
//  Pods
//
//  Created by John Gulbronson on 9/11/14.
//
//

#import "NSObject+Serialization.h"
#import <NSString+Helper.h>
#import <objc/runtime.h>

@implementation NSObject (Serialization)

+ (instancetype)object
{
    return [[[self class] alloc] init];
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if(self = [self init]){
        [self setWithDictionary:dictionary];
    }
    return self;
}

- (void)setWithDictionary:(NSDictionary *)dictionary
{
    unsigned int count = 0;
    // Get a list of all properties in the class.
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:count];
    
    for (int i = 0; i < count; i++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        
        NSString* propertyAttributes = [NSString stringWithUTF8String:property_getAttributes(properties[i])];
        NSArray* splitPropertyAttributes = [propertyAttributes componentsSeparatedByString:@"\""];
        if ([splitPropertyAttributes count] >= 2) {
            id value = [dictionary objectForKey:key];
            
            NSString *classNameStr = [splitPropertyAttributes objectAtIndex:1];
            
            NSString *prototypeName = nil;
            NSArray *splitClassAttr = [classNameStr componentsSeparatedByString:@"<"];
            if(splitClassAttr.count)
                classNameStr = [splitClassAttr objectAtIndex:0];
            if(splitClassAttr.count == 2)
                prototypeName = [[splitClassAttr objectAtIndex:1] stringByReplacingOccurrencesOfString:@">" withString:@""];

            Class theClass = NSClassFromString(classNameStr);
            if([[value class] isSubclassOfClass:[NSArray class]] && [theClass isSubclassOfClass:[NSArray class]] && prototypeName){
                Class theArrayClass = NSClassFromString(prototypeName);
                if(theArrayClass){
                    NSMutableArray *array = [NSMutableArray array];
                    [value enumerateObjectsUsingBlock:^(id objDict, NSUInteger idx, BOOL *stop) {
                        if([objDict isKindOfClass:[NSDictionary class]]){
                            id obj = [[theArrayClass alloc] initWithDictionary:objDict];
                            if(obj)
                                [array addObject:obj];
                        }
                    }];
                    [self setValue:array forKey:key];
                }
            }else if([[value class] isSubclassOfClass:theClass]){
                [self setValue:value forKey:key];
            }else if([value isKindOfClass:[NSDictionary class]]){
                id obj = [[theClass alloc] initWithDictionary:value];
                [self setValue:obj forKey:key];
            }else if([[value class] isSubclassOfClass:[NSString class]] && [theClass isSubclassOfClass:[NSURL class]]){
                NSURL *url = [NSURL URLWithString:value];
                [self setValue:url forKey:key];
            }else if([[value class] isSubclassOfClass:[NSString class]] && [theClass isSubclassOfClass:[NSDate class]]){
                NSDate *date = [value dateWithFormat:@"yyyy-mm-dd hh:MM:ss"];
                [self setValue:date forKey:key];
            }else if([[value class] isSubclassOfClass:[NSString class]] && [theClass isSubclassOfClass:[NSNumber class]]){
                NSNumber *number = [NSNumber numberWithInteger:[value integerValue]];
                [self setValue:number forKey:key];
            }
        }
        
        NSString *value = [self valueForKey:key];
        
        // Only add to the NSDictionary if it's not nil.
        if (value)
            [dict setObject:value forKey:key];
    }
    
    free(properties);
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
