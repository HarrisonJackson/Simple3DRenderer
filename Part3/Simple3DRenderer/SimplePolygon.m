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

-(void)draw3d1:(CGContextRef)context withCamera:(SimpleCamera*)camera andFrame:(CGRect)frame{
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
    /*
     // 4. Get the center of the face
     SimpleVector3 * centroid = [[SimpleVector3 alloc] init];
     centroid.x = 0;
     centroid.y = 0;
     centroid.z = 0;
     for (SimpleVector3* point in self.points) {
     centroid.x += point.x;
     centroid.y += point.y;
     centroid.z += point.z;
     }
     centroid.x /= [self.points count];
     centroid.y /= [self.points count];
     centroid.z /= [self.points count];
     
     // 5. Get camera viewing angle using poly center and camera position
     SimpleVector3 * cameraAngleVector = [[SimpleVector3 alloc] init];
     cameraAngleVector.x = centroid.x-camera.position.x;
     cameraAngleVector.y = centroid.x-camera.position.y;
     cameraAngleVector.z = centroid.x-camera.position.z;
     
     // 6. Normalize the vector (map it's values between -1,1)
     // 6a calculate the magnitude of the vector
     float m = sqrt((cameraAngleVector.x*cameraAngleVector.x) +
     (cameraAngleVector.y*cameraAngleVector.y) +
     (cameraAngleVector.z*cameraAngleVector.z));
     // 6b divide x,y, and z by the magnitude
     cameraAngleVector.x /= m;
     cameraAngleVector.y /= m;
     cameraAngleVector.z /= m;
     */
    
    NSInteger count = 0;
    for (SimpleVector3*point in self.points) {
        // Some here
        projectedRatio  = viewDistance/(viewDistance-point.z);
        projectedX      = point.x * projectedRatio;
        projectedY      = point.y * projectedRatio;
        
        // Some here
        if(count == 0){
            CGContextMoveToPoint(context, projectedX, projectedY);
            //CGPathMoveToPoint(pathRef, NULL, projectedX, projectedY);
        } else {
            CGContextAddLineToPoint(context, projectedX, projectedY);
            CGContextMoveToPoint(context, projectedX, projectedY);
        }
        
        // Close the object if it is the last point
        if(count==[self.points count]-1){
            projectedX = ((SimpleVector3*)[self.points objectAtIndex:0]).x * projectedRatio;
            projectedY = ((SimpleVector3*)[self.points objectAtIndex:0]).y * projectedRatio;
            //CGContextAddLineToPoint(context, projectedX, projectedY);
        }
        count++;
    }
    CGContextStrokePath(context);
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
    
    
}



@end
