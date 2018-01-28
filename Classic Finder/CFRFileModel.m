//
//  CFRFileModel.m
//  Classic Finder
//
//  Created by Ben Szymanski on 1/11/18.
//  Copyright © 2018 Protype Software Ltd. All rights reserved.
//

#import "CFRFileModel.h"

@implementation CFRFileModel

@synthesize title;
@synthesize creationDate;
@synthesize lastModified;
@synthesize objectPath;

@synthesize iconPosition;
@synthesize windowDimensions;
@synthesize windowPosition;

- (NSString *)uniqueID
{
    return @"";
}

- (NSString *)objectType
{
    return @"file";
}

@end
