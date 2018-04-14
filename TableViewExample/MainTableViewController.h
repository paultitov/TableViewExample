#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MainTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) DetailViewController *detailViewController;

@end

