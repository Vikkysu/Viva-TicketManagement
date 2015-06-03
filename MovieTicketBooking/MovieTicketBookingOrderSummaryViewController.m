//
//  MovieTicketBookingOrderSummaryViewController.m
//  MovieTicketBooking
//
//  Created by Vikas CG on 12/26/13.
//  Copyright (c) 2013 EST. All rights reserved.
//

#import "MovieTicketBookingOrderSummaryViewController.h"

@interface MovieTicketBookingOrderSummaryViewController ()

@end

@implementation MovieTicketBookingOrderSummaryViewController
@synthesize lblMovieName;
@synthesize lblVenue;
@synthesize lblLocation;
@synthesize lblDateTime;
@synthesize lblQuantity;
@synthesize lblSeatInfo;
@synthesize lblTicketAmount;
@synthesize lblTax;
@synthesize lblInternetHandCharges;
@synthesize lblTotalAmount;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark btn delegates

-(void) btnProceedPressed:(id) sender
{
    NSLog(@"The method is %s", __func__);
    
}

@end
