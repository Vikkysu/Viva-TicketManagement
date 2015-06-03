//
//  MovieTicketBookingSeatCatagoryCell.m
//  MovieTicketBooking
//
//  Created by Vikas CG on 12/24/13.
//  Copyright (c) 2013 EST. All rights reserved.
//

#import "MovieTicketBookingSeatCatagoryCell.h"

@implementation MovieTicketBookingSeatCatagoryCell
@synthesize lblSeatCatagory;
@synthesize btnPlus;
@synthesize txtNoOfSeats;
@synthesize btnMinus;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andRow:(int) row
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        lblSeatCatagory = [[UILabel alloc] initWithFrame:CGRectMake(lblSpacing*3, lblSpacing, 220, 40)];
        [lblSeatCatagory setTextColor:[UIColor redColor]];
        [lblSeatCatagory setFont:[UIFont fontWithName:kHelveticaBoldFont size:kFontSize10]];
        [lblSeatCatagory setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:lblSeatCatagory];

        btnMinus = [UIButton buttonWithType:UIButtonTypeContactAdd];
        btnMinus.frame = CGRectMake(lblSeatCatagory.frame.origin.x+lblSeatCatagory.frame.size.width, 10, 20, 20);
        [btnMinus setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btnMinus.tag = row;
        [self.contentView addSubview:btnMinus];
        
        
        txtNoOfSeats = [[UITextField alloc] initWithFrame:CGRectMake(btnMinus.frame.origin.x+btnMinus.frame.size.width+2, 05, 30, 30)];
        [txtNoOfSeats setTextAlignment:NSTextAlignmentCenter];
        [txtNoOfSeats setBorderStyle:UITextBorderStyleRoundedRect];
        [txtNoOfSeats setTextColor:[UIColor blackColor]];
        [self.contentView addSubview:txtNoOfSeats];
        
        btnPlus = [UIButton buttonWithType:UIButtonTypeContactAdd];
        btnPlus.frame = CGRectMake(txtNoOfSeats.frame.origin.x+txtNoOfSeats.frame.size.width+2, 10, 20, 20);
        [btnPlus setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btnPlus.tag = row;
        [self.contentView addSubview:btnPlus];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
