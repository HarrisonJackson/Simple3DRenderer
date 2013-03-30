//
//  Simple3DObject.m
//  Simple3DRenderer
//
//  Created by Harrison Jackson on 3/30/13.
//  Copyright (c) 2013 Harrison. All rights reserved.
//

#import "Simple3DObject.h"
#import "SimplePolygon.h"
#import "SimpleCamera.h"

@implementation Simple3DObject
@synthesize sides = sides_;

-(void)draw2d{
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (SimplePolygon* face in self.sides) {
        [face draw2d:context];
    }
}

-(void)drawWithCamera:(SimpleCamera*)camera andFrame:(CGRect)frame{
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (SimplePolygon* face in self.sides) {
        [face project:context withCamera:camera ontoFrame:frame];
    }
}

@end
