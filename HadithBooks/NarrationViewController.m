// WARNING
// This file has been generated automatically by Xamarin Studio to
// mirror C# types. Changes in this file made by drag-connecting
// from the UI designer will be synchronized back to C#, but
// more complex manual changes may not transfer correctly.


#import "NarrationViewController.h"

@implementation NarrationViewController

//@synthesize bg_image,bntLanguageMode, detailView,BookName, Title, lblTitleArabic, TotalCount, NextBtn, PreviousBtn, txtNarrationDetails;

@synthesize currentNarration, EnglishTitle, ArabicTitle, lblTitle, detailView, lblTotalCount;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil :(Narration *)narration :(NSString *)englishTitle :(NSString *)arabicTitle;
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        self.currentNarration = narration;
        self.EnglishTitle = englishTitle;
        self.ArabicTitle = arabicTitle;
        //    NarrationCount = HadithDataContext.GetNarrationCount (sourceId, bookId);
//    NarrationList = HadithDataContext.GetNarrationByBookId (sourceId, bookId, CurrentNarrationIndex);

    }
    return self;

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect window = [[UIScreen mainScreen]bounds];
    if (window.size.height == 480) {
        detailView.frame = CGRectMake(detailView.frame.origin.x, detailView.frame.origin.y, detailView.frame.size.width, 360);
    }

    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    
    [detailView addGestureRecognizer:pinchRecognizer];
    
    NSError *error = nil;
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"  +" options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSString *narrationDetails = @"";

    if(![HadithHelper isArabic])
    {
        narrationDetails = currentNarration.EnglishDetails;
        lblTitle.text = self.EnglishTitle;
        detailView.textAlignment = NSTextAlignmentLeft;
    }
    else
    {
        narrationDetails  = currentNarration.ArabicDetails;
        lblTitle.text = self.ArabicTitle;
        detailView.textAlignment = NSTextAlignmentRight;

    }
    narrationDetails = [regex stringByReplacingMatchesInString:narrationDetails options:0 range:NSMakeRange(0, [narrationDetails length]) withTemplate:@" "];
    narrationDetails = [[[narrationDetails stringByReplacingOccurrencesOfString:@"\n"   withString:@""]
                                            stringByReplacingOccurrencesOfString:@"\r" withString:@""]
                        stringByReplacingOccurrencesOfString:@"()" withString:@"(ﷺ)"];
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString: narrationDetails];
    UIFont *font = [UIFont fontWithName:@"Helvetica Neue" size:[HadithHelper getFontSize]];
    [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];
    [title addAttribute:NSBaselineOffsetAttributeName value:[NSNumber numberWithFloat:5] range:NSMakeRange(0, title.length)];
    //add color
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, title.length)];
    lblTotalCount.text = [NSString stringWithFormat:@"%d/%d", self.NarrationId + 1, self.TotalNarrations];
    detailView.attributedText = title;
    detailView.textAlignment = [HadithHelper isArabic] ? NSTextAlignmentRight : NSTextAlignmentLeft;


}

-(void)handlePinch:(UIPinchGestureRecognizer*)sender {
    

     if([(UIPinchGestureRecognizer*)sender state] == UIGestureRecognizerStateChanged) {
            
        // set your new font value on the text view
         float fontsize = 20.0f * sender.scale;

         NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString: detailView.text];
         UIFont *font = [UIFont fontWithName:@"Helvetica Neue" size:fontsize];
         [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];
         //add color
         [title addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, title.length)];
         [title addAttribute:NSBaselineOffsetAttributeName value:[NSNumber numberWithFloat:5] range:NSMakeRange(0, title.length)];
         detailView.attributedText = title;
         detailView.textAlignment = [HadithHelper isArabic] ? NSTextAlignmentRight : NSTextAlignmentLeft;
         [HadithHelper UpdateFontSize:fontsize];
         
    }
    
}
@end
