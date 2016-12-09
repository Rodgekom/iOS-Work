//
//  EventsViewController.h
//  EventApp
//
//  Created by Rodgers Komen on 27/07/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Event.h"
#import "DetailViewController.h"

@interface EventsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *eventView;
@end
