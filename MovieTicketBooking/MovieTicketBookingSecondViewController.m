//
//  MovieTicketBookingSecondViewController.m
//  MovieTicketBooking
//
//  Created by Vikas CG on 12/21/13.
//  Copyright (c) 2013 EST. All rights reserved.
//

#import "MovieTicketBookingSecondViewController.h"

@interface MovieTicketBookingSecondViewController ()

@end

@implementation MovieTicketBookingSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Account", @"Account");
        self.tabBarItem.image = [UIImage imageNamed:@"account-icon"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
