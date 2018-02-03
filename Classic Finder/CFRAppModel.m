//
//  CFRAppModel.m
//  Classic Finder
//
//  Created by Ben Szymanski on 1/11/18.
//  Copyright © 2018 Protype Software Ltd. All rights reserved.
//

#import "CFRAppModel.h"
#import "NSString+Hashes.h"

@implementation CFRAppModel

@synthesize title;
@synthesize creationDate;
@synthesize lastModified;
@synthesize objectPath;

@synthesize iconPosition;

@synthesize executablePath;

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        [self setTitle:@""];
        [self setCreationDate:[NSDate date]];
        [self setLastModified:[NSDate date]];
        [self setObjectPath:[NSURL URLWithString:@"file:///"]];
        [self setIconPosition:NSMakePoint(-1.0, -1.0)];
        [self setExecutablePath:[NSURL URLWithString:@"file:///"]];
    }
    
    return self;
}

- (NSString *)uniqueID
{
    NSString *unhashedID = [NSString stringWithFormat:@"%f%@", creationDate.timeIntervalSinceReferenceDate, title];
    NSString *hashedID = [unhashedID sha1];
    
    return hashedID;
}

- (NSString *)objectType
{
    return @"app";
}

#pragma mark - NSCODING METHODS

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (self) {
        [self setIconPosition:[aDecoder decodePointForKey:@"iconPosition"]];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.uniqueID forKey:@"uniqueID"];
    [aCoder encodePoint:self.iconPosition forKey:@"iconPosition"];
}

@end
