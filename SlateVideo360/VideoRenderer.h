//
//  VideoRenderer.h
//  CardboardSDK-iOS
//
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
