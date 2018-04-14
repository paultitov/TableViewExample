//
//  ViewController.h
//  TableViewExample
//
//  Created by Serhiy Shakun on 4/9/18.
//  Copyright © 2018 Serhiy Shakun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MainTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) DetailViewController *detailViewController;

@end

