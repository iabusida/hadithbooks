//
//  Book.h
//  hadith
//
//  Created by Islam Abusida on 11/10/13.
//  Copyright (c) 2013 Islam Abusida. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

@property(nonatomic, assign) int BookId;
@property(nonatomic, assign) int SourceId;
@property(nonatomic, retain) NSString *EnglishTitle;
@property(nonatomic, retain) NSString *ArabicTitle;
@property(nonatomic, assign) int BookNumber;
@property(nonatomic, retain) NSMutableArray *Narrations;
@end
