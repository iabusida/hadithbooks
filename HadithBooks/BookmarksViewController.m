// WARNING
// This file has been generated automatically by Xamarin Studio to
// mirror C# types. Changes in this file made by drag-connecting
// from the UI designer will be synchronized back to C#, but
// more complex manual changes may not transfer correctly.


#import "BookmarksViewController.h"
#import "BookmarkCell.h"
#import "PageTurnViewController.h"

@implementation BookmarksViewController

@synthesize sourceTable, bookmarkItems;




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    bookmarkItems = [HadithHelper fetchBookMarks];
    [sourceTable reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    CGRect window = [[UIScreen mainScreen]bounds];
    if (window.size.height == 568) {
      
    }
//    bookmarkItems = [HadithHelper fetchBookMarks];
//    [sourceTable reloadData];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    // _data is a class member variable that contains one array per section.
    return 1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [bookmarkItems count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellID = [HadithHelper LoadNibName:@"BookmarkCell"];
    BookmarkCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    
    BookmarkItem  *bookmarkItem = [bookmarkItems objectAtIndex:indexPath.row];
    cell = (BookmarkCell*)[BookmarkCell cellFromNibNamed:cellID ofClass:[BookmarkCell class]];
    cell.backgroundColor = [UIColor clearColor];
    cell.lblTitle.text = [HadithHelper isArabic] ? bookmarkItem.ArabicTitle : bookmarkItem.EnglishTitle;
    cell.lblNarrationNumber.text = [NSString stringWithFormat:@"Narration #:%d", bookmarkItem.NarrationId + 1];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BookmarkItem *bookmark = [bookmarkItems objectAtIndex:indexPath.row];

    Book *book =  [[[HadithContext alloc] init] GetBookById:bookmark.SourceId :bookmark.BookId];
 
    PageTurnViewController *narrationView = [[PageTurnViewController alloc] initWithNibName:[HadithHelper LoadNibName:@"PageTurnViewController"] bundle:nil :book :bookmark.NarrationId];
    narrationView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.navigationController pushViewController:narrationView animated:YES];
}



- (void)tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    // If row is deleted, remove it from the list.
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [HadithHelper DeleteBookMark:indexPath.row];
        bookmarkItems = [HadithHelper fetchBookMarks];
        [sourceTable reloadData];
    }
}


@end
