//
//  ViewController.m
//  vo2_animals
//
//  Created by pierre-marie de jaureguiberry on 4/19/16.
//  Copyright © 2016 vo2. All rights reserved.
//

#import "ViewController.h"
#import "CategoryTableViewCell.h"
#import "Category+CoreDataProperties.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView    *categoryTable;
@property (nonatomic, retain) NSArray               *allCategories;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.allCategories = [Category getAll];
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.allCategories count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *identifier = @"CategoryTableViewCell";

    Category *currentCategory = [self.allCategories objectAtIndex:indexPath.row];
    CategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    [cell.cellCenterLabel setText:currentCategory.name];
    
    return cell;
}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
}

@end
