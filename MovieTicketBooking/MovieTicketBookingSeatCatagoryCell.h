//
//  MovieTicketBookingSeatCatagoryCell.h
//  MovieTicketBooking
//
//  Created by Vikas CG on 12/24/13.
//  Copyright (c) 2013 EST. All rights reserved.
//

#import <UIKit/UIKit.h>
#define lblSpacing 05
#define xAXIS   20

@interface MovieTicketBookingSeatCatagoryCell : UITableViewCell
{
    UILabel *lblSeatCatagory;
    UIButton *btnPlus;
    UITextField *txtNoOfSeats;
    UIButton *btnMinus;
}

@property(nonatomic, strong) UILabel *lblSeatCatagory;
@property(nonatomic, strong) UIButton *btnPlus;
@property(nonatomic, strong) UITextField *txtNoOfSeats;
@property(nonatomic, strong) UIButton *btnMinus;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andRow:(int) row;

@end
