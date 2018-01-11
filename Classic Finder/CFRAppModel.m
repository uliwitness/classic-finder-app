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
@synthesize windowDimensions;
@synthesize lastModified;
@synthesize windowPosition;
@synthesize iconPosition;
@synthesize objectPath;

- (NSString *)uniqueID
{
    return @"";
}

@end
