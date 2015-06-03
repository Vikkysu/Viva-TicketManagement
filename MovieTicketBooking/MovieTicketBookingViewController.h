//
//  MovieTicketBookingViewController.h
//  MovieTicketBooking
//
//  Created by Vikas CG on 12/22/13.
//  Copyright (c) 2013 EST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTicketBookingViewController : UIViewController<UIActionSheetDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
{
    IBOutlet UIButton *dateBtn;
}
-(IBAction) showDate:(id)sender;

@end
