//
//  BookmarkItem.m
//  HadithBooks
//
//  Created by Islam Abusida on 5/10/14.
//
//

#import "BookmarkItem.h"

@implementation BookmarkItem

@synthesize SourceId, BookId, NarrationId, ArabicTitle, EnglishTitle;

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeInt:self.SourceId forKey:@"SourceId"];
    [encoder encodeInt:BookId forKey:@"BookId"];
    [encoder encodeInt:NarrationId forKey:@"NarrationId"];
    [encoder encodeObject:ArabicTitle forKey:@"ArabicTitle"];
    [encoder encodeObject:EnglishTitle forKey:@"EnglishTitle"];
}

- (id) initWithCoder:(NSCoder *)decoder
{
    if(self = [super init]){
        self.SourceId = [decoder decodeIntForKey:@"SourceId"];
        self.BookId = [decoder decodeIntForKey:@"BookId"];
        self.NarrationId = [decoder decodeIntForKey:@"NarrationId"];
        self.ArabicTitle = [decoder decodeObjectForKey:@"ArabicTitle"];
        self.EnglishTitle = [decoder decodeObjectForKey:@"EnglishTitle"];
    }
    return self;
}

@end
