//
//  FlatTableViewCell.m
//  FlatTableView
//
//  Created by Benjamin Philipp on 10.04.13.
//  Copyright (c) 2013 Benjamin Philipp. All rights reserved.
//

#import "FlatTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation FlatTableViewCell
@synthesize topLeft, topRight, bottomLeft, bottomRight, cellBackgroundColor;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
  }
  return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];

  // Configure the view for the selected state
}

-(void)drawRect:(CGRect)rect {  
  // Create the mask image you need calling the previous function
  UIImage *mask = MTDContextCreateRoundedMask(self.backgroundView.bounds, topLeft, topRight, bottomRight, bottomRight);
  // Create a new layer that will work as a mask
  CALayer *layerMask = [CALayer layer];
  layerMask.frame = self.backgroundView.frame;
  // Put the mask image as content of the layer
  layerMask.contents = (id)mask.CGImage;
  // set the mask layer as mask of the view layer
  self.layer.backgroundColor = cellBackgroundColor.CGColor;
  
  self.backgroundView = [[UIView alloc] init];
  self.backgroundView.backgroundColor = cellBackgroundColor;
  
  self.layer.mask = layerMask;
}

// from http://stackoverflow.com/questions/4847163/round-two-corners-in-uiview
static inline UIImage* MTDContextCreateRoundedMask(CGRect rect, CGFloat radius_tl, CGFloat radius_tr, CGFloat radius_bl, CGFloat radius_br) {
  
  CGContextRef context;
  CGColorSpaceRef colorSpace;
  
  colorSpace = CGColorSpaceCreateDeviceRGB();
  
  // create a bitmap graphics context the size of the image
  context = CGBitmapContextCreate(NULL, rect.size.width, rect.size.height, 8, 0, colorSpace, kCGImageAlphaPremultipliedLast);
  
  // free the rgb colorspace
  CGColorSpaceRelease(colorSpace);
  
  if (context == NULL) {
    return NULL;
  }
  
  // cerate mask
  
  CGFloat minx = CGRectGetMinX(rect), midx = CGRectGetMidX(rect), maxx = CGRectGetMaxX(rect);
  CGFloat miny = CGRectGetMinY(rect), midy = CGRectGetMidY(rect), maxy = CGRectGetMaxY(rect);
  
  CGContextBeginPath(context);
  CGContextSetGrayFillColor(context, 1.0, 0.0);
  CGContextAddRect(context, rect);
  CGContextClosePath(context);
  CGContextDrawPath(context, kCGPathFill);
  
  CGContextSetGrayFillColor(context, 1.0, 1.0);
  CGContextBeginPath(context);
  CGContextMoveToPoint(context, minx, midy);
  CGContextAddArcToPoint(context, minx, miny, midx, miny, radius_bl);
  CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius_br);
  CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius_tr);
  CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius_tl);
  CGContextClosePath(context);
  CGContextDrawPath(context, kCGPathFill);
  
  // Create CGImageRef of the main view bitmap content, and then
  // release that bitmap context
  CGImageRef bitmapContext = CGBitmapContextCreateImage(context);
  CGContextRelease(context);
  
  // convert the finished resized image to a UIImage
  UIImage *theImage = [UIImage imageWithCGImage:bitmapContext];
  // image is retained by the property setting above, so we can
  // release the original
  CGImageRelease(bitmapContext);
  
  // return the image
  return theImage;
}

@end
