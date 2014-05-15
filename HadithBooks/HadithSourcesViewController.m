// WARNING
// This file has been generated automatically by Xamarin Studio to
// mirror C# types. Changes in this file made by drag-connecting
// from the UI designer will be synchronized back to C#, but
// more complex manual changes may not transfer correctly.


#import "HadithSourcesViewController.h"
#import "HadithContext.h"
#import "HadithBookCell.h"
#import "BookmarksViewController.h"
#import "BooksViewController.h"

@implementation HadithSourcesViewController

@synthesize bg_image, btnContactUs, headerView, sourceTable, hadithsourcelist;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    HadithContext *context = [[HadithContext alloc] init ];
    
    CGRect window = [[UIScreen mainScreen]bounds];
    if (window.size.height == 568) {
        //        bg_image.frame = CGRectMake(0, 0, 320, 568);
//        sourceTable.frame = CGRectMake(0,70,320,298);
        //        btnContactUs.frame = CGRectMake(106, 490, 108, 20);
    }
    hadithsourcelist = [context GetHadithSources];
    NSLog(@"Total hadiths %d", [hadithsourcelist count]);
    [sourceTable reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    // _data is a class member variable that contains one array per section.
    return 1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return [hadithsourcelist count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellID = [HadithHelper LoadNibName:@"HadithBookCell"];
    HadithBookCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    
    HadithSource  *hadithSource = [hadithsourcelist objectAtIndex:indexPath.row];
    
    cell = (HadithBookCell*)[HadithBookCell cellFromNibNamed:cellID ofClass:[HadithBookCell class]];
    cell.backgroundColor = [UIColor clearColor];
    cell.lblEnglish.text = hadithSource.EnglishTitle;
    cell.lblArabic.text = hadithSource.ArabicTitle;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    HadithSource  *hadithSource = [hadithsourcelist objectAtIndex:indexPath.row];
    BooksViewController *booksView = [[BooksViewController alloc] initWithNibName:[HadithHelper LoadNibName:@"BooksViewController"] bundle:nil :hadithSource.EnglishTitle :hadithSource.ArabicTitle :hadithSource.SourceId];
    [self.navigationController pushViewController:booksView animated:YES];
//    [self presentViewController:booksView animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ContactUs:(id)sender {
    
    MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
    NSArray *email = [[NSArray alloc] initWithObjects:@"izzy.az@gmail.com", nil];
    [mailController setSubject:@"Hadith Books"];
    [mailController setToRecipients:email];
    //  [self presentModalViewController:mailController animated:YES];
}

@end
