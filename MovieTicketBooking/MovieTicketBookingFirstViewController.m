//
//  MovieTicketBookingFirstViewController.m
//  MovieTicketBooking
//
//  Created by Vikas CG on 12/21/13.
//  Copyright (c) 2013 EST. All rights reserved.
//

#import "MovieTicketBookingFirstViewController.h"
#import "MovieTicketBookingCell.h"
#import "MovieTicketBookingViewController.h"

@interface MovieTicketBookingFirstViewController ()
{
    NSMutableArray *movieList;
}

@end

@implementation MovieTicketBookingFirstViewController
@synthesize movieListTableView;

@synthesize photos = _photos;
@synthesize pendingOperations = _pendingOperations;

#pragma mark -
#pragma mark - Lazy instantiation


- (PendingOperations *)pendingOperations {
    if (!_pendingOperations) {
        _pendingOperations = [[PendingOperations alloc] init];
    }
    return _pendingOperations;
}

- (NSMutableArray *)photos {
    
    if (!_photos) {
        
        // 1: Create a NSURL and a NSURLRequest to points to the location of the data source.
        NSURL *datasourceURL = [NSURL URLWithString:kDatasourceURLString];
        NSURLRequest *request = [NSURLRequest requestWithURL:datasourceURL];
        
        // 2: Use AFHTTPRequestOperation class, alloc and init it with the request.
        AFHTTPRequestOperation *datasource_download_operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        
        // 3: Give the user feedback, while downloading the data source by enabling network activity indicator.
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        
        // 4: By using setCompletionBlockWithSuccess:failure:, you can add two blocks: one for the case where the operation finishes successfully, and one for the case where it fails.
        [datasource_download_operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            // 5: In the success block, download the property list as NSData, and then by using toll-free bridging for data into CFDataRef and CFPropertyList, convert it into NSDictionary.
            NSData *datasource_data = (NSData *)responseObject;
            CFPropertyListRef plist =  CFPropertyListCreateFromXMLData(kCFAllocatorDefault, (__bridge CFDataRef)datasource_data, kCFPropertyListImmutable, NULL);
            
            NSDictionary *datasource_dictionary = (__bridge NSDictionary *)plist;
            
            // 6: Create a NSMutableArray and iterate through all objects and keys in the dictionary, create a PhotoRecord instance, and store it in the array.
            NSMutableArray *records = [NSMutableArray array];
            NSString *key = nil;
            for (int i=0; i < 2; i++) {
                key = [[datasource_dictionary allKeys] objectAtIndex:i];
                PhotoRecord *record = [[PhotoRecord alloc] init];
                record.URL = [NSURL URLWithString:[datasource_dictionary objectForKey:key]];
                record.name = key;
                [records addObject:record];
                record = nil;
            }
            
            // 7: Once you are done, point the _photo to the array of records, reload the table view and stop the network activity indicator. You also release the ìplistî instance variable.
            self.photos = records;
            
            CFRelease(plist);
            
            [self.movieListTableView reloadData];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error){
            
            // 8: In case you are not successful, you display a message to notify the user.
            // Connection error message
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                            message:error.localizedDescription
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            alert = nil;
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        }];
        
        // 9: Finally, add ìdatasource_download_operationî to ìdownloadQueueî of PendingOperations.
        [self.pendingOperations.downloadQueue addOperation:datasource_download_operation];
    }
    return _photos;
}


