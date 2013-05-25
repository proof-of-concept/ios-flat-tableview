//
//  FlatTableViewCell.m
//  FlatTableView
//
//  Created by Benjamin Philipp on 10.04.13.
//  Copyright (c) 2013 Benjamin Philipp. All rights reserved.
//

#import "FlatTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@interface UIView (FlatTableViewCellBackground)

+ (UIImage *)contextCreateRoundedMaskWithRect:(CGRect)rect
                                radiusTopLeft:(CGFloat)radius_tl
                               radiusTopRight:(CGFloat)radius_tr
                             radiusBottomLeft:(CGFloat)radius_bl
                            radiusBottomRight:(CGFloat) radius_br;

@end

@implementation UIView (FlatTableViewCellBackground)

+ (UIImage *)contextCreateRoundedMaskWithRect:(CGRect)rect
                                radiusTopLeft:(CGFloat)radius_tl
                               radiusTopRight:(CGFloat)radius_tr
                             radiusBottomLeft:(CGFloat)radius_bl
                            radiusBottomRight:(CGFloat) radius_br;
{
    CGContextRef context;
    CGColorSpaceRef colorSpace;
    colorSpace = CGColorSpaceCreateDeviceRGB();
    context = CGBitmapContextCreate(NULL, rect.size.width, rect.size.height, 8, 0, colorSpace, kCGImageAlphaPremultipliedLast);
    CGColorSpaceRelease(colorSpace);
    if (context == NULL) {
        return NULL;
    }
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
    CGImageRef bitmapContext = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    UIImage *theImage = [UIImage imageWithCGImage:bitmapContext];
    CGImageRelease(bitmapContext);
    return theImage;
}

@end

@implementation FlatTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    if (self){
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected
           animated:(BOOL)animated
{
    UIImage *mask = [UIView contextCreateRoundedMaskWithRect:self.selectedBackgroundView.bounds
                                               radiusTopLeft:[_topLeft floatValue]
                                              radiusTopRight:[_topRight floatValue]
                                            radiusBottomLeft:[_bottomRight floatValue]
                                           radiusBottomRight:[_bottomRight floatValue]];
    CALayer *layerMask = [CALayer layer];
    layerMask.frame = self.backgroundView.frame;
    layerMask.contents = (id)mask.CGImage;
    self.layer.backgroundColor = _cellSelectedColor.CGColor;
    self.selectedBackgroundView = [[UIView alloc] init];
    self.selectedBackgroundView.backgroundColor = _cellSelectedColor;
    self.layer.mask = layerMask;
    [super setSelected:selected
              animated:animated];
}

- (void)drawRect:(CGRect)rect
{
    UIImage *mask = [UIView contextCreateRoundedMaskWithRect:self.backgroundView.bounds
                                               radiusTopLeft:[_topLeft floatValue]
                                              radiusTopRight:[_topRight floatValue]
                                            radiusBottomLeft:[_bottomRight floatValue]
                                           radiusBottomRight:[_bottomRight floatValue]];
    CALayer *layerMask = [CALayer layer];
    layerMask.frame = self.backgroundView.frame;
    layerMask.contents = (id)mask.CGImage;
    self.layer.backgroundColor = _cellBackgroundColor.CGColor;
    self.backgroundView = [[UIView alloc] init];
    self.backgroundView.backgroundColor = _cellBackgroundColor;
    self.layer.mask = layerMask;
}

@end
