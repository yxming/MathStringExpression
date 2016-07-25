//
//  MSOperator.m
//  MSExpressionProgram
//
//  Created by NOVO on 16/6/24.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "MSOperator.h"

@interface MSOperator ()
@property (nonatomic,copy) MSOperator* jsMathTransferOperator;
@end

@implementation MSOperator
@synthesize uuid=_uuid;
@synthesize opName = _opName;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.elementType = EnumElementTypeOperator;
        self.opStyle = EnumOperatorStyleUndefine;
    }
    return self;
}

+ (instancetype)operatorWithKeyValue:(NSDictionary*)keyValue
{
    
    id re;
    if((re = [[self.class alloc] init])){
        [re setValuesForKeysWithDictionary:keyValue];
    }
    return re;
}

- (instancetype)copy
{
    MSOperator* re = [MSOperator new];
    if(re){
        [re.opName setValue:self.opName forKey:@"opName"];;
        re.showName = self.showName;
        re.level = self.level;
        re.opStyle = self.opStyle;
    }
    return re;
}

- (NSComparisonResult)compareOperator:(MSOperator*)op
{
    if(self.level<op.level){
        return NSOrderedDescending;
    }else if (self.level>op.level){
        return NSOrderedAscending;
    }
    return NSOrderedSame;
}

- (NSString *)description
{
    return self.opName;
}

- (NSString *)debugDescription
{
    return self.opName;
}

- (NSString *)uuid
{
    if(!_uuid){
        _uuid = [NSString stringWithFormat:@"%@%ld",self.opName,(long)self.level];
    }
    return _uuid;
}

- (BOOL)isEqual:(id)object
{
    if(self==object)
        return YES;
    if(![object isKindOfClass:[MSOperator class]])
        return NO;
    if([self.uuid isEqualToString:((MSOperator*)object).uuid]){
        return YES;
    }
    return NO;
}

- (NSUInteger)hash
{
    return [self.uuid hash];
}
@end