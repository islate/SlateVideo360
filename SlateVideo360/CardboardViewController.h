//
//  CardboardViewController.h
//  CardboardSDK-iOS
//
//

#import <UIKit/UIKit.h>

#import "CBDViewController.h"

@class HTY360PlayerVC;

@interface CardboardViewController : CBDViewController

@property (strong, nonatomic) HTY360PlayerVC* videoPlayerController;

@end