#pragma mark view delegates
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Home", @"Home");
        self.tabBarItem.image = [UIImage imageNamed:@"home-icon"];
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    UINavigationBar *navBar = self.navigationController.navigationBar;
    UIImage *image = [UIImage imageNamed:@"top-bar"];
    [navBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];

    mFrameHeight=self.view.frame.size.width;

	// Do any additional setup after loading the view, typically from a nib.
    UIBarButtonItem *btnReload = [[UIBarButtonItem alloc]initWithTitle:@"Select City" style:UIBarButtonItemStylePlain target:self action:@selector(btnReloadPressed:)];
    self.navigationController.topViewController.navigationItem.rightBarButtonItem = btnReload;
    btnReload.enabled=TRUE;
    btnReload.style=UIBarButtonSystemItemRefresh;
    
    movieListTableView.frame = CGRectMake(0, 0, 320, 369);
    [movieListTableView setBackgroundColor:[UIColor blackColor]];
    
    NSDictionary *movie1 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"Bullet Raja", @"Action", @"Hindi",  @"2:30 min", @"Saif Ali Khan, Sonakshi sihna, Rajakumar, Adithya, Pooja, Ramya", nil] forKeys:[NSArray arrayWithObjects:MOVIENAME, MOVIEGENRE, MOVIELANGUAGE, MOVIEDURATION, MOVIECREWCAST, nil]];
    
    NSDictionary *movie2 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"DOOM 3", @"THRILER", @"Hindi",  @"2:40 min", @"AMIR Khan, KATRINA, Rajakumar, Adithya, Pooja, Ramya", nil] forKeys:[NSArray arrayWithObjects:MOVIENAME, MOVIEGENRE, MOVIELANGUAGE, MOVIEDURATION, MOVIECREWCAST, nil]];
    
    movieList = [[NSMutableArray alloc] initWithObjects:movie1, movie2, nil];
}

- (void)viewDidUnload {
    [self setPhotos:nil];
    [self setPendingOperations:nil];
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [self cancelAllOperations];
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark btn delegates
-(void) btnReloadPressed:(id) sender
{
    NSLog(@"The method is %s", __func__);
    if (DEVICE_IS_IPHONE)
    {
        if(actionSheet)
        {
            actionSheet=nil;
        }
        actionSheet = [[UIActionSheet alloc] initWithTitle:@" "
                                                  delegate:self
                                         cancelButtonTitle:@"cancel"
                                    destructiveButtonTitle:nil
                                         otherButtonTitles:@"Ok",nil];
        
        [actionSheet setActionSheetStyle:UIActionSheetStyleBlackOpaque];
        [actionSheet showInView:self.view];
        
        //setting the frame of the action sheet for Portrait and landscape
        CGRect lScreenFrame = [[UIScreen mainScreen]bounds];
        [actionSheet setFrame:CGRectMake(0, lScreenFrame.origin.y+200, lScreenFrame.size.width, 300)];
        
        [actionSheet setActionSheetStyle:UIActionSheetStyleBlackOpaque];
        CGRect lpickerFrame = CGRectMake(0, lScreenFrame.origin.y, 0, 0);
        
        if(mPickerView)
        {
            mPickerView=nil;
        }
        mPickerView = [[UIPickerView alloc] initWithFrame:lpickerFrame]  ;
        mPickerView.delegate = self;
        mPickerView.dataSource = self;
        mPickerView.showsSelectionIndicator = YES;
        [actionSheet addSubview:mPickerView];
    }
}

#pragma mark tableview delegates
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     NSInteger count = self.photos.count;
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MovieListCellIdentifier";
    MovieTicketBookingCell *cell = (MovieTicketBookingCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[MovieTicketBookingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    UIImageView *imageView  =   [[UIImageView alloc] initWithFrame:CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height)];
    [imageView setImage:[UIImage imageNamed:@"movie-details-bg"]];
    cell.backgroundView = imageView;
    
    NSDictionary *movieListIndex = [movieList objectAtIndex:indexPath.row];
    cell.strMainTitle.text  =   [movieListIndex objectForKey:MOVIENAME];
    cell.strGenre.text      =   [movieListIndex objectForKey:MOVIEGENRE];
    cell.strLanguage.text   =   [movieListIndex objectForKey:MOVIELANGUAGE];
    cell.strDuration.text   =   [movieListIndex objectForKey:MOVIEDURATION];
    cell.strCastcrew.text   =   [movieListIndex objectForKey:MOVIECREWCAST];
    //cell.imageView.image    =   [UIImage imageNamed:@"movie-img.jpg"];

    // 2: The data source contains instances of PhotoRecord. Get a hold of each of them based on the indexPath of the row.
    PhotoRecord *aRecord = [self.photos objectAtIndex:indexPath.row];
    
    // 3: Inspect the PhotoRecord. If its image is downloaded, display the image, the image name, and stop the activity indicator.
    if (aRecord.hasImage) {
        
        [((UIActivityIndicatorView *)cell.accessoryView) stopAnimating];
        cell.imageView.image = aRecord.image;
    }
    // 4: If downloading the image has failed, display a placeholder to display the failure, and stop the activity indicator.
    else if (aRecord.isFailed) {
        [((UIActivityIndicatorView *)cell.accessoryView) stopAnimating];
        cell.imageView.image = [UIImage imageNamed:@"Failed.png"];
    }
    // 5: Otherwise, the image has not been downloaded yet. Start the download and filtering operations (theyíre not yet implemented), and display a placeholder that indicates you are working on it. Start the activity indicator to show user something is going on.
    else {
        
        [((UIActivityIndicatorView *)cell.accessoryView) startAnimating];
        cell.imageView.image = [UIImage imageNamed:@"Placeholder.png"];
        if (!tableView.dragging && !tableView.decelerating) {
            [self startOperationsForPhotoRecord:aRecord atIndexPath:indexPath];
        }
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"The method is %s", __func__);

    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    UIImageView *imageView  =   [[UIImageView alloc] initWithFrame:CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height)];
    [imageView setImage:[UIImage imageNamed:@"movie-details-bg-hover"]];
    cell.backgroundView = imageView;
    
    MovieTicketBookingViewController *_MovieTicketBookingViewController = [[MovieTicketBookingViewController alloc] initWithNibName:@"MovieTicketBookingViewController" bundle:nil];
    [self.navigationController pushViewController:_MovieTicketBookingViewController animated:NO];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"The method is %s", __func__);

    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    UIImageView *imageView  =   [[UIImageView alloc] initWithFrame:CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height)];
    [imageView setImage:[UIImage imageNamed:@"movie-details-bg"]];
    cell.backgroundView = imageView;
}

