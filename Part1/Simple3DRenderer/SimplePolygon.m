//
//  SimplePolygon.m
//  Simple3DRenderer
//
//  Created by Harrison Jackson on 3/16/13.
//  Copyright (c) 2013 Harrison. All rights reserved.
//

#import "SimplePolygon.h"
#import "SimpleVector3.h"
#import <QuartzCore/QuartzCore.h>


@implementation SimplePolygon
@synthesize points = _points;

-(void)draw2d:(CGContextRef)context{
    CGContextBeginPath(context);
    // Set default line width
    CGContextSetLineWidth(context, 1.0);
    
    // Set colorspace
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[] = {0.0, 0.0, 1.0, 1.0};
    CGColorRef color = CGColorCreate(colorspace, components);
    
    CGMutablePathRef pathRef = CGPathCreateMutable();

    
    // Set stroke color from colorspce
    CGContextSetStrokeColorWithColor(context, color);
    for(int i=0; i < self.points.count; i++){
        SimpleVector3 * vec = [self.points objectAtIndex:i];
        if(i==0){
            CGContextMoveToPoint(context, vec.x, vec.y);
            CGPathMoveToPoint(pathRef, NULL, vec.x, vec.y);
        }
        CGPathAddLineToPoint(pathRef, NULL, vec.x, vec.y);
        CGContextAddLineToPoint(context, vec.x, vec.y);
        
        // Set point at x,y
        CGContextMoveToPoint(context, vec.x, vec.y);
        
        if(i==[self.points count]-1){
            CGContextAddLineToPoint(context,vec.x, vec.y);
            CGPathCloseSubpath(pathRef);
            CGContextAddPath(context, pathRef);
        }
    }
    
    CGContextStrokePath(context);
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
}


@end
