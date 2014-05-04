//
//  HadithContext.m
//  hadith
//
//  Created by Islam Abusida on 11/10/13.
//  Copyright (c) 2013 Islam Abusida. All rights reserved.
//

#import "HadithContext.h"

@implementation HadithContext


-(NSString *)dbPath{
    return[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"hadith.db"];
}
-(NSMutableArray *)GetHadithSources{
    
    NSMutableArray *sqliteData = [[NSMutableArray alloc] init];
    sqlite3 *database;
    NSString *sql = @"SELECT * from HadithSources";
    if (sqlite3_open([[self dbPath] UTF8String], &database) == SQLITE_OK) {
        sqlite3_stmt *selectStatement;
        if(sqlite3_prepare_v2(database, [sql cStringUsingEncoding:NSASCIIStringEncoding], -1, &selectStatement, NULL) == SQLITE_OK) {
            while(sqlite3_step(selectStatement) == SQLITE_ROW) {
                HadithSource *source = [[HadithSource alloc]init];
                source.SourceId = [[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 0)]integerValue];
                source.ArabicTitle = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 1)];
                source.EnglishTitle = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 2)];
                [sqliteData addObject:source];
            }
        }
    }
    sqlite3_close(database);
    return  sqliteData;
}
-(Book *)GetBookById:(int)sourceId :(int)bookId{
    
    
    sqlite3 *database;
    Book *newbook = nil;
    NSString *sql = [NSString stringWithFormat:@"SELECT * from books where HadithSourceId = %d and BookId = %d", sourceId, bookId];
    if (sqlite3_open([[self dbPath] UTF8String], &database) == SQLITE_OK) {
        sqlite3_stmt *selectStatement;
        if(sqlite3_prepare_v2(database, [sql cStringUsingEncoding:NSASCIIStringEncoding], -1, &selectStatement, NULL) == SQLITE_OK) {
            while(sqlite3_step(selectStatement) == SQLITE_ROW) {
                newbook = [[Book alloc]init];
                newbook.BookId = [[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 0)]integerValue];
                newbook.EnglishTitle = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 1)];
                newbook.ArabicTitle = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 2)];
                newbook.BookNumber = [[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 3)] integerValue];
                newbook.SourceId = [[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 4)] intValue];
            }
        }
    }
    sqlite3_close(database);
    return  newbook;
}


-(NSMutableArray *)GetBooksBySourceId:(int)sourceId{
    
    sqlite3 *database;
    NSMutableArray *booklist = [[NSMutableArray alloc] init];
    NSString *sql = [NSString stringWithFormat:@"SELECT * from books where HadithSourceId = %d", sourceId];
    if (sqlite3_open([[self dbPath] UTF8String], &database) == SQLITE_OK) {
        sqlite3_stmt *selectStatement;
        if(sqlite3_prepare_v2(database, [sql cStringUsingEncoding:NSASCIIStringEncoding], -1, &selectStatement, NULL) == SQLITE_OK) {
            while(sqlite3_step(selectStatement) == SQLITE_ROW) {
                Book *newbook = [[Book alloc]init];
                newbook.BookId = [[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 0)]integerValue];
                newbook.EnglishTitle = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 1)];
                newbook.ArabicTitle = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 2)];
                newbook.BookNumber = [[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 3)] integerValue];
                newbook.SourceId = [[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 4)] intValue];
                [booklist addObject:newbook];
            }
        }
    }
    sqlite3_close(database);
    return  booklist;
}


-(NSMutableArray *)GetNarrationByBookId:(int)sourceId :(int)bookId{
    
    NSMutableArray *narrationList = [[NSMutableArray alloc] init];
    sqlite3 *database;
    Narration *narration =  nil;
    if (sqlite3_open([[self dbPath] UTF8String], &database) == SQLITE_OK) {
        sqlite3_stmt *selectStatement;
        NSString *sql = [NSString stringWithFormat:@"SELECT * from narrations where bookId = %d and hadithsourceId = %d", bookId, sourceId];
        if(sqlite3_prepare_v2(database, [sql cStringUsingEncoding:NSASCIIStringEncoding], -1, &selectStatement, NULL) == SQLITE_OK) {
            while(sqlite3_step(selectStatement) == SQLITE_ROW) {
                @try {
                    // Try something
                    narration = [[Narration alloc]init];
                    narration.NarrationId = [[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 0)]integerValue];
                    narration.EnglishNarrator = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 1)];
                    narration.EnglishDetails = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 2)];
                    narration.ArabicDetails = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 3)];
                    [narrationList addObject:narration];
                }
                @catch (NSException * e) {
                    
                }
            }
        }
    }
    sqlite3_close(database);
    return  narrationList;
}




@end
