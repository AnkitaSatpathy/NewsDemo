//
//  NSString+DateFormat.m
//  NewsDemo
//
//  Created by Ankita Satpathy on 20/02/24.
//

#import <Foundation/Foundation.h>
#import "NSString+DateFormat.h"

@implementation NSString (DateFormat)

- (NSString *)convertToDateFormatFrom:(NSString *)fromDateFormat convertTo:(NSString *)toDateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:fromDateFormat];
    NSDate *date = [dateFormatter dateFromString:self];
    if (!date) {
        return self;
    }
    [dateFormatter setDateFormat:toDateFormat];
    return [dateFormatter stringFromDate:date];
}

@end
