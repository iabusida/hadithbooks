// WARNING
// This file has been generated automatically by Xamarin Studio to
// mirror C# types. Changes in this file made by drag-connecting
// from the UI designer will be synchronized back to C#, but
// more complex manual changes may not transfer correctly.


#import "PageTurnViewController.h"
#import "NarrationViewController.h"
@implementation PageTurnViewController

@synthesize btnLanguageId, lblTItle, currentIndex, btnBookmark;

bool isinit = false;

- (IBAction)GoBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnLanguage:(id)sender {
    
    NarrationViewController *narrationViewController = [self viewControllerAtIndex:currentIndex];
   
    [HadithHelper UpdateLanguage];
    [btnLanguageId setTitle:[HadithHelper isArabic] ? @"Show in English" : @"تظهر باللغة العربية" forState:UIControlStateNormal];

    NSArray *viewControllers = [NSArray arrayWithObject:narrationViewController];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
}

- (IBAction)btnAddToFavorites:(id)sender {
    BookmarkItem *bookmarkItem = [[BookmarkItem alloc] init];

    bookmarkItem.SourceId = currentBook.SourceId;
    bookmarkItem.BookId = currentBook.BookId;
    bookmarkItem.NarrationId = currentIndex - 1;
    bookmarkItem.ArabicTitle = currentBook.ArabicTitle;
    bookmarkItem.EnglishTitle = currentBook.EnglishTitle;

    [HadithHelper AddBookmark:bookmarkItem];
    [self checkifBookmarked: currentIndex];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil :(Book *)book
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        currentBook = book;
        currentBook.Narrations = [[[HadithContext alloc] init] GetNarrationByBookId:book.SourceId :book.BookId];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil :(Book *)book :(NSUInteger)narrationIndex
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        currentBook = book;
        currentBook.Narrations = [[[HadithContext alloc] init] GetNarrationByBookId:book.SourceId :book.BookId];
        currentIndex = narrationIndex;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect window = [[UIScreen mainScreen]bounds];
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
  
    if(window.size.height == 568)
    {
    [[self.pageController view] setFrame:CGRectMake(window.origin.x, 39, window.size.width, window.size.height)];
    }
    else if(window.size.height == 480)
    {
    [[self.pageController view] setFrame:CGRectMake(window.origin.x, 50, window.size.width, window.size.height)];
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
    [[self.pageController view] setFrame:CGRectMake(window.origin.x, 109, window.size.width, window.size.height)];
    }
    
    NarrationViewController *narrationViewController = [self viewControllerAtIndex:currentIndex];
    
    NSArray *viewControllers = [NSArray arrayWithObject:narrationViewController];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (NarrationViewController *)viewControllerAtIndex:(NSUInteger)index {
    @try {
        NarrationViewController *narrationViewController = [[NarrationViewController  alloc] initWithNibName:[HadithHelper LoadNibName:@"NarrationViewController"] bundle:nil :[currentBook.Narrations objectAtIndex:index] :currentBook.EnglishTitle :currentBook.ArabicTitle];
        narrationViewController.NarrationId = index;
        narrationViewController.TotalNarrations = [currentBook.Narrations count];
        currentIndex = index;
        [self checkifBookmarked: index];
        return narrationViewController;
    }
    @catch (NSException *exception) {
        return nil;
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(NarrationViewController *)viewController NarrationId];
    //
    if (index == 0 && isinit && currentIndex == 0) {
        
        Book *newbook  = [[[HadithContext alloc] init] GetBookById:currentBook.SourceId :currentBook.BookId -1];
        if(newbook == nil)
        {
            [self checkifBookmarked: index];
            return nil;
        }
        else
        {
            currentBook = newbook;
        }
        currentBook.Narrations = [[[HadithContext alloc] init] GetNarrationByBookId:currentBook.SourceId :currentBook.BookId];
        
        index = [currentBook.Narrations count] - 1;
 
    }
    else
    {
        index--;
    }
    [self checkifBookmarked: index];
    isinit = true;
    return [self viewControllerAtIndex:index];
    
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(NarrationViewController *)viewController NarrationId];
    
    index++;
    
    if (index == [currentBook.Narrations count]) {
        Book *newbook  = [[[HadithContext alloc] init] GetBookById:currentBook.SourceId :currentBook.BookId + 1];
        if(newbook == nil)
        {
           [self checkifBookmarked: index];
            return nil;
        }
        else{
            currentBook = newbook;
        }
        currentBook.Narrations = [[[HadithContext alloc] init] GetNarrationByBookId:currentBook.SourceId :currentBook.BookId];
        index = 0;
    }

    return [self viewControllerAtIndex:index ];
}

-(void)checkifBookmarked:(NSUInteger)index
{
    if([HadithHelper bookMarkExists:currentBook.SourceId :currentBook.BookId :index])
    {
        [btnBookmark setTitle:@"Bookmarked" forState:UIControlStateNormal];
        btnBookmark.enabled = NO;
    }
    else
    {
        [btnBookmark setTitle:@"Bookmark" forState:UIControlStateNormal];
        btnBookmark.enabled = YES;
    }
}
@end
