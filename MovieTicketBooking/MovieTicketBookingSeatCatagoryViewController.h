//
//  MovieTicketBookingSeatCatagoryViewController.h
//  MovieTicketBooking
//
//  Created by Vikas CG on 12/24/13.
//  Copyright (c) 2013 EST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTicketBookingSeatCatagoryViewController : UIViewController
{
    IBOutlet UILabel *lblMovieName;
    IBOutlet UILabel *lblVenue;
    IBOutlet UILabel *lblDateTime;
    
    IBOutlet UITableView *tblSeatCatagory;
    
    int noOfSeatsCell1;
    int noOfSeatsCell2;
    int noOfSeatsCell3;
}
@property(nonatomic, strong) IBOutlet UILabel *lblMovieName;
@property(nonatomic, strong) IBOutlet UILabel *lblVenue;
@property(nonatomic, strong) IBOutlet UILabel *lblDateTime;
@property(nonatomic, strong) IBOutlet UITableView *tblSeatCatagory;

@end
