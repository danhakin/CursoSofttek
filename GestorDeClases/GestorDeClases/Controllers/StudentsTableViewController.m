//
//  StudentsTableViewController.m
//  GestorDeClases
//
//  Created by Pablo Formoso Estada on 3/11/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import "Student.h"
#import "StudentsTableViewController.h"
#import "StudentTableViewCell.h"
#import "SQLiteAccess+Student.h"

@interface StudentsTableViewController ()

@property (nonatomic, strong) NSMutableArray *students;

@end

@implementation StudentsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _students = [[NSMutableArray alloc] initWithArray:[SQLiteAccess selectAll]];
    
    /* KEYEDARCHIVE
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *tmpArray = [NSKeyedUnarchiver unarchiveObjectWithData:[defaults                                                                    objectForKey:@"students"]];
    
    _students = [NSMutableArray.alloc initWithArray:tmpArray];
    */
    /*
    for (int i = 0; i < 20000; i++) {
        [_students addObject:@"Alumno"];
    }
    */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return [_students count];
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
#ifndef NDEBUG
    NSLog(@"%s (line:%d) %i", __PRETTY_FUNCTION__, __LINE__, (int)indexPath.row);
#endif
    
    StudentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"  forIndexPath:indexPath];
    
    Student *alumuno = [_students objectAtIndex:indexPath.row];
    [cell.nameLabel setText:alumuno.name];
    [cell.cityLabel setText:alumuno.city];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
