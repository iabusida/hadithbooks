// WARNING
// This file has been generated automatically by Xamarin Studio to
// mirror C# types. Changes in this file made by drag-connecting
// from the UI designer will be synchronized back to C#, but
// more complex manual changes may not transfer correctly.


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface HadithSourcesViewController : UIViewController<UITableViewDelegate> {
	UIImageView *_bg_image;
	UIButton *_btnContactUs;
	UIView *_headerView;
	UITableView *_sourceTable;

}
@property (nonatomic, retain) NSMutableArray *hadithsourcelist; 
@property (nonatomic, retain) IBOutlet UIImageView *bg_image;

@property (nonatomic, retain) IBOutlet UIButton *btnContactUs;

@property (nonatomic, retain) IBOutlet UIView *headerView;

@property (nonatomic, retain) IBOutlet UITableView *sourceTable;

- (IBAction)ContactUs:(id)sender;

@end
