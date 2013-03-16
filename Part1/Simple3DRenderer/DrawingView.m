//
//  DrawingView.m
//  Simple3DRenderer
//
//  Created by Harrison Jackson on 3/16/13.
//  Copyright (c) 2013 Harrison. All rights reserved.
//

#import "DrawingView.h"
#import "SimplePolygon.h"
#import "SimpleVector3.h"

@implementation DrawingView

- (id)initWithCoder:(NSCoder*)aDecoder
{
    if(self = [super initWithCoder:aDecoder])
    {
        // Do something
        square = [[SimplePolygon alloc] init];
        SimpleVector3 * topLeft = [[SimpleVector3 alloc] init];
        topLeft.x = 10;
        topLeft.y = 10;
        
        SimpleVector3 * topRight = [[SimpleVector3 alloc] init];
        topRight.x = 200;
        topRight.y = 10;
        
        SimpleVector3 * bottomRight = [[SimpleVector3 alloc] init];
        bottomRight.x = 200;
        bottomRight.y = 200;
        
        SimpleVector3 * bottomLeft = [[SimpleVector3 alloc] init];
        bottomLeft.x = 10;
        bottomLeft.y = 200;
        
        square.points = [NSMutableArray arrayWithObjects:topLeft, topRight, bottomRight, bottomLeft, nil];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        // We don't use this because our view's init is called by the storyboard
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    [square draw2d:context];
}


@end
