//
//  MovieTicketHistoryCell.m
//  MovieTicketBooking
//
//  Created by Vikas CG on 12/22/13.
//  Copyright (c) 2013 EST. All rights reserved.
//

#import "MovieTicketHistoryCell.h"

#define xAXIS       100
#define xAXISlbl    20
#define LBLSPACING  2

@implementation MovieTicketHistoryCell

@synthesize strMainTitle;
@synthesize strBookingID;
@synthesize strVenue;
@synthesize strLocation;
@synthesize strDateTime;
@synthesize strQuantity;
@synthesize strSeatInfo;
@synthesize strShowTime;
@synthesize strAmount;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        strMainTitle = [[UILabel alloc] initWithFrame:CGRectMake(xAXISlbl, 05, self.frame.size.width-xAXIS, 10)];
        [strMainTitle setTextColor:[UIColor redColor]];
        [strMainTitle setFont:[UIFont fontWithName:kHelveticaBoldFont size:kFontSize10]];
        [strMainTitle setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:strMainTitle];
        
        UILabel *lblBookingID = [[UILabel alloc] initWithFrame:CGRectMake(xAXISlbl, strMainTitle.frame.origin.y+strMainTitle.frame.size.height+LBLSPACING, 100, 6)];
        [lblBookingID setTextColor:[UIColor blackColor]];
        [lblBookingID setText:@"Booking ID:"];
        [lblBookingID setFont:[UIFont fontWithName:kHelveticaFont size:kFontSize5]];
        [lblBookingID setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:lblBookingID];
        
        strBookingID = [[UILabel alloc] initWithFrame:CGRectMake(xAXIS, strMainTitle.frame.origin.y+strMainTitle.frame.size.height+LBLSPACING, self.frame.size.width-xAXIS, 6)];
        [strBookingID setTextColor:[UIColor blackColor]];
        [strBookingID setFont:[UIFont fontWithName:kHelveticaBoldFont size:kFontSize5]];
        [strBookingID setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:strBookingID];
        
        UILabel *lblVenue = [[UILabel alloc] initWithFrame:CGRectMake(xAXISlbl, strBookingID.frame.origin.y+strBookingID.frame.size.height+LBLSPACING, 100, 6)];
        [lblVenue setTextColor:[UIColor blackColor]];
        [lblVenue setText:@"Venue:"];
        [lblVenue setFont:[UIFont fontWithName:kHelveticaFont size:kFontSize5]];
        [lblVenue setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:lblVenue];
        
        strVenue = [[UILabel alloc] initWithFrame:CGRectMake(xAXIS, strBookingID.frame.origin.y+strBookingID.frame.size.height+LBLSPACING, self.frame.size.width-xAXIS, 6)];
        [strVenue setTextColor:[UIColor blackColor]];
        [strVenue setFont:[UIFont fontWithName:kHelveticaBoldFont size:kFontSize5]];
        [strVenue setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:strVenue];
        
        UILabel *lblLocation = [[UILabel alloc] initWithFrame:CGRectMake(xAXISlbl, strVenue.frame.origin.y+strVenue.frame.size.height+LBLSPACING, 100, 6)];
        [lblLocation setTextColor:[UIColor blackColor]];
        [lblLocation setText:@"Location:"];
        [lblLocation setFont:[UIFont fontWithName:kHelveticaFont size:kFontSize5]];
        [lblLocation setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:lblLocation];
        
        strLocation = [[UILabel alloc] initWithFrame:CGRectMake(xAXIS, strVenue.frame.origin.y+strVenue.frame.size.height+LBLSPACING, self.frame.size.width-xAXIS, 6)];
        [strLocation setTextColor:[UIColor blackColor]];
        [strLocation setFont:[UIFont fontWithName:kHelveticaBoldFont size:kFontSize5]];
        [strLocation setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:strLocation];
        
        UILabel *lblDateTime = [[UILabel alloc] initWithFrame:CGRectMake(xAXISlbl, strLocation.frame.origin.y+strLocation.frame.size.height+LBLSPACING, 100, 6)];
        [lblDateTime setTextColor:[UIColor blackColor]];
        [lblDateTime setText:@"Date & Time:"];
        [lblDateTime setFont:[UIFont fontWithName:kHelveticaFont size:kFontSize5]];
        [lblDateTime setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:lblDateTime];
        
        strDateTime = [[UILabel alloc] initWithFrame:CGRectMake(xAXIS, strLocation.frame.origin.y+strLocation.frame.size.height+LBLSPACING, self.frame.size.width-xAXIS-40, 6)];
        [strDateTime setFont:[UIFont fontWithName:kHelveticaBoldFont size:kFontSize5]];
        [strDateTime setTextColor:[UIColor blackColor]];
        [strDateTime setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:strDateTime];
        
        UILabel *lblQuantity = [[UILabel alloc] initWithFrame:CGRectMake(xAXISlbl, strDateTime.frame.origin.y+strDateTime.frame.size.height+LBLSPACING, 100, 6)];
        [lblQuantity setTextColor:[UIColor blackColor]];
        [lblQuantity setText:@"Quantity:"];
        [lblQuantity setFont:[UIFont fontWithName:kHelveticaFont size:kFontSize5]];
        [lblQuantity setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:lblQuantity];
        
        strQuantity = [[UILabel alloc] initWithFrame:CGRectMake(xAXIS, strDateTime.frame.origin.y+strDateTime.frame.size.height+LBLSPACING, self.frame.size.width-xAXIS-40, 6)];
        [strQuantity setFont:[UIFont fontWithName:kHelveticaBoldFont size:kFontSize5]];
        [strQuantity setTextColor:[UIColor blackColor]];
        [strQuantity setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:strQuantity];
        
        UILabel *lblSeatInfo = [[UILabel alloc] initWithFrame:CGRectMake(xAXISlbl, strQuantity.frame.origin.y+strQuantity.frame.size.height+LBLSPACING, 100, 6)];
        [lblSeatInfo setTextColor:[UIColor blackColor]];
        [lblSeatInfo setText:@"Seat Info:"];
        [lblSeatInfo setFont:[UIFont fontWithName:kHelveticaFont size:kFontSize5]];
        [lblSeatInfo setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:lblSeatInfo];
        
        strSeatInfo = [[UILabel alloc] initWithFrame:CGRectMake(xAXIS, strQuantity.frame.origin.y+strQuantity.frame.size.height+LBLSPACING, self.frame.size.width-xAXIS, 6)];
        [strSeatInfo setFont:[UIFont fontWithName:kHelveticaBoldFont size:kFontSize5]];
        [strSeatInfo setTextColor:[UIColor blackColor]];
        [strSeatInfo setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:strSeatInfo];
        
        UILabel *lblShowTime = [[UILabel alloc] initWithFrame:CGRectMake(xAXISlbl, strSeatInfo.frame.origin.y+strSeatInfo.frame.size.height+LBLSPACING, 100, 6)];
        [lblShowTime setTextColor:[UIColor blackColor]];
        [lblShowTime setText:@"Show Time:"];
        [lblShowTime setFont:[UIFont fontWithName:kHelveticaFont size:kFontSize5]];
        [lblShowTime setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:lblShowTime];
        
        strShowTime = [[UILabel alloc] initWithFrame:CGRectMake(xAXIS, strSeatInfo.frame.origin.y+strSeatInfo.frame.size.height+LBLSPACING, self.frame.size.width-xAXIS, 6)];
        [strShowTime setFont:[UIFont fontWithName:kHelveticaBoldFont size:kFontSize5]];
        [strShowTime setTextColor:[UIColor blackColor]];
        [strShowTime setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:strShowTime];
        
        UILabel *lblAmount = [[UILabel alloc] initWithFrame:CGRectMake(xAXISlbl, strShowTime.frame.origin.y+strShowTime.frame.size.height+LBLSPACING, 100, 6)];
        [lblAmount setTextColor:[UIColor blackColor]];
        [lblAmount setText:@"Amount:"];
        [lblAmount setFont:[UIFont fontWithName:kHelveticaFont size:kFontSize5]];
        [lblAmount setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:lblAmount];
        
        strAmount = [[UILabel alloc] initWithFrame:CGRectMake(xAXIS, strShowTime.frame.origin.y+strShowTime.frame.size.height+LBLSPACING, self.frame.size.width-xAXIS, 6)];
        [strAmount setFont:[UIFont fontWithName:kHelveticaBoldFont size:kFontSize5]];
        [strAmount setTextColor:[UIColor blackColor]];
        [strAmount setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:strAmount];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
