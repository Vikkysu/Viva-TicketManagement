//
//  MovieTicketBookingFirstViewController.h
//  MovieTicketBooking
//
//  Created by Vikas CG on 12/21/13.
//  Copyright (c) 2013 EST. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoRecord.h"
#import "PendingOperations.h"
#import "ImageDownloader.h"
#import "ImageFiltration.h"

// 2: Hereís the reference to the AFNetworking library.
#import "AFNetworking.h"

#define kDatasourceURLString @"https://sites.google.com/site/soheilsstudio/tutorials/nsoperationsampleproject/ClassicPhotosDictionary.plist"

// 3: Make sure to make ListViewController compliant to ImageDownloader and ImageFiltration delegate methods.

@interface MovieTicketBookingFirstViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate,UIPickerViewDataSource,UIActionSheetDelegate, ImageDownloaderDelegate, ImageFiltrationDelegate>
{
    IBOutlet UITableView    *movieListTableView;
    UIActionSheet           *actionSheet;
    UIPickerView            *mPickerView;
    int                     mFrameHeight;
}

// 4: You donít need the data source as-is. You are going to create instances of PhotoRecord using the property list. So, change the class of ìphotosî from NSDictionary to NSMutableArray, so that you can update the array of photos.
@property (nonatomic, strong) NSMutableArray *photos; // main data source of controller

// 5: This property is used to track pending operations.
@property (nonatomic, strong) PendingOperations *pendingOperations;

@property (nonatomic) IBOutlet UITableView *movieListTableView;
@end
