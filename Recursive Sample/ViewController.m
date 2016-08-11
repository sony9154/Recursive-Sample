//
//  ViewController.m
//  Recursive Sample
//
//  Created by Peter Yo on 8月/10/16.
//  Copyright © 2016年 Peter Hsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = [self parseNumber:@(1234567892)];
    NSLog(@"%@", array);
    NSNumber *result = [self addEachNumberToOne:array];
    NSLog(@"%@", result);
    
}

- (NSArray<NSNumber*>*) parseNumber:(NSNumber*)target {
    NSMutableArray *result = [NSMutableArray array];
    NSString *str = [NSString stringWithFormat:@"%@", target];
//    NSString *str = [target stringValue];
    for (int i = 0; i < str.length; i++) {
        NSString *numString =  [NSString stringWithFormat:@"%c", [str characterAtIndex:i] ];
        [result addObject:@(numString.intValue)];
    }
    return result;
}

- (NSNumber*) addEachNumberToOne:(NSArray<NSNumber*> *) target {
    // end rule
    if (target.count == 1) {
        return target[0];
    }
    else {
        NSNumber *result;
        for (NSNumber *num in target) {
            result = @(result.intValue + num.intValue);
        }
        return [self addEachNumberToOne:[self parseNumber:result]];
    }
}


@end






