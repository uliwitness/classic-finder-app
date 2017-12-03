//
//  CFRFileSystemOperations.h
//  Classic Finder
//
//  Created by Ben Szymanski on 10/5/17.
//  Copyright © 2017 Ben Szymanski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFRFileSystemOperations : NSObject

+ (NSArray *)getListingForDirectory:(NSURL *)directory;
+ (void)openFileAtURL:(NSURL *)fileURL;
+ (void)createNewFolderInDirectory:(NSURL *)directory
                             named:(NSString *)folderName;
+ (void)printFile:(NSURL *)file;
+ (void)duplicateFile:(NSURL *)file;
+ (void)createSymLinkOfFile:(NSURL *)file;
+ (void)searchForFilesNamedLike:(NSString *)searchText;
+ (void)emptyTrash;
+ (void)ejectDisk;

@end
