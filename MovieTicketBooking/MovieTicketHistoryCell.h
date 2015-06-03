//
//  MovieTicketHistoryCell.h
//  MovieTicketBooking
//
//  Created by Vikas CG on 12/22/13.
//  Copyright (c) 2013 EST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTicketHistoryCell : UITableViewCell
{
    UILabel *strMainTitle;
    UILabel *strBookingID;
    UILabel *strVenue;
    UILabel *strLocation;
    UILabel *strDateTime;
    UILabel *strQuantity;
    UILabel *strSeatInfo;
    UILabel *strShowTime;
    UILabel *strAmount;

}

@property (nonatomic, strong) UILabel *strMainTitle;
@property (nonatomic, strong) UILabel *strBookingID;
@property (nonatomic, strong) UILabel *strVenue;
@property (nonatomic, strong) UILabel *strLocation;
@property (nonatomic, strong) UILabel *strDateTime;
@property (nonatomic, strong) UILabel *strQuantity;
@property (nonatomic, strong) UILabel *strSeatInfo;
@property (nonatomic, strong) UILabel *strShowTime;
@property (nonatomic, strong) UILabel *strAmount;
@end
