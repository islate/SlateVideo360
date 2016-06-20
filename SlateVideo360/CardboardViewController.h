//
//  CardboardViewController.h
//  SlateVideo360
//
//  Created by linyize on 16/2/26.
//  Copyright © 2016年 islate. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CBDViewController.h"

@class HTY360PlayerVC;

@interface CardboardViewController : CBDViewController

@property (strong, nonatomic) HTY360PlayerVC* videoPlayerController;

@end
