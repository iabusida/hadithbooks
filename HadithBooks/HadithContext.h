//
//  HadithContext.h
//  hadith
//
//  Created by Islam Abusida on 11/10/13.
//  Copyright (c) 2013 Islam Abusida. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Narration.h"
#import "Book.h"
#import "HadithSource.h"
@interface HadithContext : NSObject

-(NSMutableArray *)GetNarrationByBookId:(int)sourceId :(int)bookId;
-(NSMutableArray *)GetBooksBySourceId:(int)sourceId;
-(Book *)GetBookById:(int)sourceId :(int)bookId;
-(NSMutableArray *)GetHadithSources;
@end
