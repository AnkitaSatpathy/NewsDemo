//
//  ViewController.m
//  NewsDemo
//
//  Created by Ankita Satpathy on 20/02/24.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNewsTableViewUI];
    [self initialiseViewModel];
}

- (void)setupNewsTableViewUI {
    self.newsTable.rowHeight = UITableViewAutomaticDimension;
    self.newsTable.estimatedRowHeight = 120.0;
    [self.newsTable registerNib:[UINib nibWithNibName:@"NewsCell" bundle:nil] forCellReuseIdentifier:@"NewsCell"];
}

- (void)initialiseViewModel {
    self.newsViewModel = [[NewsViewModel alloc] init];
    __weak typeof(self) weakSelf = self;
    self.newsViewModel.didFetchNews = ^(NSArray<News *> *news) {
        weakSelf.newsArticles = [news mutableCopy];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.newsTable reloadData];
        });
    };
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsArticles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell" forIndexPath:indexPath];
    cell.titleLabel.text = self.newsArticles[indexPath.row].title;
    cell.dateLabel.text = [self.newsArticles[indexPath.row].publishedAt convertToDateFormatFrom:@"yyyy-MM-dd'T'HH:mm:ssZ" convertTo:@"dd-MM-YYYY"];
    return cell;
}

@end

