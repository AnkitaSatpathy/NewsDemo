//
//  NewsViewModel.m
//  NewsDemo
//
//  Created by Ankita Satpathy on 20/02/24.
//

#import <Foundation/Foundation.h>
#import "NewsViewModel.h"
#import "News.h"

@implementation NewsViewModel


- (instancetype)init {
    self = [super init];
    if (self) {
        _apiService = [[APIService alloc] init];
        _news = [[NSMutableArray alloc] init];
        [self fetchNewsFromJson];
    }
    return self;
}

- (void)fetchNewsFromJson {
    __weak typeof(self) weakSelf = self;
    [self.apiService loadJSONFromFileWithCompletion:^(NewsResponse *newsResponse) {
        if (newsResponse) {
            weakSelf.news = [newsResponse.articles mutableCopy];
            if (weakSelf.didFetchNews) {
                weakSelf.didFetchNews(weakSelf.news);
            }
        }
    }];
}


@end
