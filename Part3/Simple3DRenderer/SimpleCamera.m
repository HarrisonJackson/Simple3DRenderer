//
//  SimpleCamera.m
//  Simple3DRenderer
//
//  Created by Harrison Jackson on 3/30/13.
//  Copyright (c) 2013 Harrison. All rights reserved.
//

#import "SimpleCamera.h"


@implementation SimpleCamera
@synthesize position;

-(id)init{
    self = [super init];
    if(self){
        self.position = [[SimpleVector3 alloc] init];
        self.position.x = 0;
        self.position.y = 0;
        self.position.z = -1;
    }
    return self;
}

@end
