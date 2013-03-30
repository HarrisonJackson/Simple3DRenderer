//
//  DrawingView.h
//  Simple3DRenderer
//
//  Created by Harrison Jackson on 3/16/13.
//  Copyright (c) 2013 Harrison. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SimpleBox;
@class SimpleCamera;

@interface DrawingView : UIView{
    SimpleBox * box;
    SimpleCamera * camera;
}

@end
