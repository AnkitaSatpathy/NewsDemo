//
//  NewsCell.h
//  NewsDemo
//
//  Created by Ankita Satpathy on 20/02/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@end

NS_ASSUME_NONNULL_END
