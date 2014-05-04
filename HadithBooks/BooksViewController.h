// WARNING
// This file has been generated automatically by Xamarin Studio to
// mirror C# types. Changes in this file made by drag-connecting
// from the UI designer will be synchronized back to C#, but
// more complex manual changes may not transfer correctly.


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface BooksViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
	UIImageView *_bg_image;
	UITableView *_booksTable;
	UILabel *_lblBookTitleArabic;
	UILabel *_lblHadithBook;
    NSMutableArray *BookList;
}

@property (nonatomic, retain) IBOutlet UIImageView *bg_image;

@property (nonatomic, retain) IBOutlet UITableView *booksTable;

@property (nonatomic, retain) IBOutlet UILabel *lblBookTitleArabic;

@property (nonatomic, retain) IBOutlet UILabel *lblHadithBook;

@property (nonatomic, strong) NSString *EnglishTitle;
@property (nonatomic, strong) NSString *ArabicTitle;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil :(NSString *)englishTitle :(NSString *)arabicTitle :(int)sourceId;
- (IBAction)GoBack:(id)sender;

@end
