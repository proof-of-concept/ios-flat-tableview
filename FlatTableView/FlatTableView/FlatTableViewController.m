//
//  FlatTableViewController.m
//  FlatTableView
//
//  Created by Renzo Crisóstomo on 5/24/13.
//  Copyright (c) 2013 Benjamin Philipp. All rights reserved.
//

#import "FlatTableViewController.h"

@interface UITableView (FlatTableView)

- (void)deselectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@implementation UITableView (FlatTableView)

- (void)deselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self deselectRowAtIndexPath:indexPath animated:YES];
}

@end

@interface FlatTableViewController ()

@end

@implementation FlatTableViewController

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView performSelector:@selector(deselectRowAtIndexPath:)
                    withObject:indexPath
                    afterDelay:0.5f];
}

@end
