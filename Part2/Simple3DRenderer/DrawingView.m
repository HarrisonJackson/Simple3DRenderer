//
//  DrawingView.m
//  Simple3DRenderer
//
//  Created by Harrison Jackson on 3/16/13.
//  Copyright (c) 2013 Harrison. All rights reserved.
//

#import "DrawingView.h"
#import "SimpleBox.h"
#import "SimpleCamera.h"

@implementation DrawingView

- (id)initWithCoder:(NSCoder*)aDecoder
{
    if(self = [super initWithCoder:aDecoder])
    {
        // Do something
        box = [[SimpleBox alloc] initTestBox];
        camera = [[SimpleCamera alloc] init];
        camera.position.x = 0;
        camera.position.y = 0;
        camera.position.z = -1;
        
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
    [box drawWithCamera:camera andFrame:rect];
    
}

@end
