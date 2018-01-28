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

@end
