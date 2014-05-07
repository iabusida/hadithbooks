// WARNING
// This file has been generated automatically by Xamarin Studio to
// mirror C# types. Changes in this file made by drag-connecting
// from the UI designer will be synchronized back to C#, but
// more complex manual changes may not transfer correctly.


#import "PageTurnViewController.h"
#import "NarrationViewController.h"
@implementation PageTurnViewController

@synthesize btnLanguageId, lblTItle;

int currentIndex = 0;

/*
 Language settings:
 English = 0;
 Arabic = 1;
 
 */
- (IBAction)GoBack:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect window = [[UIScreen mainScreen]bounds];
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    
    [[self.pageController view] setFrame:CGRectMake(window.origin.x, 59, window.size.width, window.size.height)];
    
    NarrationViewController *narrationViewController = [self viewControllerAtIndex:0];
    
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
    
    NarrationViewController *narrationViewController = [[NarrationViewController  alloc] initWithNibName:[HadithHelper LoadNibName:@"NarrationViewController"] bundle:nil :[currentBook.Narrations objectAtIndex:index] :currentBook.EnglishTitle :currentBook.ArabicTitle];
    narrationViewController.NarrationId = index;
    narrationViewController.TotalNarrations = [currentBook.Narrations count];
    currentIndex = index;
    return narrationViewController;
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(NarrationViewController *)viewController NarrationId];
    //
    if (index == 0) {
        Book *newbook  = [[[HadithContext alloc] init] GetBookById:currentBook.SourceId :currentBook.BookId -1];
        if(newbook == nil)
        {
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
    return [self viewControllerAtIndex:index];
    
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(NarrationViewController *)viewController NarrationId];
    
    NSLog(@"Index: %d" , index);
    index++;
    
    if (index == [currentBook.Narrations count]) {
        Book *newbook  = [[[HadithContext alloc] init] GetBookById:currentBook.SourceId :currentBook.BookId + 1];
        if(newbook == nil)
        {
            return nil;
        }
        else{
            currentBook = newbook;
        }
        currentBook.Narrations = [[[HadithContext alloc] init] GetNarrationByBookId:currentBook.SourceId :currentBook.BookId];
        NSLog(@"Current narration count: %d", [currentBook.Narrations count]);
        index = 0;
    }
    
    
    return [self viewControllerAtIndex:index ];
    
}


- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return [currentBook.Narrations count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}

@end
