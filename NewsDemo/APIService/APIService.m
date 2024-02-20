//
//  APIService.m
//  NewsDemo
//
//  Created by Ankita Satpathy on 20/02/24.
//

#import <Foundation/Foundation.h>

#import "APIService.h"

@implementation APIService

- (void)loadJSONFromFileWithCompletion:(void (^)(NewsResponse * _Nullable))completion {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"news" ofType:@"json"];
    if (filePath) {
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        if (data) {
            NSError *error = nil;
            NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            if (error == nil && [jsonDictionary isKindOfClass:[NSDictionary class]]) {
                NewsResponse *newsResponse = [[NewsResponse alloc] init];
                newsResponse.articles = jsonDictionary[@"articles"];
                
                if (completion) {
                    completion(newsResponse);
                }
                return;
            }
        }
    }
}
@end
