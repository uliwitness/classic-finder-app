//
//  CFRAppModel.m
//  Classic Finder
//
//  Created by Ben Szymanski on 1/11/18.
//  Copyright © 2018 Protype Software Ltd. All rights reserved.
//

#import "CFRAppModel.h"

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
    return @"";
}

- (NSString *)objectType
{
    return @"app";
}

@end
