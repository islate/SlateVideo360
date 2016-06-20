//
//  Video360ViewController.m
//  SlateVideo360
//
//  Created by linyize on 16/2/26.
//  Copyright © 2016年 islate. All rights reserved.
//

#import "Video360ViewController.h"

#import "HTY360PlayerVC.h"
#import "CardboardViewController.h"

@interface Video360ViewController () {
    BOOL _isUsingCardboard;
}

@property (strong, nonatomic) IBOutlet UIButton *cardboardButton;
@property (nonatomic, strong) CardboardViewController *cardboardVC;

@end

@implementation Video360ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureCardboardButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

- (void)dealloc
{
    [self removeCardboardView];
    [self removeGLKView];
}

// 锁死横屏
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeRight;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscapeRight;
}

#pragma mark cardboard button

- (void)configureCardboardButton
{
    _cardboardButton.backgroundColor = [UIColor clearColor];
    _cardboardButton.showsTouchWhenHighlighted = YES;
}

- (IBAction)cardboardButtonTouched:(id)sender
{
    _isUsingCardboard = !_isUsingCardboard;
    _cardboardButton.selected = _isUsingCardboard;
    if (_isUsingCardboard) {
        [self removeGLKView];
        [self configureCardboardView];
    }
    else {
        [self removeCardboardView];
        [self configureGLKView];
    }
}

#pragma mark cardboard view

- (void)configureCardboardView
{
    _cardboardVC = [[CardboardViewController alloc] init];
    
    _cardboardVC.videoPlayerController = self;
    
    [self.view insertSubview:_cardboardVC.view belowSubview:self.playerControlBackgroundView];
    [self addChildViewController:_cardboardVC];
    [_cardboardVC didMoveToParentViewController:self];
    
    _cardboardVC.view.frame = self.view.bounds;
}

- (void)removeCardboardView
{
    _cardboardVC.videoPlayerController = nil;
    [_cardboardVC.view removeFromSuperview];
    [_cardboardVC removeFromParentViewController];
    _cardboardVC = nil;
}

@end
