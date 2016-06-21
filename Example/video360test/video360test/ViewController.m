//
//  ViewController.m
//  video360test
//
//  Created by linyize on 16/6/20.
//  Copyright © 2016年 islate. All rights reserved.
//

#import "ViewController.h"

#import "Video360ViewController.h"

@implementation ViewController

- (IBAction)playURL:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"http://7b1gcw.com1.z0.glb.clouddn.com/demo1.mp4"];
    Video360ViewController *videoController = [[Video360ViewController alloc] initWithNibName:@"HTY360PlayerVC" bundle:nil url:url];
    
    if (![[self presentedViewController] isBeingDismissed]) {
        [self presentViewController:videoController animated:YES completion:nil];
    }
}

- (IBAction)playFile:(id)sender
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"demo1" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:path];
    Video360ViewController *videoController = [[Video360ViewController alloc] initWithNibName:@"HTY360PlayerVC" bundle:nil url:url];
    
    if (![[self presentedViewController] isBeingDismissed]) {
        [self presentViewController:videoController animated:YES completion:nil];
    }
}

@end
