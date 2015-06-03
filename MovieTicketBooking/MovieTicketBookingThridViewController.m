//
//  MovieTicketBookingThridViewController.m
//  MovieTicketBooking
//
//  Created by Vikas CG on 12/21/13.
//  Copyright (c) 2013 EST. All rights reserved.
//

#import "MovieTicketBookingThridViewController.h"
#import "MovieTicketHistoryCell.h"

@interface MovieTicketBookingThridViewController ()
{
    NSMutableArray *movieBookingList;
}
@end

@implementation MovieTicketBookingThridViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"History", @"History");
        self.tabBarItem.image = [UIImage imageNamed:@"histroy-icon"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSDictionary *movie1 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"Bullet Raja", @"SIK0000012", @"BIG Cinemas Screen 4",  @"Bangalore", @"Sun 14 2013 2:00 pm", @"2", @"Sofa: A3, A5", @"9:00 pm", @"350", nil] forKeys:[NSArray arrayWithObjects:MOVIENAME, BOOKINGID, VENUE, LOCATION, DATETIME, QUANTITY, SEATINFO, SHOWTIME, AMOUNT, nil]];
    
    NSDictionary *movie2 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"DOOM 3", @"SIK0000015", @"BIG Cinemas Screen 2",  @"Bangalore", @"Sun 23 2013 2:00 pm", @"5", @"GOLD: C3, C5, C6, C7, C8", @"3:00 pm", @"2350", nil] forKeys:[NSArray arrayWithObjects:MOVIENAME, BOOKINGID, VENUE, LOCATION, DATETIME, QUANTITY, SEATINFO, SHOWTIME, AMOUNT, nil]];
    
    movieBookingList = [[NSMutableArray alloc] initWithObjects:movie1, movie2, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableview delegates
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [movieBookingList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MovieListCellIdentifier";
    MovieTicketHistoryCell *cell = (MovieTicketHistoryCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[MovieTicketHistoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    
    NSDictionary *movieListIndex = [movieBookingList objectAtIndex:indexPath.row];
    cell.strMainTitle.text  =   [movieListIndex objectForKey:MOVIENAME];
    cell.strBookingID.text  =   [movieListIndex objectForKey:BOOKINGID];
    cell.strVenue.text      =   [movieListIndex objectForKey:VENUE];
    cell.strLocation.text   =   [movieListIndex objectForKey:LOCATION];
    cell.strDateTime.text   =   [movieListIndex objectForKey:DATETIME];
    cell.strQuantity.text   =   [movieListIndex objectForKey:QUANTITY];
    cell.strSeatInfo.text   =   [movieListIndex objectForKey:SEATINFO];
    cell.strShowTime.text   =   [movieListIndex objectForKey:SHOWTIME];
    cell.strAmount.text     =   [movieListIndex objectForKey:AMOUNT];
    
    UIImageView *imageView  =   [[UIImageView alloc] initWithFrame:CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height)];
    [imageView setImage:[UIImage imageNamed:@"histroy-details-bg"]];
    cell.backgroundView = imageView;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section    // fixed font style. use custom view (UILabel) if you want something different
{
    return  BOOKINGHIS;
}


@end