#pragma mark -
#pragma mark - Operations

// 1: To keep it simple, you pass in an instance of PhotoRecord that requires operations, along with its indexPath.
- (void)startOperationsForPhotoRecord:(PhotoRecord *)record atIndexPath:(NSIndexPath *)indexPath {
    
    // 2: You inspect it to see whether it has an image; if so, then ignore it.
    if (!record.hasImage) {
        
        // 3: If it does not have an image, start downloading the image by calling startImageDownloadingForRecord:atIndexPath: (which will be implemented shortly). Youíll do the same for filtering operations: if the image has not yet been filtered, call startImageFiltrationForRecord:atIndexPath: (which will also be implemented shortly).
        [self startImageDownloadingForRecord:record atIndexPath:indexPath];
        
    }
    
    if (!record.isFiltered) {
        [self startImageFiltrationForRecord:record atIndexPath:indexPath];
    }
}


- (void)startImageDownloadingForRecord:(PhotoRecord *)record atIndexPath:(NSIndexPath *)indexPath {
    
    // 1: First, check for the particular indexPath to see if there is already an operation in downloadsInProgress for it. If so, ignore it.
    if (![self.pendingOperations.downloadsInProgress.allKeys containsObject:indexPath]) {
        
        // 2: If not, create an instance of ImageDownloader by using the designated initializer, and set ListViewController as the delegate. Pass in the appropriate indexPath and a pointer to the instance of PhotoRecord, and then add it to the download queue. You also add it to downloadsInProgress to help keep track of things.
        // Start downloading
        ImageDownloader *imageDownloader = [[ImageDownloader alloc] initWithPhotoRecord:record atIndexPath:indexPath delegate:self];
        [self.pendingOperations.downloadsInProgress setObject:imageDownloader forKey:indexPath];
        [self.pendingOperations.downloadQueue addOperation:imageDownloader];
    }
}


