//
//  DetailViewController.h
//  EventApp
//
//  Created by Rodgers Komen on 27/07/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Event.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic, strong) Event *event;

@property (weak, nonatomic) IBOutlet UIImageView *img;

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@property (weak, nonatomic) IBOutlet FBSDKShareButton *btnShare;
@property (weak, nonatomic) IBOutlet FBSDKLikeButton *btnLike;

@end
