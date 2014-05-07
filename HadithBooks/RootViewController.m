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
    
    // FirstViewController
    BookmarksViewController *bmc =[[BookmarksViewController alloc]initWithNibName:[HadithHelper LoadNibName:@"BookmarksViewController"] bundle:nil];
    bmc.title=@"Bookmarks";
    bmc.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:1];
    bmc.tabBarItem.image=[UIImage imageNamed:@"i.png"];
    
    //SecondViewController
    HadithSourcesViewController *hsvc=[[HadithSourcesViewController alloc]initWithNibName:[HadithHelper LoadNibName:@"HadithSourcesViewController"] bundle:nil];
    hsvc.title=@"Hadith Books";
    hsvc.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:0];
    hsvc.tabBarItem.image=[UIImage imageNamed:@"im.png"];
    //
    //    //ThirdViewController
    //    Third *tvc=[[Third alloc]initWithNibName:nil bundle:nil];
    //    tvc.title=@"Third";
    //    tvc.tabBarItem.image=[UIImage imageNamed:@"img.png"];
    //
    self.tabcontroller.viewControllers=[NSArray arrayWithObjects:hsvc, bmc, nil];
    
    [self.view addSubview:self.tabcontroller.view];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
