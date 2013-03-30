//
//  Simple3DObject.h
//  Simple3DRenderer
//
//  Created by Harrison Jackson on 3/30/13.
//  Copyright (c) 2013 Harrison. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SimpleCamera;

@interface Simple3DObject : NSObject{
NSArray * sides_;
}

@property (nonatomic, retain) NSArray * sides;

-(void)draw2d;
-(void)drawWithCamera:(SimpleCamera*)camera andFrame:(CGRect)frame;

@end