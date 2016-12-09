//
//  PreviewDataService.h
//  MovieApp
//
//  Created by Rodgers Komen on 27/07/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "BaseDataService.h"
#import "PreviewFilm.h"

@interface PreviewDataService : BaseDataService


-(PreviewFilm *) getFilmPreviewFromAPI:(NSString *)urlParameter;


@end
