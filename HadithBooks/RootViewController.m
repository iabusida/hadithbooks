//
//  RootViewController.m
//  HadithBooks
//
//  Created by Islam Abusida on 5/6/14.
//
//

#import "RootViewController.h"
#import "BookmarksViewController.h"
#import "HadithSourcesViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

@synthesize tabcontroller;
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
    
    self.tabcontroller  =[[UITabBarController alloc]init];
    CGRect window = [[UIScreen mainScreen]bounds];
    
    NSLog(@"%f, %f", window.size.width, window.size.height);
        NSLog(@"%f, %f", tabcontroller.view.frame.origin.x  , tabcontroller.view.frame.origin.y);
    HadithSourcesViewController *hsvc=[[HadithSourcesViewController alloc]initWithNibName:[HadithHelper LoadNibName:@"HadithSourcesViewController"] bundle:nil];
    hsvc.title=@"Hadith Books";
    hsvc.tabBarItem.image=[UIImage imageNamed:@"book.png"];
    BookmarksViewController *bmc =[[BookmarksViewController alloc]initWithNibName:[HadithHelper LoadNibName:@"BookmarksViewController"] bundle:nil];
    bmc.title=@"Bookmarks";
    bmc.tabBarItem.image=[UIImage imageNamed:@"bookmark.png"];

    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:hsvc];
    UINavigationController *mbcnavicationController = [[UINavigationController alloc] initWithRootViewController:bmc];
   
    self.tabcontroller.viewControllers=[NSArray arrayWithObjects:navVC, mbcnavicationController, nil];

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        CGRect viewFrame=self.tabcontroller.view.frame;
        viewFrame.origin.y -=20;
        tabcontroller.view.frame = viewFrame;
    }
    if(window.size.height == 480)
    {
        CGRect viewFrame= self.tabcontroller.view.frame;
        viewFrame.size.height += 88;
        tabcontroller.view.frame = viewFrame;
    }
    [self.view addSubview:self.tabcontroller.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