- (void)startImageFiltrationForRecord:(PhotoRecord *)record atIndexPath:(NSIndexPath *)indexPath {
    
    // 3: If not, create an instance of ImageDownloader by using the designated initializer, and set ListViewController as the delegate. Pass in the appropriate indexPath and a pointer to the instance of PhotoRecord, and then add it to the download queue. You also add it to downloadsInProgress to help keep track of things.
    if (![self.pendingOperations.filtrationsInProgress.allKeys containsObject:indexPath]) {
        
        // 4: If not, start one by using the designated initializer.
        // Start filtration
        ImageFiltration *imageFiltration = [[ImageFiltration alloc] initWithPhotoRecord:record atIndexPath:indexPath delegate:self];
        
        // 5: This one is a little tricky. You first must check to see if this particular indexPath has a pending download; if so, you make this filtering operation dependent on that. Otherwise, you donít need dependency.
        ImageDownloader *dependency = [self.pendingOperations.downloadsInProgress objectForKey:indexPath];
        if (dependency)
            [imageFiltration addDependency:dependency];
        
        [self.pendingOperations.filtrationsInProgress setObject:imageFiltration forKey:indexPath];
        [self.pendingOperations.filtrationQueue addOperation:imageFiltration];
    }
}


#pragma mark -
#pragma mark - ImageDownloader delegate


- (void)imageDownloaderDidFinish:(ImageDownloader *)downloader {
    
    // 1: Check for the indexPath of the operation, whether it is a download, or filtration.
    NSIndexPath *indexPath = downloader.indexPathInTableView;
    
    // 2: Get hold of the PhotoRecord instance.
    PhotoRecord *theRecord = downloader.photoRecord;
    
    // 3: Replace the updated PhotoRecord in the main data source (Photos array).
    [self.photos replaceObjectAtIndex:indexPath.row withObject:theRecord];
    
    // 4: Update UI.
    [self.movieListTableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    // 5: Remove the operation from downloadsInProgress (or filtrationsInProgress).
    [self.pendingOperations.downloadsInProgress removeObjectForKey:indexPath];
}


#pragma mark -
#pragma mark - ImageFiltration delegate


- (void)imageFiltrationDidFinish:(ImageFiltration *)filtration {
    NSIndexPath *indexPath = filtration.indexPathInTableView;
    PhotoRecord *theRecord = filtration.photoRecord;
    
    [self.photos replaceObjectAtIndex:indexPath.row withObject:theRecord];
    [self.movieListTableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self.pendingOperations.filtrationsInProgress removeObjectForKey:indexPath];
}


#pragma mark -
#pragma mark - UIScrollView delegate


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    // 1: As soon as the user starts scrolling, you will want to suspend all operations and take a look at what the user wants to see.
    [self suspendAllOperations];
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    // 2: If the value of decelerate is NO, that means the user stopped dragging the table view. Therefore you want to resume suspended operations, cancel operations for offscreen cells, and start operations for onscreen cells.
    if (!decelerate) {
        [self loadImagesForOnscreenCells];
        [self resumeAllOperations];
    }
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 3: This delegate method tells you that table view stopped scrolling, so you will do the same as in #2.
    [self loadImagesForOnscreenCells];
    [self resumeAllOperations];
}



#pragma mark -
#pragma mark - Cancelling, suspending, resuming queues / operations


- (void)suspendAllOperations {
    [self.pendingOperations.downloadQueue setSuspended:YES];
    [self.pendingOperations.filtrationQueue setSuspended:YES];
}


- (void)resumeAllOperations {
    [self.pendingOperations.downloadQueue setSuspended:NO];
    [self.pendingOperations.filtrationQueue setSuspended:NO];
}


- (void)cancelAllOperations {
    [self.pendingOperations.downloadQueue cancelAllOperations];
    [self.pendingOperations.filtrationQueue cancelAllOperations];
}


