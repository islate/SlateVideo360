//
//  CardboardViewController.m
//  SlateVideo360
//
//  Created by linyize on 16/2/26.
//  Copyright © 2016年 islate. All rights reserved.
//

#import "CardboardViewController.h"

#import <AudioToolbox/AudioServices.h>
#import <OpenGLES/ES2/glext.h>

#include "GLHelpers.h"
#import "VideoRenderer.h"

@interface CardboardViewController() <CBDStereoRendererDelegate>

@property (nonatomic, strong) VideoRenderer *videoRenderer;

@end


@implementation CardboardViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (!self) {return nil; }
    
    self.stereoRendererDelegate = self;
    
    return self;
}

- (void)dealloc
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.preferredFramesPerSecond = 30.0f;
    
    UITapGestureRecognizer *singleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapGesture:)];
    singleTapRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:singleTapRecognizer];
}

- (void)setVideoPlayerController:(HTY360PlayerVC *)videoPlayerController
{
    _videoPlayerController = videoPlayerController;
    self.videoRenderer.videoPlayerController = self.videoPlayerController;
}

- (void)setupRendererWithView:(GLKView *)glView
{
    self.videoRenderer = [VideoRenderer new];
    self.videoRenderer.videoPlayerController = self.videoPlayerController;
    [self.videoRenderer setupRendererWithView:glView];
}

- (void)shutdownRendererWithView:(GLKView *)glView
{
    [self.videoRenderer shutdownRendererWithView:glView];
}

- (void)renderViewDidChangeSize:(CGSize)size
{
    [self.videoRenderer renderViewDidChangeSize:size];
}

- (void)prepareNewFrameWithHeadViewMatrix:(GLKMatrix4)headViewMatrix
{
    [self.videoRenderer prepareNewFrameWithHeadViewMatrix:headViewMatrix];
}

- (void)drawEyeWithEye:(CBDEye *)eye
{
    [self.videoRenderer drawEyeWithEye:eye];
}

- (void)finishFrameWithViewportRect:(CGRect)viewPort
{
    [self.videoRenderer finishFrameWithViewportRect:viewPort];
}

- (void)handleSingleTapGesture:(UITapGestureRecognizer *)recognizer
{
    [_videoPlayerController toggleControls];
}

@end
