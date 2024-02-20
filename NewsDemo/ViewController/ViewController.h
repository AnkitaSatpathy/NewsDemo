//
//  ViewController.h
//  NewsDemo
//
//  Created by Ankita Satpathy on 20/02/24.
//

#import <UIKit/UIKit.h>
#import "NewsCell.h"
#import "NewsViewModel.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NewsViewModel *newsViewModel;
@property (nonatomic, strong) IBOutlet UITableView *newsTable;
@property (nonatomic, strong) NSMutableArray<News *> *newsArticles;

@end