- (void)loadImagesForOnscreenCells {
    
    // 1: Get a set of visible rows.
    NSSet *visibleRows = [NSSet setWithArray:[self.movieListTableView indexPathsForVisibleRows]];
    
    // 2: Get a set of all pending operations (download and filtration).
    NSMutableSet *pendingOperations = [NSMutableSet setWithArray:[self.pendingOperations.downloadsInProgress allKeys]];
    [pendingOperations addObjectsFromArray:[self.pendingOperations.filtrationsInProgress allKeys]];
    
    NSMutableSet *toBeCancelled = [pendingOperations mutableCopy];
    NSMutableSet *toBeStarted = [visibleRows mutableCopy];
    
    // 3: Rows (or indexPaths) that need an operation = visible rows ñ pendings.
    [toBeStarted minusSet:pendingOperations];
    
    // 4: Rows (or indexPaths) that their operations should be cancelled = pendings ñ visible rows.
    [toBeCancelled minusSet:visibleRows];
    
    // 5: Loop through those to be cancelled, cancel them, and remove their reference from PendingOperations.
    for (NSIndexPath *anIndexPath in toBeCancelled) {
        
        ImageDownloader *pendingDownload = [self.pendingOperations.downloadsInProgress objectForKey:anIndexPath];
        [pendingDownload cancel];
        [self.pendingOperations.downloadsInProgress removeObjectForKey:anIndexPath];
        
        ImageFiltration *pendingFiltration = [self.pendingOperations.filtrationsInProgress objectForKey:anIndexPath];
        [pendingFiltration cancel];
        [self.pendingOperations.filtrationsInProgress removeObjectForKey:anIndexPath];
    }
    toBeCancelled = nil;
    
    // 6: Loop through those to be started, and call startOperationsForPhotoRecord:atIndexPath: for each.
    for (NSIndexPath *anIndexPath in toBeStarted) {
        
        PhotoRecord *recordToProcess = [self.photos objectAtIndex:anIndexPath.row];
        [self startOperationsForPhotoRecord:recordToProcess atIndexPath:anIndexPath];
    }
    toBeStarted = nil;
    
}

#pragma mark -- <UIPickerViewDelegate>

/***************************************************************************************
 Method Name	: numberOfComponentsInPickerView:
 Purpose		: number Of components in picker view
 Parameters 	: (UIPickerView *)pickerView
 
 Return Value	: NSInteger
 
 Created date   : 06/08/12
 ***************************************************************************************/
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    NSLog(@"The method is %s", __func__);
    return 1;
}

/***************************************************************************************
 Method Name	: numberOfComponentsInPickerView:
 Purpose		: number Of components in picker view
 Parameters 	: (UIPickerView *)pickerView
 
 Return Value	: NSInteger
 
 Created date   : 06/08/12
 ***************************************************************************************/
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSLog(@"The method is %s", __func__);
    
    return 2;
}

/***************************************************************************************
 Method Name	: pickerView:titleForRow:forComponent:
 Purpose		: picker view title for row for component
 Parameters 	: (UIPickerView *)pickerView, (NSInteger)row, (NSInteger)component
 
 Return Value	: NSString
 
 Created date   : 06/08/12
 ***************************************************************************************/
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSLog(@"The method is %s", __func__);
    
    if(row == 0)
        return @"Bangalore";
    return @"Mysore";
}

/***************************************************************************************
 Method Name	: pickerView:widthForComponent:
 Purpose		: picker view width for component
 Parameters 	: (UIPickerView *)pickerView, (NSInteger)component
 
 Return Value	: CGFloat
 
 Created date   : 06/08/12
 ***************************************************************************************/
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    NSLog(@"The method is %s", __func__);
    return mFrameHeight;
}

/***************************************************************************************
 Method Name	: pickerView:didSelectRow:inComponent:
 Purpose		: picker view did select row in component:
 Parameters 	: (UIPickerView *)thePickerView, (NSInteger)row, (NSInteger)component
 
 Return Value	: void
 
 Created date   : 07/06/12
 ***************************************************************************************/
- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"The method is %s", __func__);
}

- (void)selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated;  // scrolls the specified row to center.
{
    NSLog(@"The method is %s", __func__);

}

#pragma mark dismissActionSheet

/***************************************************************************************
 Method Name	:dismissActionSheet:
 Purpose		:To dismiss actionSheet
 Parameters 	:
 
 Return Value	: void
 
 Created date   : 06/08/12
 ***************************************************************************************/

-(IBAction)dismissActionSheet:(id)sender
{
    [actionSheet dismissWithClickedButtonIndex:0 animated:YES];
}




@end
