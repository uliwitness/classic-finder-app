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
@synthesize windowPosition;
@synthesize windowDimensions;

@synthesize executablePath;

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

@end
