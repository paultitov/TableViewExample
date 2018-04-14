//
//  ViewController.m
//  TableViewExample
//
//  Created by Serhiy Shakun on 4/9/18.
//  Copyright © 2018 Serhiy Shakun. All rights reserved.
//

#import "MainTableViewController.h"
#import "DetailViewController.h"

@interface MainTableViewController ()

@property NSMutableArray *teachers, *schoolgirls;

@end

@implementation MainTableViewController

//вернуть ячейку по индексу не пересоздавая, если есть пустые
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if(indexPath.section == 0)
        cell.textLabel.text = self.teachers[indexPath.row];
    else if(indexPath.section == 1)
        cell.textLabel.text = self.schoolgirls[indexPath.row];

    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0)
        return self.teachers.count;
    else if(section == 1)
        return self.schoolgirls.count;
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.backgroundColor = [UIColor lightGrayColor];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0)];
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
//    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
//    self.tableView.tableFooterView = UIView(frame: CGRect.zero)
//    self.tableView.tableFooterView = [UIView accessibilityFrame:CGRectZero];
//
    
    // Do any additional setup after loading the view, typically from a nib.
    self.teachers = [NSMutableArray arrayWithArray: @[@"Виктория Петровна", @"Валентина Васильевна", @"Григорий Аркадьевич"]];
    self.schoolgirls = [NSMutableArray arrayWithArray: @[@"Виталина", @"Полина", @"Галина", @"Алина", @"Ивелина", @"Каролина", @"Аделина", @"Магдалина", @"Капиталина", @"Ангелина", @"Эвелина"]];
    //self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);

}

//- (void)insertNewObject:(id)sender {
//    if (!self.teachers) {
//        self.teachers = [[NSMutableArray alloc] init];
//    }
//    if (!self.schoolgirls) {
//        self.schoolgirls = [[NSMutableArray alloc] init];
//    }
//    [self.teachers insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0)
        return @"Учителя";
    else return @"Школьницы";
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if(indexPath.section==0) {
        [self.teachers removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        if(indexPath.section==1) {
            [self.schoolgirls removeObjectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
            //UITableViewRowAnimationFade
        }
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
@end
