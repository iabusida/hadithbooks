// WARNING
// This file has been generated automatically by Xamarin Studio to
// mirror C# types. Changes in this file made by drag-connecting
// from the UI designer will be synchronized back to C#, but
// more complex manual changes may not transfer correctly.


#import "BooksViewController.h"
#import "HadithBookCell.h"
#import "PageTurnViewController.h"
#import "Narration.h"
@implementation BooksViewController

@synthesize bg_image,EnglishTitle, ArabicTitle;
@synthesize booksTable;
@synthesize lblBookTitleArabic;
@synthesize lblHadithBook;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil :(NSString *)englishTitle :(NSString *)arabicTitle :(int)sourceId
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        BookList = [[[HadithContext alloc] init] GetBooksBySourceId:sourceId];
        self.EnglishTitle = englishTitle;
        self.ArabicTitle = arabicTitle;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect window = [[UIScreen mainScreen]bounds];
//    if (window.size.height == 568) {
//        bg_image.frame = CGRectMake(0, 0, 320, 568);
//    }
    
    booksTable.delegate = self;
    lblBookTitleArabic.text = ArabicTitle;
    lblHadithBook.text = EnglishTitle;
    [booksTable reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    // _data is a class member variable that contains one array per section.
    return 1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [BookList count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellID = [HadithHelper LoadNibName:@"HadithBookCell"];
    HadithBookCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    
    Book  *book = [BookList objectAtIndex:indexPath.row];
    cell = (HadithBookCell*)[HadithBookCell cellFromNibNamed:cellID ofClass:[HadithBookCell class]];
    cell.backgroundColor = [UIColor clearColor];
    cell.lblEnglish.text = book.EnglishTitle;
    cell.lblArabic.text = book.ArabicTitle;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //
    PageTurnViewController *narrationView = [[PageTurnViewController alloc] initWithNibName:[HadithHelper LoadNibName:@"PageTurnViewController"] bundle:nil :[BookList objectAtIndex:indexPath.row]];
    narrationView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.navigationController pushViewController:narrationView animated:YES];
//    [self presentViewController:narrationView animated:YES completion:nil];
    //    //				PageTurnViewController narrationView = new PageTurnViewController (this.hadithBook, indexPath.Row);
    //    narrationView.ModalTransitionStyle = UIModalTransitionStyle.CrossDissolve;
    //    this.parentController.PresentViewController (narrationView, true, null);
    
    
    
    //    BooksViewController *booksView = [[BooksViewController alloc] init]; //new BooksViewController (source.EnglishTitle, source.ArabicTitle, source.SourceId);
    //    [self presentViewController:booksView animated:NO completion:nil];
}


- (IBAction)GoBack:(id)sender {
//    [self dismissViewControllerAnimated:NO completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
