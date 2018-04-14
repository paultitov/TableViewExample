//
//  DetailViewController.h
//  TableViewExample
//
//  Created by Paul on 14.04.2018.
//  Copyright © 2018 Serhiy Shakun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (strong, nonatomic) NSDate *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
