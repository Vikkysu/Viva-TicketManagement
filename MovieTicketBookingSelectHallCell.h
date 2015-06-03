//
//  MovieTicketBookingSelectHallCell.h
//  MovieTicketBooking
//
//  Created by Vikas CG on 12/22/13.
//  Copyright (c) 2013 EST. All rights reserved.
//

#import <UIKit/UIKit.h>
#define xAXIS   20
#define LBLSPACING 10

@interface MovieTicketBookingSelectHallCell : UITableViewCell
{
    UILabel *lblTheaterName;
    UIButton *lblTime1;
    UIButton *lblTime2;
    UIButton *lblTime3;
    UIButton *lblTime4;
    UIButton *lblTime5;
    UIButton *lblTime6;
    UIButton *lblTime7;
    UIButton *lblTime8;
    UIButton *lblTime9;
}

@property (nonatomic, strong) UILabel *lblTheaterName;
@property (nonatomic, strong) UIButton *lblTime1;
@property (nonatomic, strong) UIButton *lblTime2;
@property (nonatomic, strong) UIButton *lblTime3;
@property (nonatomic, strong) UIButton *lblTime4;
@property (nonatomic, strong) UIButton *lblTime5;
@property (nonatomic, strong) UIButton *lblTime6;
@property (nonatomic, strong) UIButton *lblTime7;
@property (nonatomic, strong) UIButton *lblTime8;
@property (nonatomic, strong) UIButton *lblTime9;
@property (nonatomic, strong) UIButton *lblTime10;
@property (nonatomic, strong) UIButton *lblTime11;
@property (nonatomic, strong) UIButton *lblTime12;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andRow:(int) row andSEL:(SEL)_sel andDelegate:(id) _delegate;

@end
