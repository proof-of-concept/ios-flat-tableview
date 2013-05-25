//
//  FlatTableViewCell.h
//  FlatTableView
//
//  Created by Benjamin Philipp on 10.04.13.
//  Copyright (c) 2013 Benjamin Philipp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlatTableViewCell : UITableViewCell

@property (nonatomic, strong) UIColor *cellBackgroundColor;
@property (nonatomic, strong) NSNumber *topLeft;
@property (nonatomic, strong) NSNumber *topRight;
@property (nonatomic, strong) NSNumber *bottomLeft;
@property (nonatomic, strong) NSNumber *bottomRight;

@end
