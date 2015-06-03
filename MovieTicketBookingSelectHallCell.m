//
//  MovieTicketBookingSelectHallCell.m
//  MovieTicketBooking
//
//  Created by Vikas CG on 12/22/13.
//  Copyright (c) 2013 EST. All rights reserved.
//

#import "MovieTicketBookingSelectHallCell.h"
#define lblTimeWidthSpacing 20
#define lblTimeWidth 50

@implementation MovieTicketBookingSelectHallCell
@synthesize lblTheaterName;
@synthesize lblTime1;
@synthesize lblTime2;
@synthesize lblTime3;
@synthesize lblTime4;
@synthesize lblTime5;
@synthesize lblTime6;
@synthesize lblTime7;
@synthesize lblTime8;
@synthesize lblTime9;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andRow:(int) row andSEL:(SEL)_sel andDelegate:(id) _delegate
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        lblTheaterName = [[UILabel alloc] initWithFrame:CGRectMake(xAXIS, 05, self.frame.size.width-xAXIS, 10)];
        [lblTheaterName setTextColor:[UIColor blackColor]];
        [lblTheaterName setFont:[UIFont fontWithName:kHelveticaBoldFont size:kFontSize10]];
        [lblTheaterName setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:lblTheaterName];
        
        lblTime1 = [UIButton buttonWithType:UIButtonTypeCustom];
        lblTime1.frame = CGRectMake(xAXIS, lblTheaterName.frame.origin.y+lblTheaterName.frame.size.height+LBLSPACING, lblTimeWidth, 8);
        [lblTime1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [lblTime1.titleLabel setFont: [UIFont fontWithName:kHelveticaFont size:kFontSize8]];
        [lblTime1.titleLabel setLineBreakMode: NSLineBreakByWordWrapping];
        [lblTime1.titleLabel setTextAlignment : NSTextAlignmentCenter];
        lblTime1.tag = row;
        [lblTime1 addTarget:_delegate action:_sel forControlEvents:UIControlEventTouchUpInside];
        [lblTime1 setHidden:YES];
        [self.contentView addSubview:lblTime1];
        
        lblTime2 = [UIButton buttonWithType:UIButtonTypeCustom];
        lblTime2.frame = CGRectMake(lblTime1.frame.origin.x+lblTime1.frame.size.width+lblTimeWidthSpacing, lblTheaterName.frame.origin.y+lblTheaterName.frame.size.height+LBLSPACING, lblTimeWidth, 8);
        lblTime2.tag = row;
        [lblTime2.titleLabel setFont: [UIFont fontWithName:kHelveticaFont size:kFontSize8]];
        [lblTime2.titleLabel setLineBreakMode: NSLineBreakByWordWrapping];
        [lblTime2.titleLabel setTextAlignment : NSTextAlignmentCenter];
        [lblTime2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [lblTime2 addTarget:_delegate action:_sel forControlEvents:UIControlEventTouchUpInside];
        [lblTime2 setHidden:YES];
        [self.contentView addSubview:lblTime2];
        
        lblTime3 = [UIButton buttonWithType:UIButtonTypeCustom];
        lblTime3.frame = CGRectMake(lblTime2.frame.origin.x+lblTime2.frame.size.width+lblTimeWidthSpacing, lblTheaterName.frame.origin.y+lblTheaterName.frame.size.height+LBLSPACING, lblTimeWidth, 8);
        lblTime3.tag = row;
        [lblTime3.titleLabel setFont: [UIFont fontWithName:kHelveticaFont size:kFontSize8]];
        [lblTime3.titleLabel setLineBreakMode: NSLineBreakByWordWrapping];
        [lblTime3.titleLabel setTextAlignment : NSTextAlignmentCenter];
        [lblTime3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [lblTime3 addTarget:_delegate action:_sel forControlEvents:UIControlEventTouchUpInside];
        [lblTime3 setHidden:YES];
        [self.contentView addSubview:lblTime3];
        
        lblTime4 = [UIButton buttonWithType:UIButtonTypeCustom];
        lblTime4.frame = CGRectMake(xAXIS, lblTime3.frame.origin.y+lblTime3.frame.size.height+LBLSPACING, lblTimeWidth, 8);
        lblTime4.tag = row;
        [lblTime4.titleLabel setFont: [UIFont fontWithName:kHelveticaFont size:kFontSize8]];
        [lblTime4.titleLabel setLineBreakMode: NSLineBreakByWordWrapping];
        [lblTime4.titleLabel setTextAlignment : NSTextAlignmentCenter];
        [lblTime4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [lblTime4 addTarget:_delegate action:_sel forControlEvents:UIControlEventTouchUpInside];
        [lblTime4 setHidden:YES];
        [self.contentView addSubview:lblTime4];
        
        lblTime5 = [UIButton buttonWithType:UIButtonTypeCustom];
        lblTime5.frame = CGRectMake(lblTime4.frame.origin.x+lblTime4.frame.size.width+lblTimeWidthSpacing, lblTime4.frame.origin.y, lblTimeWidth, 8);
        lblTime5.tag = row;
        [lblTime5.titleLabel setFont: [UIFont fontWithName:kHelveticaFont size:kFontSize8]];
        [lblTime5.titleLabel setLineBreakMode: NSLineBreakByWordWrapping];
        [lblTime5.titleLabel setTextAlignment : NSTextAlignmentCenter];
        [lblTime5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [lblTime5 addTarget:_delegate action:_sel forControlEvents:UIControlEventTouchUpInside];
        [lblTime5 setHidden:YES];
        [self.contentView addSubview:lblTime5];
        
        lblTime6 = [UIButton buttonWithType:UIButtonTypeCustom];
        lblTime6.frame = CGRectMake(lblTime5.frame.origin.x+lblTime5.frame.size.width+lblTimeWidthSpacing, lblTime5.frame.origin.y, lblTimeWidth, 8);
        lblTime6.tag = row;
        [lblTime6.titleLabel setFont: [UIFont fontWithName:kHelveticaFont size:kFontSize8]];
        [lblTime6.titleLabel setLineBreakMode: NSLineBreakByWordWrapping];
        [lblTime6.titleLabel setTextAlignment : NSTextAlignmentCenter];
        [lblTime6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [lblTime6 addTarget:_delegate action:_sel forControlEvents:UIControlEventTouchUpInside];
        [lblTime6 setHidden:YES];
        [self.contentView addSubview:lblTime6];
        
        lblTime7 = [UIButton buttonWithType:UIButtonTypeCustom];
        lblTime7.frame = CGRectMake(xAXIS, lblTime4.frame.origin.y+lblTime4.frame.size.height+LBLSPACING, lblTimeWidth, 8);
        lblTime7.tag = row;
        [lblTime7.titleLabel setFont: [UIFont fontWithName:kHelveticaFont size:kFontSize8]];
        [lblTime7.titleLabel setLineBreakMode: NSLineBreakByWordWrapping];
        [lblTime7.titleLabel setTextAlignment : NSTextAlignmentCenter];
        [lblTime7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [lblTime7 addTarget:_delegate action:_sel forControlEvents:UIControlEventTouchUpInside];
        [lblTime7 setHidden:YES];
        [self.contentView addSubview:lblTime7];
        
        lblTime8 = [UIButton buttonWithType:UIButtonTypeCustom];
        lblTime8.frame = CGRectMake(lblTime7.frame.origin.x+lblTime7.frame.size.width+lblTimeWidthSpacing, lblTime7.frame.origin.y, lblTimeWidth, 8);
        lblTime8.tag = row;
        [lblTime8.titleLabel setFont: [UIFont fontWithName:kHelveticaFont size:kFontSize8]];
        [lblTime8.titleLabel setLineBreakMode: NSLineBreakByWordWrapping];
        [lblTime8.titleLabel setTextAlignment : NSTextAlignmentCenter];
        [lblTime8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [lblTime8 addTarget:_delegate action:_sel forControlEvents:UIControlEventTouchUpInside];
        [lblTime8 setHidden:YES];
        [self.contentView addSubview:lblTime8];
        
        lblTime9 = [UIButton buttonWithType:UIButtonTypeCustom];
        lblTime9.frame = CGRectMake(lblTime8.frame.origin.x+lblTime8.frame.size.width+lblTimeWidthSpacing, lblTime8.frame.origin.y, lblTimeWidth, 8);
        lblTime9.tag = row;
        [lblTime9.titleLabel setFont: [UIFont fontWithName:kHelveticaFont size:kFontSize8]];
        [lblTime9.titleLabel setLineBreakMode: NSLineBreakByWordWrapping];
        [lblTime9.titleLabel setTextAlignment : NSTextAlignmentCenter];
        [lblTime9 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [lblTime9 setHidden:YES];
        [lblTime9 addTarget:_delegate action:_sel forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:lblTime9];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
