//
//  MapViewController.m
//  KenyaCop
//
//  Created by Johnstone Ananda on 01/08/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import "MapViewController.h"
#import "SWRevealViewController.h"
#import "MyAnnotation.h"
//#import "JSONKit.h"

@interface MapViewController ()

{
    NSMutableArray *array;
    
    // A dictionary object
    NSDictionary *dict;
    
}


@end

@implementation MapViewController
@synthesize mapView;

@synthesize dispensaries;
@synthesize data;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
        // Create array to hold dictionaries
    
    array = [[NSMutableArray alloc] init];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:
                        [NSURL URLWithString:@"http://www.wrostdevelopers.com/KenyaInfoCop/mobileAPI/?action=getAllEvents"]];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    printf("%s",jsonObjects);
    // values in foreach loop
    
    for (NSDictionary *dictionary in array) {
        assert([dictionary respondsToSelector:@selector(objectForKey:)]);
        
        CLLocationCoordinate2D coord = {[[dictionary objectForKey:@"lat"] doubleValue], [[dictionary objectForKey:@"lng"] doubleValue]};
        
        MyAnnotation *ann = [[MyAnnotation alloc] init];
        ann.title = [dictionary objectForKey:@"Name"];
        ann.coordinate = coord;
        [mapView addAnnotation:ann];
    }
    
    [mapView setMapType:MKMapTypeStandard];
    [mapView setZoomEnabled:YES];
    [mapView setScrollEnabled:YES];
    
    self.mapView.delegate = self;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation     {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = userLocation.coordinate;
    point.title = @"You Are Here";
    point.subtitle = @"Your current location";
    
    [self.mapView addAnnotation:point];
}

@end
