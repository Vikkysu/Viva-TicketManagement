//
//  MovieTicketBookingCell.h
//  MovieTicketBooking
//
//  Created by Vikas CG on 12/24/13.
//  Copyright (c) 2013 EST. All rights reserved.
//

#import <UIKit/UIKit.h>
#define xAXIS       100
#define xAXISlbl    20
#define LBLSPACING  2

@interface MovieTicketBookingCell : UITableViewCell
{
    UILabel     *strMainTitle;
    UILabel     *strGenre;
    UILabel     *strLanguage;
    UILabel     *strLocation;
    UILabel     *strDuration;
    UILabel     *strCastcrew;
    UIImageView *imageView;
}

@property (nonatomic, strong) UILabel *strMainTitle;
@property (nonatomic, strong) UILabel *strGenre;
@property (nonatomic, strong) UILabel *strLanguage;
@property (nonatomic, strong) UILabel *strLocation;
@property (nonatomic, strong) UILabel *strDuration;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *strCastcrew;

@end
