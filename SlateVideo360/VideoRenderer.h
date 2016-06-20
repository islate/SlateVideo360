//
//  VideoRenderer.h
//  SlateVideo360
//
//  Created by linyize on 16/2/26.
//  Copyright © 2016年 islate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

#import "HTY360PlayerVC.h"

@class CBDEye;

@interface VideoRenderer : NSObject

@property (nonatomic, weak) HTY360PlayerVC* videoPlayerController;

- (void)setupRendererWithView:(GLKView *)glView;
- (void)shutdownRendererWithView:(GLKView *)glView;
- (void)renderViewDidChangeSize:(CGSize)size;
- (void)prepareNewFrameWithHeadViewMatrix:(GLKMatrix4)headViewMatrix;
- (void)drawEyeWithEye:(CBDEye *)eye;
- (void)finishFrameWithViewportRect:(CGRect)viewPort;

@end
