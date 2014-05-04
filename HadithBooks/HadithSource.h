//
//  HadithSource.h
//  hadith
//
//  Created by Islam Abusida on 11/10/13.
//  Copyright (c) 2013 Islam Abusida. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HadithSource : NSObject

@property(nonatomic, assign) int SourceId;
@property(nonatomic, retain) NSString *EnglishTitle;
@property(nonatomic, retain) NSString *ArabicTitle;

@end
