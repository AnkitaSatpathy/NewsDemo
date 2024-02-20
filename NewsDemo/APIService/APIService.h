//
//  APIService.h
//  NewsDemo
//
//  Created by Ankita Satpathy on 20/02/24.
//

#import <Foundation/Foundation.h>
#import "NewsResponse.h"

@interface APIService : NSObject

- (void)loadJSONFromFileWithCompletion:(void (^)(NewsResponse * _Nullable))completion;

@end

