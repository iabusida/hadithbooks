// WARNING
// This file has been generated automatically by Xamarin Studio to
// mirror C# types. Changes in this file made by drag-connecting
// from the UI designer will be synchronized back to C#, but
// more complex manual changes may not transfer correctly.


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Narration.h"

@interface NarrationViewController : UIViewController {
	
}

@property (nonatomic, retain) IBOutlet UIImageView *bg_image;

@property (nonatomic, retain) IBOutlet UIButton *bntLanguageMode;

@property (nonatomic, retain) IBOutlet UITextView *detailView;

@property (nonatomic, retain) IBOutlet UILabel *lblBookName;

@property (nonatomic, retain) IBOutlet UILabel *lblTitle;

@property (nonatomic, retain) IBOutlet UILabel *lblTitleArabic;

@property (nonatomic, retain) IBOutlet UILabel *lblTotalCount;

@property (nonatomic, retain) IBOutlet UIButton *NextBtn;

@property (nonatomic, retain) IBOutlet UIButton *PreviousBtn;

@property (nonatomic, retain) IBOutlet UITextView *txtNarrationDetails;

@property(nonatomic, retain) Narration *currentNarration;

@property (assign, nonatomic) NSUInteger NarrationId;
@property (assign, nonatomic) NSUInteger TotalNarrations;
@property (nonatomic, retain) NSString *EnglishTitle;
@property (nonatomic, retain) NSString *ArabicTitle;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil :(Narration *)narration :(NSString *)englishTitle :(NSString *)arabicTitle;
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil :(int)narrationId;
- (IBAction)GoBack:(id)sender;

- (IBAction)NextNarration:(id)sender;

- (IBAction)PreviousNarration:(id)sender;

- (IBAction)btnLanguage:(id)sender;

@end
