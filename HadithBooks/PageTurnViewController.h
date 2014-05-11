// WARNING
// This file has been generated automatically by Xamarin Studio to
// mirror C# types. Changes in this file made by drag-connecting
// from the UI designer will be synchronized back to C#, but
// more complex manual changes may not transfer correctly.


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//
//
//public int BookId { get; set; }
//public int SourceId { get; set; }
//public Narration NarrationList = null;
//private int NarrationIndex {
//    get;
//    set;
//}
//
//public Book HadithBook = null;
//
//public int CurrentNarrationIndex { get; set; }
//
//
//private Book Books { get; set; }
@interface PageTurnViewController : UIViewController <UIPageViewControllerDataSource>{
    int BookId;
    int SourceId;
    int narrationIndex;
    int currentIndex;
    Narration *narration;
    Book *currentBook;
}
@property (strong, nonatomic) IBOutlet UILabel *lblNarrationCount;

@property (nonatomic, retain) IBOutlet UIButton *btnLanguageId;
@property (nonatomic, retain) IBOutlet UILabel *lblTItle;
@property (nonatomic, retain) UIScrollView *scrollView;
@property (strong, nonatomic) UIPageViewController *pageController;

- (IBAction)GoBack:(id)sender;

- (IBAction)btnLanguage:(id)sender;

- (IBAction)btnAddToFavorites:(id)sender;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil :(Book *)book;
@end
