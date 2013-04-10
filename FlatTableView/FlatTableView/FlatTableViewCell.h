//
//  FlatTableViewCell.h
//  FlatTableView
//
//  Created by Benjamin Philipp on 10.04.13.
//  Copyright (c) 2013 Benjamin Philipp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlatTableViewCell : UITableViewCell {
  CGFloat topLeft;
  CGFloat topRight;
  CGFloat bottomLeft;
  CGFloat bottomRight;
  UIColor *cellBackgroundColor;
}

@property (nonatomic, retain) UIColor *cellBackgroundColor;
@property (nonatomic) CGFloat topLeft;
@property (nonatomic) CGFloat topRight;
@property (nonatomic) CGFloat bottomLeft;
@property (nonatomic) CGFloat bottomRight;

@end
