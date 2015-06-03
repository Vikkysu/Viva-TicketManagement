//
//  MovieTicketBookingConstantHeader.h
//  MovieTicketBooking
//
//  Created by Vikas CG on 12/22/13.
//  Copyright (c) 2013 EST. All rights reserved.
//

#ifndef MovieTicketBooking_MovieTicketBookingConstantHeader_h
#define MovieTicketBooking_MovieTicketBookingConstantHeader_h

#define DEVICE_IS_IPHONE                                    ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define DEVICE_IS_IPAD                                      ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define IS_IPHONE                                           (!IS_IPAD)
#define IS_IPAD                                             (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPhone)

#define MOVIENAME       @"Movie Name"
#define MOVIEGENRE      @"Genre"
#define MOVIELANGUAGE   @"Language"
#define MOVIEDURATION   @"Duration"
#define MOVIECREWCAST   @"Crew Cast"
#define BOOKINGID       @"Booking ID"
#define VENUE           @"Venue"
#define LOCATION        @"Location"
#define DATETIME        @"Date Time"
#define QUANTITY        @"Quantity"
#define SEATINFO        @"Seat Info"
#define SHOWTIME        @"Show Time"
#define AMOUNT          @"Amount"
#define SEATCATAGORY    @"SEATCATAGORY"

#define BOOKINGHIS      @"Booking History"

#define THREATERNAME    @"Threater Name"
#define TIME1           @"Time 1"
#define TIME2           @"Time 2"
#define TIME3           @"Time 3"
#define TIME4           @"Time 4"
#define TIME5           @"Time 5"
#define TIME6           @"Time 6"
#define TIME7           @"Time 7"
#define TIME8           @"Time 8"
#define TIME9           @"Time 9"

//fontSize
#define kFontSize0                                          0.0
#define kFontSize5                                          5.0
#define kFontSize8                                          8.0
#define kFontSize10                                         10.0
#define kFontSize12                                         12.0
#define kFontSize13                                         13.0
#define kFontSize15                                         15.0
#define kFontSize18                                         18.0
#define kFontSize20                                         20.0
#define kFontSize25                                         25.0
#define kFontSize30                                         30.0

#define kHelveticaFont                                      @"Helvetica"
#define kHelveticaBoldFont                                  @"Helvetica-Bold"

#endif
