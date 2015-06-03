//
//  MovieTicketBookingCell.m
//  MovieTicketBooking
//
//  Created by Vikas CG on 12/24/13.
//  Copyright (c) 2013 EST. All rights reserved.
//

#import "MovieTicketBookingCell.h"

@implementation MovieTicketBookingCell
@synthesize strMainTitle;
@synthesize strGenre;
@synthesize strLanguage;
@synthesize strLocation;
@synthesize strDuration;
@synthesize strCastcrew;
@synthesize imageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(05, 15, 60, 60)];
        [self.contentView addSubview:imageView];
        
        strMainTitle = [[UILabel alloc] initWithFrame:CGRectMake(xAXIS, 05, self.frame.size.width-xAXIS, 10)];
        [strMainTitle setTextColor:[UIColor redColor]];
        [strMainTitle setFont:[UIFont fontWithName:kHelveticaBoldFont size:kFontSize10]];
        [strMainTitle setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:strMainTitle];
        
        strGenre = [[UILabel alloc] initWithFrame:CGRectMake(xAXIS, strMainTitle.frame.origin.y+strMainTitle.frame.size.height+LBLSPACING, self.frame.size.width-xAXIS, 8)];
        [strGenre setTextColor:[UIColor blackColor]];
        [strGenre setFont:[UIFont fontWithName:kHelveticaBoldFont size:kFontSize8]];
        [strGenre setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:strGenre];
        
        strLanguage = [[UILabel alloc] initWithFrame:CGRectMake(xAXIS, strGenre.frame.origin.y+strGenre.frame.size.height+LBLSPACING, self.frame.size.width-xAXIS, 8)];
        [strLanguage setTextColor:[UIColor blackColor]];
        [strLanguage setFont:[UIFont fontWithName:kHelveticaBoldFont size:kFontSize8]];
        [strLanguage setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:strLanguage];
        
        strLocation = [[UILabel alloc] initWithFrame:CGRectMake(xAXIS, strLanguage.frame.origin.y+strLanguage.frame.size.height+LBLSPACING, self.frame.size.width-xAXIS, 8)];
        [strLocation setTextColor:[UIColor blackColor]];
        [strLocation setFont:[UIFont fontWithName:kHelveticaBoldFont size:kFontSize8]];
        [strLocation setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:strLocation];
        
        strDuration = [[UILabel alloc] initWithFrame:CGRectMake(xAXIS, strLocation.frame.origin.y+strLocation.frame.size.height+LBLSPACING, self.frame.size.width-xAXIS-40, 8)];
        [strDuration setFont:[UIFont fontWithName:kHelveticaBoldFont size:kFontSize8]];
        [strDuration setTextColor:[UIColor blackColor]];
        [strDuration setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:strDuration];
        
        strCastcrew = [[UILabel alloc] initWithFrame:CGRectMake(xAXIS, strDuration.frame.origin.y+strDuration.frame.size.height+LBLSPACING, self.frame.size.width-xAXIS-40, 16)];
        [strCastcrew setFont:[UIFont fontWithName:kHelveticaBoldFont size:kFontSize8]];
        [strCastcrew setTextColor:[UIColor blackColor]];
        [strCastcrew setTextAlignment:NSTextAlignmentLeft];
        [strCastcrew setLineBreakMode:NSLineBreakByWordWrapping];
        [self.contentView addSubview:strCastcrew];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
