//
//  MovieTicketBookingViewController.m
//  MovieTicketBooking
//
//  Created by Vikas CG on 12/22/13.
//  Copyright (c) 2013 EST. All rights reserved.
//

#import "MovieTicketBookingViewController.h"
#import "MovieTicketBookingSelectHallCell.h"
#import "MovieTicketBookingSeatCatagoryViewController.h"

@interface MovieTicketBookingViewController ()
{
    NSMutableArray *movieList;
    UIDatePicker *pickerView;
}
@end

@implementation MovieTicketBookingViewController

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
    
    NSDictionary *movie1 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"BIG CIMEMAS", @"09:00 AM", @"11:00 AM",  @"02:30 PM", @"04:30 PM", @"05:10 PM", @"05:30 PM", @"06:30 PM", @"07:30 PM", @"09:30 PM", nil] forKeys:[NSArray arrayWithObjects:THREATERNAME, TIME1, TIME2, TIME3, TIME4, TIME5, TIME6, TIME7, TIME8, TIME9, nil]];
    
    NSDictionary *movie2 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"REX CIMEMAS", @"09:00 AM", @"05:30 PM", @"07:30 PM", @"09:30 PM", nil] forKeys:[NSArray arrayWithObjects:THREATERNAME, TIME1, TIME2, TIME3, TIME4, nil]];
    
    movieList = [[NSMutableArray alloc] initWithObjects:movie1, movie2, nil];
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
    MovieTicketBookingSelectHallCell *cell = (MovieTicketBookingSelectHallCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[MovieTicketBookingSelectHallCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier andRow:indexPath.row andSEL:@selector(timeSelected:) andDelegate:self];
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    UIImageView *imageView  =   [[UIImageView alloc] initWithFrame:CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height)];
    [imageView setImage:[UIImage imageNamed:@"movie-details-bg"]];
    cell.backgroundView = imageView;
    
    NSDictionary *movieListIndex = [movieList objectAtIndex:indexPath.row];
    cell.lblTheaterName.text  =   [movieListIndex objectForKey:THREATERNAME];
    
    if([movieListIndex objectForKey:TIME1])
    {
        [cell.lblTime1 setTitle:[movieListIndex objectForKey:TIME1] forState:UIControlStateNormal];
        [cell.lblTime1 setHidden:NO];
    }
    if([movieListIndex objectForKey:TIME2])
    {
        [cell.lblTime2 setTitle:[movieListIndex objectForKey:TIME2] forState:UIControlStateNormal];
        [cell.lblTime2 setHidden:NO];
    }
    if([movieListIndex objectForKey:TIME3])
    {
        [cell.lblTime3 setTitle:[movieListIndex objectForKey:TIME3] forState:UIControlStateNormal];
        [cell.lblTime3 setHidden:NO];
    }
    if([movieListIndex objectForKey:TIME4])
    {
        [cell.lblTime4 setTitle:[movieListIndex objectForKey:TIME4] forState:UIControlStateNormal];
        [cell.lblTime4 setHidden:NO];
    }
    if([movieListIndex objectForKey:TIME5])
    {
        [cell.lblTime5 setTitle:[movieListIndex objectForKey:TIME5] forState:UIControlStateNormal];
        [cell.lblTime5 setHidden:NO];
    }
    if([movieListIndex objectForKey:TIME6])
    {
        [cell.lblTime6 setTitle:[movieListIndex objectForKey:TIME6] forState:UIControlStateNormal];
        [cell.lblTime6 setHidden:NO];
    }
    if([movieListIndex objectForKey:TIME7])
    {
        [cell.lblTime7 setTitle:[movieListIndex objectForKey:TIME7] forState:UIControlStateNormal];
        [cell.lblTime7 setHidden:NO];
    }
    if([movieListIndex objectForKey:TIME8])
    {
        [cell.lblTime8 setTitle:[movieListIndex objectForKey:TIME8] forState:UIControlStateNormal];
        [cell.lblTime8 setHidden:NO];
    }
    if([movieListIndex objectForKey:TIME9])
    {
        [cell.lblTime9 setTitle:[movieListIndex objectForKey:TIME9] forState:UIControlStateNormal];
        [cell.lblTime9 setHidden:NO];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"The method is %s", __func__);
    
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    UIImageView *imageView  =   [[UIImageView alloc] initWithFrame:CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height)];
    [imageView setImage:[UIImage imageNamed:@"movie-details-bg-hover"]];
    cell.backgroundView = imageView;
    
    MovieTicketBookingViewController *_MovieTicketBookingViewController = [[MovieTicketBookingViewController alloc] initWithNibName:@"MovieTicketBookingViewController" bundle:nil];
    [self.navigationController pushViewController:_MovieTicketBookingViewController animated:NO];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"The method is %s", __func__);
    
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    UIImageView *imageView  =   [[UIImageView alloc] initWithFrame:CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height)];
    [imageView setImage:[UIImage imageNamed:@"movie-details-bg"]];
    cell.backgroundView = imageView;
}

#pragma mark btn delegates
-(void) timeSelected:(id) sender
{
    UIButton *btn = (UIButton *)sender;
    NSLog(@"The method is %s", __func__);
    NSLog(@"The timings selected from row: %d, time: %@", btn.tag, btn.titleLabel.text);
    
    // push to next screen
    MovieTicketBookingSeatCatagoryViewController *_MovieTicketBookingSeatCatagoryViewController = [[MovieTicketBookingSeatCatagoryViewController alloc] initWithNibName:@"MovieTicketBookingSeatCatagoryViewController" bundle:nil];
    [self.navigationController pushViewController:_MovieTicketBookingSeatCatagoryViewController animated:NO];
}

-(IBAction) showDate:(id)sender;
{
    UIActionSheet *menu = [[UIActionSheet alloc] initWithTitle:@"Date Picker"
                                                      delegate:self
                                             cancelButtonTitle:@"Cancel"
                                        destructiveButtonTitle:nil
                                             otherButtonTitles:@"OK",nil];
    // Add the picker
    pickerView = [[UIDatePicker alloc] init];
    pickerView.datePickerMode = UIDatePickerModeDate;
    [menu addSubview:pickerView];
    [menu showInView:self.view];
    
    CGRect menuRect = menu.frame;
    CGFloat orgHeight = menuRect.size.height;
    menuRect.origin.y -= 214; //height of picker
    menuRect.size.height = orgHeight+214;
    menu.frame = menuRect;
    
    
    CGRect pickerRect = pickerView.frame;
    pickerRect.origin.y = orgHeight;
    pickerView.frame = pickerRect;
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"The method is %s buttonIndex:%d", __func__, buttonIndex);
    NSDate *selectedDate = [pickerView date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEEE, d  MMM"];
    
    NSString *myDateString = [NSString stringWithFormat:@"%@ (Change date)", [formatter stringFromDate:selectedDate]];
    NSLog(@"selectedDate: %@" ,myDateString);
    [dateBtn setTitle:myDateString forState:UIControlStateNormal];
    [dateBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [dateBtn.titleLabel setFont: [UIFont fontWithName:kHelveticaFont size:kFontSize12]];
    [dateBtn.titleLabel setLineBreakMode: NSLineBreakByWordWrapping];
    [dateBtn.titleLabel setTextAlignment : NSTextAlignmentCenter];
}


@end
