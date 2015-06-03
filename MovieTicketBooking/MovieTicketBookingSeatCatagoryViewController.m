//
//  MovieTicketBookingSeatCatagoryViewController.m
//  MovieTicketBooking
//
//  Created by Vikas CG on 12/24/13.
//  Copyright (c) 2013 EST. All rights reserved.
//

#import "MovieTicketBookingSeatCatagoryViewController.h"
#import "MovieTicketBookingSeatCatagoryCell.h"
#import "MovieTicketBookingSeatLayoutViewController.h"

@interface MovieTicketBookingSeatCatagoryViewController ()
{
    NSMutableArray *movieList;
}
@end

@implementation MovieTicketBookingSeatCatagoryViewController
@synthesize lblMovieName;
@synthesize lblVenue;
@synthesize lblDateTime;
@synthesize tblSeatCatagory;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *btnReload = [[UIBarButtonItem alloc]initWithTitle:@"Proceed" style:UIBarButtonItemStylePlain target:self action:@selector(btnProceedPressed:)];
    self.navigationController.topViewController.navigationItem.rightBarButtonItem = btnReload;
    btnReload.enabled=TRUE;
    
    NSDictionary *movie1 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"Platinum", @"BULLET RAJA (U/A)", @"Big Cinemas", @"Tomorrow 09 Dec Time: 04:30 pm", nil] forKeys:[NSArray arrayWithObjects:SEATCATAGORY, MOVIENAME, THREATERNAME, DATETIME, nil]];
    
    NSDictionary *movie2 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"GOLD", @"BULLET RAJA (U/A)", @"Big Cinemas", @"Tomorrow 09 Dec Time: 04:30 pm", nil] forKeys:[NSArray arrayWithObjects:SEATCATAGORY, MOVIENAME, THREATERNAME, DATETIME, nil]];
    
    NSDictionary *movie3 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"SOFA", @"BULLET RAJA (U/A)", @"Big Cinemas", @"Tomorrow 09 Dec Time: 04:30 pm", nil] forKeys:[NSArray arrayWithObjects:SEATCATAGORY, MOVIENAME, THREATERNAME, DATETIME, nil]];

    movieList = [[NSMutableArray alloc] initWithObjects:movie1, movie2, movie3, nil];
    
    lblMovieName.text = [[movieList objectAtIndex:0] objectForKey:MOVIENAME];
    lblVenue.text = [[movieList objectAtIndex:0] objectForKey:THREATERNAME];
    lblDateTime.text = [[movieList objectAtIndex:0] objectForKey:DATETIME];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableview delegates
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [movieList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MovieListCellIdentifier";
    MovieTicketBookingSeatCatagoryCell *cell = (MovieTicketBookingSeatCatagoryCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[MovieTicketBookingSeatCatagoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier andRow:indexPath.row];
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.btnPlus addTarget:self action:@selector(addSeats:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btnMinus addTarget:self action:@selector(minusSeats:) forControlEvents:UIControlEventTouchUpInside];
    }

    NSDictionary *movieListIndex = [movieList objectAtIndex:indexPath.row];
    cell.lblSeatCatagory.text  =   [movieListIndex objectForKey:SEATCATAGORY];
    
    switch (indexPath.row) {
        case 0:
            [cell.txtNoOfSeats setText:[NSString stringWithFormat:@"%d", noOfSeatsCell1]];
            break;
        case 1:
            [cell.txtNoOfSeats setText:[NSString stringWithFormat:@"%d", noOfSeatsCell2]];
            break;
        case 2:
            [cell.txtNoOfSeats setText:[NSString stringWithFormat:@"%d", noOfSeatsCell3]];
            break;
        default:
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"The method is %s", __func__);

}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"The method is %s", __func__);
    
}

#pragma mark btn delegates
-(void) addSeats:(id) sender
{
    NSLog(@"The method is %s", __func__);

    UIButton *btn = (UIButton *)sender;
    NSLog(@"The timings selected from row: %d", btn.tag);
    
    MovieTicketBookingSeatCatagoryCell *cell = (MovieTicketBookingSeatCatagoryCell *)[self tableView:tblSeatCatagory cellForRowAtIndexPath:[NSIndexPath indexPathForRow:btn.tag inSection:1]];
    int noOfSeats=0;
    if([cell.txtNoOfSeats.text intValue] == 0)
        noOfSeats = 1;
    else if([cell.txtNoOfSeats.text intValue] >= 10)
    {
        UIAlertView *_alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Max 10 seats can be booked at a time" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [_alertView show];
        return;
    }
    else
    {
        noOfSeats = [cell.txtNoOfSeats.text intValue];
        noOfSeats+=1;
    }
    switch (btn.tag) {
        case 0:
            noOfSeatsCell1 = noOfSeats;
            noOfSeatsCell2 = 0;
            noOfSeatsCell3 = 0;
            break;
        case 1:
            noOfSeatsCell2 = noOfSeats;
            noOfSeatsCell1 = 0;
            noOfSeatsCell3 = 0;
            break;
        case 2:
            noOfSeatsCell3 = noOfSeats;
            noOfSeatsCell2 = 0;
            noOfSeatsCell1 = 0;
            break;
        default:
            break;
    }
    [tblSeatCatagory reloadData];
}

-(void) minusSeats:(id) sender
{
    NSLog(@"The method is %s", __func__);

    UIButton *btn = (UIButton *)sender;
    NSLog(@"The timings selected from row: %d", btn.tag);
    MovieTicketBookingSeatCatagoryCell *cell = (MovieTicketBookingSeatCatagoryCell *)[self tableView:tblSeatCatagory cellForRowAtIndexPath:[NSIndexPath indexPathForRow:btn.tag inSection:0]];
    int noOfSeats=0;

    if([cell.txtNoOfSeats.text intValue] <= 1)
        noOfSeats = 0;
    else
    {
        noOfSeats = [cell.txtNoOfSeats.text intValue];
        noOfSeats-=1;
    }
    switch (btn.tag) {
        case 0:
            noOfSeatsCell1 = noOfSeats;
            noOfSeatsCell2 = 0;
            noOfSeatsCell3 = 0;
            break;
        case 1:
            noOfSeatsCell2 = noOfSeats;
            noOfSeatsCell1 = 0;
            noOfSeatsCell3 = 0;
            break;
        case 2:
            noOfSeatsCell3 = noOfSeats;
            noOfSeatsCell1 = 0;
            noOfSeatsCell2 = 0;
            break;
        default:
            break;
    }

    [tblSeatCatagory reloadData];
}

-(void) btnProceedPressed:(id) sender
{
    NSLog(@"The method is %s", __func__);
    
    MovieTicketBookingSeatLayoutViewController *_MovieTicketBookingSeatLayoutViewController = [[MovieTicketBookingSeatLayoutViewController alloc] initWithNibName:@"MovieTicketBookingSeatLayoutViewController" bundle:nil];
    [self.navigationController pushViewController:_MovieTicketBookingSeatLayoutViewController animated:NO];
}
@end
