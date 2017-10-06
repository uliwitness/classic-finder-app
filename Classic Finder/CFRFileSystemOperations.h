//
//  CFRFileSystemOperations.h
//  Classic Finder
//
//  Created by Ben Szymanski on 10/5/17.
//  Copyright © 2017 Protype Software Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFRFileSystemOperations : NSObject

+ (NSArray *)getListingForDirectory:(NSURL *)directory;
+ (void)openFileAtURL:(NSURL *)fileURL;

@end
