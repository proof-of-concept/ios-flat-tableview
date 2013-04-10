//
//  FlatTableViewController.m
//  FlatTableView
//
//  Created by Benjamin Philipp on 10.04.13.
//  Copyright (c) 2013 Benjamin Philipp. All rights reserved.
//

#import "FlatTableViewController.h"
#import "FlatTableViewCell.h"

@interface FlatTableViewController ()

@end

@implementation FlatTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
  self = [super initWithStyle:style];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  // Return the number of sections.
  return 25;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  // Return the number of rows in the section.
  return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  FlatTableViewCell *cell;
  
  if (indexPath.row == 0) {
    static NSString *CellIdentifier = @"Cell_Top";
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = @"Top";
    cell.cellBackgroundColor = [UIColor whiteColor];
    cell.topLeft = 2;
    cell.topRight = 2;
    cell.bottomLeft = 0;
    cell.bottomRight = 0;
  } else if (indexPath.row == 1) {
    static NSString *CellIdentifier = @"Cell_Middle";
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = @"Middle";
    cell.cellBackgroundColor = [UIColor lightGrayColor];
    cell.topLeft = 0;
    cell.topRight = 0;
    cell.bottomLeft = 0;
    cell.bottomRight = 0;
  } else if (indexPath.row == 2) {
    static NSString *CellIdentifier = @"Cell_Bottom";
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = @"Bottom";
    cell.cellBackgroundColor = [UIColor darkGrayColor];
    cell.topLeft = 0;
    cell.topRight = 0;
    cell.bottomLeft = 2;
    cell.bottomRight = 2;
  }
  cell.textLabel.backgroundColor = [UIColor clearColor];
  
  cell.selectedBackgroundView = [[UIView alloc] init];
  cell.selectedBackgroundView.backgroundColor = [UIColor blueColor];
  
  return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
}

@end
