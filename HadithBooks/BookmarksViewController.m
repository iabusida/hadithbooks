// WARNING
// This file has been generated automatically by Xamarin Studio to
// mirror C# types. Changes in this file made by drag-connecting
// from the UI designer will be synchronized back to C#, but
// more complex manual changes may not transfer correctly.


#import "BookmarksViewController.h"
#import "HadithBookCell.h"
@implementation BookmarksViewController

@synthesize sourceTable, bookmarkItems;




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        bookmarkItems = [HadithHelper fetchBookMarks];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect window = [[UIScreen mainScreen]bounds];
    if (window.size.height == 568) {
      
    }
    sourceTable.delegate = self;
    [sourceTable reloadData];
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
    
    NSString *cellID = [HadithHelper LoadNibName:@"HadithBookCell"];
    HadithBookCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    
    BookmarkItem  *bookmarkItem = [bookmarkItems objectAtIndex:indexPath.row];
    cell = (HadithBookCell*)[HadithBookCell cellFromNibNamed:cellID ofClass:[HadithBookCell class]];
    cell.backgroundColor = [UIColor clearColor];
    cell.lblEnglish.text = bookmarkItem.EnglishTitle;
    cell.lblArabic.text = bookmarkItem.ArabicTitle;
    
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    BooksViewController *booksView = [[BooksViewController alloc] init]; //new BooksViewController (source.EnglishTitle, source.ArabicTitle, source.SourceId);
    //    [self presentViewController:booksView animated:NO completion:nil];
}
@end
