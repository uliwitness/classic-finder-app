//
//  CFRDirectoryModel.m
//  Classic Finder
//
//  Created by Ben Szymanski on 1/11/18.
//  Copyright © 2018 Protype Software Ltd. All rights reserved.
//

#import "CFRDirectoryModel.h"
#import "NSString+Hashes.h"

@implementation CFRDirectoryModel

@synthesize title;
@synthesize creationDate;
@synthesize lastModified;
@synthesize objectPath;

@synthesize iconPosition;
@synthesize windowDimensions;
@synthesize windowPosition;

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        [self setTitle:@""];
        [self setCreationDate:[NSDate date]];
        [self setLastModified:[NSDate date]];
        [self setObjectPath:[NSURL URLWithString:@"file:///"]];
        [self setIconPosition:NSMakePoint(-1.0, -1.0)];
        [self setWindowDimensions:NSMakeSize(500.0, 300.0)];
        [self setWindowPosition:NSMakePoint(-1.0, -1.0)];
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
    return @"directory";
}

#pragma mark - NSCODING METHODS

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (self) {
        [self setIconPosition:[aDecoder decodePointForKey:@"iconPosition"]];
        [self setWindowDimensions:[aDecoder decodeSizeForKey:@"windowDimensions"]];
        [self setWindowPosition:[aDecoder decodePointForKey:@"windowPosition"]];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.uniqueID forKey:@"uniqueID"];
    [aCoder encodePoint:self.iconPosition forKey:@"iconPosition"];
    [aCoder encodeSize:self.windowDimensions forKey:@"windowDimensions"];
    [aCoder encodePoint:self.windowPosition forKey:@"windowPosition"];
}

@end
