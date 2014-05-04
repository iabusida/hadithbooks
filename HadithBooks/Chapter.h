//
//  Chapter.h
//  hadith
//
//  Created by Islam Abusida on 11/10/13.
//  Copyright (c) 2013 Islam Abusida. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Chapter : NSObject


@property(nonatomic, assign) int ChapterId;
@property(nonatomic, retain) NSString *TitleEnglish;
@property(nonatomic, retain) NSString *TitleArabic;
@property(nonatomic, assign) int Number;
@property(nonatomic, assign) int Book_BookId;

@end
