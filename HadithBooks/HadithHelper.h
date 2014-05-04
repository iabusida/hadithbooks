//
//  HadithHelper.h
//  HadithBooks
//
//  Created by Islam Abusida on 5/4/14.
//
//

#import <Foundation/Foundation.h>

@interface HadithHelper : NSObject

+(NSString *) LoadNibName :(NSString *)xibName;

+(float) getFontSize;
+(void) UpdateLanguage;
+(BOOL) isArabic;
+(void) UpdateFontSize :(float)fontsize;
@end