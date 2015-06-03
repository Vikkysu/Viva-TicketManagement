//
//  MovieTicketBookingOrderSummaryViewController.h
//  MovieTicketBooking
//
//  Created by Vikas CG on 12/26/13.
//  Copyright (c) 2013 EST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTicketBookingOrderSummaryViewController : UIViewController
{
    IBOutlet UILabel *lblMovieName;
    IBOutlet UILabel *lblVenue;
    IBOutlet UILabel *lblLocation;
    IBOutlet UILabel *lblDateTime;
    IBOutlet UILabel *lblQuantity;
    IBOutlet UILabel *lblSeatInfo;
    IBOutlet UILabel *lblTicketAmount;
    IBOutlet UILabel *lblTax;
    IBOutlet UILabel *lblInternetHandCharges;
    IBOutlet UILabel *lblTotalAmount;
}
@property (nonatomic, strong)     IBOutlet UILabel *lblMovieName;
@property (nonatomic, strong)    IBOutlet UILabel *lblVenue;
@property (nonatomic, strong)    IBOutlet UILabel *lblLocation;
@property (nonatomic, strong)    IBOutlet UILabel *lblDateTime;
@property (nonatomic, strong)    IBOutlet UILabel *lblQuantity;
@property (nonatomic, strong)    IBOutlet UILabel *lblSeatInfo;
@property (nonatomic, strong)    IBOutlet UILabel *lblTicketAmount;
@property (nonatomic, strong)    IBOutlet UILabel *lblTax;
@property (nonatomic, strong)    IBOutlet UILabel *lblInternetHandCharges;
@property (nonatomic, strong)    IBOutlet UILabel *lblTotalAmount;
@end
