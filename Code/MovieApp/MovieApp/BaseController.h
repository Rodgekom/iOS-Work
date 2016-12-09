//
//  BaseController.h
//  MovieApp
//
//  Created by Rodgers Komen on 27/07/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface BaseController : UIViewController

- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock;

@end
