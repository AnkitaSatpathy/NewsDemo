//
//  NewsDemoTests.m
//  NewsDemoTests
//
//  Created by Ankita Satpathy on 20/02/24.
//

#import <XCTest/XCTest.h>
#import <XCTest/XCTest.h>
#import "NewsViewModel.h"

@interface NewsViewModelTests : XCTestCase

@property (nonatomic, strong) NewsViewModel *viewModel;

@end

@implementation NewsViewModelTests

- (void)setUp {
    [super setUp];
    self.viewModel = [[NewsViewModel alloc] init];
}

- (void)tearDown {
    self.viewModel = nil;
    [super tearDown];
}

- (void)testFetchNewsFromJson {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Fetch News from JSON"];
    
    // Assuming you have mocked APIService with a stub or a mock object
    
    // Stubbed response
    News *news1 = [[News alloc] title:@"News 1" publishedAt:@"2024-02-20"];
    News *news2 = [[News alloc] title:@"News 2" publishedAt:@"2024-02-21"];
    NewsResponse *stubResponse = [[NewsResponse alloc] init];
    stubResponse.articles = @[news1, news2];
    
    // Mock the API service
    self.viewModel.apiService = [[APIService alloc] initWithStubbedResponse:stubResponse];
    
    // Set up the completion block
    self.viewModel.didFetchNews = ^(NSArray<News *> *news) {
        XCTAssertNotNil(news);
        XCTAssertEqual(news.count, 2);
        XCTAssertEqualObjects(news[0].title, @"News 1");
        XCTAssertEqualObjects(news[1].title, @"News 2");
        [expectation fulfill];
    };
    
    // Call the method to be tested
    [self.viewModel fetchNewsFromJson];
    
    // Wait for the expectation to be fulfilled
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        }
    }];
}

@end
