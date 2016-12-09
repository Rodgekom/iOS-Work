//
//  DirectoryViewController.m
//  KenyaCop
//
//  Created by Johnstone Ananda on 01/08/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import "DirectoryViewController.h"
#import "SWRevealViewController.h"

@interface DirectoryViewController ()

@end

@implementation DirectoryViewController
@synthesize stationName=_stationName, areaName=_areaName, telNumber=_telNumber;


    NSMutableArray *myObject;
    
    // A dictionary object
    NSDictionary *dict;
    
    // Define keys
    NSString *stationname;
    NSString *stationarea;
    NSString *stationnumber;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    // Define keys
    stationname = @"police_station";
    stationarea = @"area";
    stationnumber = @"police_phone";
    
    // Create array to hold dictionaries
    
    myObject = [[NSMutableArray alloc] init];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:
                        [NSURL URLWithString:@"http://www.wrostdevelopers.com/KenyaInfoCop/mobileAPI/?action=getDirectory"]];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    printf("%s",jsonObjects);
    // values in foreach loop
    for (NSDictionary *dataDict in jsonObjects) {
        
        NSString *strEventName = [dataDict objectForKey:@"police_station"];
        NSString *strEventDescription = [dataDict objectForKey:@"area"];
        NSString *strEventDate = [dataDict objectForKey:@"station_phone"];
        
        dict = [NSDictionary dictionaryWithObjectsAndKeys:
                strEventName, stationname,
                strEventDescription, stationarea,
                strEventDate, stationnumber,
                nil];
        [myObject addObject:dict];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return myObject.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        // Use the default cell style.
        cell = [[[UITableViewCell alloc] initWithStyle : UITableViewCellStyleSubtitle
                                       reuseIdentifier : CellIdentifier] autorelease];
    }
    
    
    NSDictionary *tmpDict = [myObject objectAtIndex:indexPath.row];
    
    // Event Name
    //    NSMutableString *text;
    //    text = [NSString stringWithFormat:@"Type : %@",[tmpDict objectForKey:eventname]];
    //
    // Name & Tel
    //    NSMutableString *detail;
    //    detail = [NSString stringWithFormat:@"Description : %@ , Date : %@"
    //              ,[tmpDict objectForKey:eventdescription]
    //              ,[tmpDict objectForKey:dateposted]];
    //
//    NSMutableString *stationnamedet;
//    stationnamedet = [NSString stringWithFormat:@"Name : %@",[tmpDict objectForKey:stationname]];
//    
//    NSMutableString *stationareadet;
//    stationareadet = [NSString stringWithFormat:@"Area : %@", [tmpDict objectForKey:stationarea]];
//    
//    NSMutableString *stationnumberdet;
//    stationnamedet = [NSString stringWithFormat:@"Tel : %@",[tmpDict objectForKey:stationnumber]];
//    
//    _stationName.text = stationnamedet;
//    _areaName.text = stationareadet;
//    _telNumber.text = stationnumberdet;
    
    NSMutableString *text;
    text = [NSString stringWithFormat:@"Name : %@",[tmpDict objectForKey:stationname]];
    
    NSMutableString *detail;
    detail = [NSString stringWithFormat:@"Area : %@ , Tel : %@"
              ,[tmpDict objectForKey:stationarea]
              ,[tmpDict objectForKey:stationnumber]];

    cell.textLabel.text = text;
    cell.detailTextLabel.text= detail;
    
//    cell.textLabel.text = stationnamedet;
//    cell.detailTextLabel.text= stationareadet;
    //cell.textLabel.text = stationnumberdet;
    
    //[tmpDict objectForKey:memberid]
    
    //[tmpDict objectForKey:name]
    //[tmpDict objectForKey:tel]
    return cell;
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}



/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
