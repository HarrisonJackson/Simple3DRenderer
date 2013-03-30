//
//  SimplePolygon.h
//  Simple3DRenderer
//
//  Created by Harrison Jackson on 3/16/13.
//  Copyright (c) 2013 Harrison. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimpleCamera.h"

@interface SimplePolygon : NSObject{
    NSMutableArray * _points;
}

@property (nonatomic, strong) NSMutableArray * points;

-(void)draw2d:(CGContextRef)context;

-(void)project:(CGContextRef)context withCamera:(SimpleCamera*)camera ontoFrame:(CGRect)frame;


@end
