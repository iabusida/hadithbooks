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

    HadithSourcesViewController *hsvc=[[HadithSourcesViewController alloc]initWithNibName:[HadithHelper LoadNibName:@"HadithSourcesViewController"] bundle:nil];
    hsvc.title=@"Hadith Books";
//    hsvc.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:0];
    hsvc.tabBarItem.image=[UIImage imageNamed:@"book.png"];
    BookmarksViewController *bmc =[[BookmarksViewController alloc]initWithNibName:[HadithHelper LoadNibName:@"BookmarksViewController"] bundle:nil];
    bmc.title=@"Bookmarks";
    bmc.tabBarItem.image=[UIImage imageNamed:@"bookmark"];

    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:hsvc];
    UINavigationController *mbcnavicationController = [[UINavigationController alloc] initWithRootViewController:bmc];
   
    self.tabcontroller.viewControllers=[NSArray arrayWithObjects:navVC, mbcnavicationController, nil];

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
//        tabcontroller.view.frame = CGRectMake(0, 0, 1024, 968);
    }
    [self.view addSubview:self.tabcontroller.view];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
