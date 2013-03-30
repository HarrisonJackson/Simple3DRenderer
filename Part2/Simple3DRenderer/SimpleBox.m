//
//  SimpleBox.m
//  Simple3DRenderer
//
//  Created by Harrison Jackson on 3/30/13.
//  Copyright (c) 2013 Harrison. All rights reserved.
//

#import "SimpleBox.h"
#import "SimplePolygon.h"
#import "SimpleVector3.h"

@implementation SimpleBox

-(id)initTestBox{
    self = [super init];
    if(self){
        // Add code here to create our array of sides
        // 1. use the 3D coordinate system to define our points
        SimpleVector3 * topLeft = [[SimpleVector3 alloc] init];
        topLeft.x = 10;
        topLeft.y = 10;
        topLeft.z = 10;

        SimpleVector3 * topRight = [[SimpleVector3 alloc] init];
        topRight.x = 200;
        topRight.y = 10;
        topRight.z = 10;
        
        SimpleVector3 * bottomRight = [[SimpleVector3 alloc] init];
        bottomRight.x = 200;
        bottomRight.y = 200;
        bottomRight.z = 10;
        
        SimpleVector3 * bottomLeft = [[SimpleVector3 alloc] init];
        bottomLeft.x = 10;
        bottomLeft.y = 200;
        bottomLeft.z = 10;
        
        SimpleVector3 * topBackLeft = [[SimpleVector3 alloc] init];
        topBackLeft.x = 10;
        topBackLeft.y = 10;
        topBackLeft.z = 200;
        
        SimpleVector3 * topBackRight = [[SimpleVector3 alloc] init];
        topBackRight.x = 200;
        topBackRight.y = 10;
        topBackRight.z = 200;
        
        SimpleVector3 * bottomBackRight = [[SimpleVector3 alloc] init];
        bottomBackRight.x = 200;
        bottomBackRight.y = 200;
        bottomBackRight.z = 200;
        
        SimpleVector3 * bottomBackLeft = [[SimpleVector3 alloc] init];
        bottomBackLeft.x = 10;
        bottomBackLeft.y = 200;
        bottomBackLeft.z = 200;
        
        SimplePolygon * front = [[SimplePolygon alloc] init];
        front.points = [NSMutableArray arrayWithObjects:topLeft, topRight, bottomRight, bottomLeft, nil];
        
        SimplePolygon * back = [[SimplePolygon alloc] init];
        back.points = [NSMutableArray arrayWithObjects:topBackRight, topBackLeft, bottomBackLeft, bottomBackRight, nil];
        
        SimplePolygon * left = [[SimplePolygon alloc] init];
        left.points = [NSMutableArray arrayWithObjects:topBackLeft, topLeft, bottomLeft, bottomBackLeft, nil];
        
        SimplePolygon * right = [[SimplePolygon alloc] init];
        right.points = [NSMutableArray arrayWithObjects:topRight, topBackRight, bottomBackRight, bottomRight, nil];
        
        SimplePolygon * top = [[SimplePolygon alloc] init];
        top.points = [NSMutableArray arrayWithObjects:topBackRight, topBackLeft, topLeft, topRight, nil];
        
        SimplePolygon * bottom = [[SimplePolygon alloc] init];
        bottom.points = [NSMutableArray arrayWithObjects:topLeft, topRight, bottomRight, bottomLeft, nil];
        
        self.sides = [NSArray arrayWithObjects:front, back, left, right, top, bottom, nil];
    }
    return self;
}

@end
