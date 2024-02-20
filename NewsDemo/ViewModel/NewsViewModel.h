//
//  NewsViewModel.h
//  NewsDemo
//
//  Created by Ankita Satpathy on 20/02/24.
//

#import <Foundation/Foundation.h>
#import "APIService.h"
#import "News.h"

@interface NewsViewModel : NSObject

@property (nonatomic, strong) APIService *apiService;
@property (nonatomic, strong) NSMutableArray<News *> *news;
@property (nonatomic, copy) void (^didFetchNews)(NSArray<News *> *);

- (instancetype)init;

@end
