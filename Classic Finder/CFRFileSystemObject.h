//
//  CFRFileSystemObject.h
//  Classic Finder
//
//  Created by Ben Szymanski on 1/11/18.
//  Copyright © 2018 Protype Software Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CFRFileSystemObject <NSObject>

@property NSURL *objectPath;
@property NSDate *creationDate;
@property NSDate *lastModified;
@property NSString *title;
@property NSPoint windowPosition;
@property NSSize windowDimensions;
@property NSPoint iconPosition;

- (NSString *)uniqueID;

@end
