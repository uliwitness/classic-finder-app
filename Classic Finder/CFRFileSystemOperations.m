//
//  CFRFileSystemOperations.m
//  Classic Finder
//
//  Created by Ben Szymanski on 10/5/17.
//  Copyright © 2017 Protype Software Ltd. All rights reserved.
//

#import "CFRFileSystemOperations.h"

@implementation CFRFileSystemOperations

+ (NSArray *)getListingForDirectory:(NSURL *)directory
{
    NSArray *fileList;
    NSArray *keys = @[NSURLNameKey, NSURLPathKey];
    NSError *err = nil;
    
    fileList = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:directory
                                             includingPropertiesForKeys:keys
                                                                options:(NSDirectoryEnumerationSkipsPackageDescendants |
                                                                         NSDirectoryEnumerationSkipsHiddenFiles |
                                                                         NSDirectoryEnumerationSkipsSubdirectoryDescendants)
                                                                  error:&err];
    
    if (err != nil) {
        NSLog(@"%@", err);
    }
    
    return fileList;
}

+ (void)openFileAtURL:(NSURL *)fileURL
{
    NSTask *openTask = [[NSTask alloc] init];
    NSArray *args = @[fileURL.absoluteString];
    
    [openTask setLaunchPath:@"/usr/bin/open"];
    [openTask setArguments:args];
    
    [openTask launch];
}

@end
