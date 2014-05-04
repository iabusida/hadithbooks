//
//  HadithHelper.m
//  HadithBooks
//
//  Created by Islam Abusida on 5/4/14.
//
//

#import "HadithHelper.h"

@implementation HadithHelper

+(NSString *) LoadNibName :(NSString *)xibName
{

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        xibName = [xibName stringByAppendingString:@"_iPad"];
    }
    return xibName;
}

+(void) UpdateLanguage
{
    NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
    int language = (int) [pref integerForKey:@"language"];
    
    if(language == 0)
    {
        [pref setValue:[NSNumber numberWithInt:1] forKey:@"language"];
        [pref synchronize];
        
    }
    else
    {
        [pref setValue:[NSNumber numberWithInt:0] forKey:@"language"];
        [pref synchronize];
    }

}
+(BOOL) isArabic
{
    NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
    int language = (int) [pref integerForKey:@"language"];
    return language == 1;
}

+(void) UpdateFontSize :(float)fontsize
{
    NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
    [pref setValue:[NSNumber numberWithFloat:fontsize] forKey:@"fontsize"];
    [pref synchronize];
}

+(float) getFontSize;
{
    NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
    return [pref floatForKey:@"fontsize"];
}

@end
