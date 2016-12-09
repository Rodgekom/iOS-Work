//
//  BaseDataService.h
//  MovieApp
//
//  Created by Rodgers Komen on 27/07/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface BaseDataService : NSObject

@property(nonatomic,retain) AppDelegate *delegate;
@property(nonatomic,retain) NSURLConnection *connection;


+(NSString *) baseAPIUrl;
-(NSString *) makeApiCall:(NSString *)parameter;
- (NSData*) converResponseToDataStream: (NSString *) response;


@end
