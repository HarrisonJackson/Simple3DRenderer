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

// 1. Set line width
    CGContextSetLineWidth(context, 1.0);
    
// 2. Set stroke color
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGFloat         components[] = {0.0, 0.0, 1.0, 1.0};
    CGColorRef      color = CGColorCreate(colorspace, components);
    CGContextSetStrokeColorWithColor(context, color);

// 3. Create pathRef
    CGMutablePathRef pathRef = CGPathCreateMutable();

// 4. Loop over the polygons points, creating lines from one to the next
    for(int i=0; i < self.points.count; i++){
        SimpleVector3 * vec = [self.points objectAtIndex:i];
        if(i==0){
            CGContextMoveToPoint(context, vec.x, vec.y);
            CGPathMoveToPoint(pathRef, NULL, vec.x, vec.y);
        }
        CGPathAddLineToPoint(pathRef, NULL, vec.x, vec.y);
        CGContextAddLineToPoint(context, vec.x, vec.y);
        CGContextMoveToPoint(context, vec.x, vec.y);
        
        if(i==[self.points count]-1){
            CGContextAddLineToPoint(context,vec.x, vec.y);
            CGPathCloseSubpath(pathRef);
            CGContextAddPath(context, pathRef);
            //CGContextFillPath(context);

        }
    }

// 5. Release our drawing objects
    CGPathRelease(pathRef);
    CGContextStrokePath(context);
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
}

-(void)project:(CGContextRef)context withCamera:(SimpleCamera*)camera ontoFrame:(CGRect)frame{
    CGContextBeginPath(context);

    // 1. Set line width
    CGContextSetLineWidth(context, 2.0);
    
    // 2. Set stroke color
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGFloat         components[] = {0.0, 0.0, 1.0, 1.0};
    CGColorRef      color = CGColorCreate(colorspace, components);
    CGContextSetStrokeColorWithColor(context, color);
    
    // 3. Set up the viewing frustrum
    float windowWidth = frame.size.width;
    float viewingDegrees = 100;
    float projectedX = 0;
    float projectedY = 0;
    float projectedRatio = 0;
    float viewDistance = (float)windowWidth/ tanf((viewingDegrees/2) * M_PI/180);
    
    NSInteger count = 0;
    for (SimpleVector3*point in self.points) {
        // 4. Calculate the projected x and y coordinates for the point onto the frame
        projectedRatio  = viewDistance/(viewDistance-point.z);
        projectedX      = point.x * projectedRatio;
        projectedY      = point.y * projectedRatio;
        
        // 5. Draw the shape - starting at the first point
        if(count == 0){
            CGContextMoveToPoint(context, projectedX, projectedY);
        } else {
            // Add a line to each of points in the shape
            CGContextAddLineToPoint(context, projectedX, projectedY);
            CGContextMoveToPoint(context, projectedX, projectedY);
        }
                
        // 6. Close the object if it is the last point
        if(count==[self.points count]-1){
            projectedX = ((SimpleVector3*)[self.points objectAtIndex:0]).x * projectedRatio;
            projectedY = ((SimpleVector3*)[self.points objectAtIndex:0]).y * projectedRatio;
            //CGContextAddLineToPoint(context, projectedX, projectedY);
        }
        count++;
    }
    // 7. Draw the stroke line 
    CGContextStrokePath(context);
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
}




@end
