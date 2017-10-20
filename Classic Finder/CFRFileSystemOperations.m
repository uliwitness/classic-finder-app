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

+ (void)createNewFolderInDirectory:(NSURL *)directory
                             named:(NSString *)folderName
{
    
}

+ (void)printFile:(NSURL *)file
{
    
}

+ (void)duplicateFile:(NSURL *)file
{
    // Create file name for new file
    NSString *fileName = [file lastPathComponent];
    NSString *regexPattern = @"(.+)\\.(.+)";
    
    NSError *regexError = nil;
    NSRegularExpression *fileNameRegex = [[NSRegularExpression alloc] initWithPattern:regexPattern
                                                                              options:NSRegularExpressionCaseInsensitive
                                                                                error:&regexError];
    
    if (regexError != nil) {
        NSLog(@"Error while parsing filename. (%@)", regexError.description);
    } else {
        NSArray *fileNameCaptureGroups = [fileNameRegex matchesInString:fileName
                                                                options:0 range:NSMakeRange(0, [fileName length])];
        if ([fileNameCaptureGroups count] >= 2) {
            NSString *duplicateFileName = [NSString stringWithFormat:@"%@ copy", fileName];
            
            // start at the second array index
            for (NSUInteger x = 1; x < [fileNameCaptureGroups count]; x += 1) {
                NSString *fileNameExtra = [fileNameCaptureGroups objectAtIndex: x];
                duplicateFileName = [NSString stringWithFormat:@"%@.%@", duplicateFileName, fileNameExtra];
            }
            
            NSString *pathOfOriginalFile = [file absoluteString];
            NSURL *parentDirectoryOfOriginalFile = [file URLByDeletingLastPathComponent];
            
            NSString *pathOfNewFile = [NSString stringWithFormat:@"%@/%@", parentDirectoryOfOriginalFile.absoluteString, duplicateFileName];
            
            // Create and run copy/duplicate task
            NSTask *duplicateTask = [[NSTask alloc] init];
            NSArray *args = @[pathOfOriginalFile, pathOfNewFile];
            
            [duplicateTask setLaunchPath:@"/bin/cp"];
            [duplicateTask setArguments:args];
            
            @try {
                [duplicateTask launch];
            }
            @catch (NSException *e) {
                NSLog(@"Error while running duplicate operation. (%@ / %@)", e.name, e.reason);
            }
        } else {
            NSLog(@"Error while creating duplicate file name - not parsed correctly or missing extension.");
        }
    }
}

+ (void)duplicateDirectory:(NSURL *)directory
{
    // Create file name for new directory
    NSString *directoryName = [directory lastPathComponent];
    NSString *duplicateDirectoryName = [NSString stringWithFormat:@"%@ copy", directoryName];
    
    NSString *pathOfOriginalDirectory = [directory absoluteString];
    NSURL *parentDirectoryOfOriginalDirectory = [directory URLByDeletingLastPathComponent];
    
    NSString *pathOfNewDirectory = [NSString stringWithFormat:@"%@/%@", parentDirectoryOfOriginalDirectory.absoluteString, duplicateDirectoryName];
    
    // Create and run copy/duplicate task
    NSTask *duplicateTask = [[NSTask alloc] init];
    NSArray *args = @[@"-r", pathOfOriginalDirectory, pathOfNewDirectory];
    
    [duplicateTask setLaunchPath:@"/bin/cp"];
    [duplicateTask setArguments:args];
    
    @try {
        [duplicateTask launch];
    }
    @catch (NSException *e) {
        NSLog(@"Error while running duplicate operation. (%@ / %@)", e.name, e.reason);
    }
}

+ (void)renameFile:(NSURL *)file
{
    
}

+ (void)renameDirectory:(NSURL *)directory
{
    
}

+ (void)createSymLinkOfFile:(NSURL *)file
{
    
}

+ (void)searchForFilesNamedLike:(NSString *)searchText
{
    // use mdfind command
}

+ (void)emptyTrash
{
    
}

+ (void)ejectDisk
{
    
}


@end
