//
//  BookmarkItem.h
//  HadithBooks
//
//  Created by Islam Abusida on 5/10/14.
//
//

#import <Foundation/Foundation.h>

@interface BookmarkItem : NSObject

@property(nonatomic, assign) NSInteger SourceId;
@property(nonatomic, assign) NSInteger BookId;
@property(nonatomic, assign) NSInteger NarrationId;
@property(nonatomic, strong) NSString *ArabicTitle;
@property(nonatomic, strong) NSString *EnglishTitle;

@end
