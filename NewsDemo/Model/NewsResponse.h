//
//  NewsResponse.h
//  NewsDemo
//
//  Created by Ankita Satpathy on 20/02/24.
//

#import "News.h"
@interface NewsResponse : NSObject

@property (nonatomic, strong) NSArray<News *> *articles;

@end
