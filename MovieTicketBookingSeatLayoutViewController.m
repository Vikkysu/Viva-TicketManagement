//
//  MovieTicketBookingSeatLayoutViewController.m
//  MovieTicketBooking
//
//  Created by Vikas CG on 12/26/13.
//  Copyright (c) 2013 EST. All rights reserved.
//

#import "MovieTicketBookingSeatLayoutViewController.h"
#import "MovieTicketBookingOrderSummaryViewController.h"

@interface MovieTicketBookingSeatLayoutViewController ()

@end

@implementation MovieTicketBookingSeatLayoutViewController

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
    MovieTicketBookingOrderSummaryViewController *_MovieTicketBookingOrderSummaryViewController = [[MovieTicketBookingOrderSummaryViewController alloc] initWithNibName:@"MovieTicketBookingOrderSummaryViewController" bundle:nil];
    [self.navigationController pushViewController:_MovieTicketBookingOrderSummaryViewController animated:NO];
}

@end
