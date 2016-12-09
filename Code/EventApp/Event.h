//
//  Event.h
//  EventApp
//
//  Created by Rodgers Komen on 27/07/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface Event : NSObject
@property (nonatomic, strong) NSString *name; // event name
@property (nonatomic, strong) NSString *description; // event description
@property (nonatomic, strong) NSString *image; // event logo
@end
