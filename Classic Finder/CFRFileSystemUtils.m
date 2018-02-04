//
//  CFRFileSystemUtils.m
//  Classic Finder
//
//  Created by Ben Szymanski on 1/8/18.
//  Copyright © 2018 Ben Szymanski. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "CFRFileSystemUtils.h"

@implementation CFRFileSystemUtils


// https://stackoverflow.com/questions/20519577/returning-the-volume-name-of-a-folder-or-a-volume

+ (NSString *)determineDirectoryNameForURL:(NSURL *)url
{
    NSString *directoryName = @"";
    
    NSNumber *isVolume;
    NSError *isVolumeError = nil;
    [url getResourceValue:&isVolume forKey:NSURLIsVolumeKey error:&isVolumeError];
    
    if (isVolumeError != nil) {
        directoryName = [url lastPathComponent];
    } else {
        if ([isVolume boolValue]) {
            NSString *volumeName;
            NSError *volumeNameError = nil;
            
            [url getResourceValue:&volumeName forKey:NSURLVolumeNameKey error:&volumeNameError];
            
            if (volumeNameError == nil) {
                directoryName = volumeName;
            }
        } else {
            directoryName = [url lastPathComponent];
        }
    }

    return directoryName;
}

// https://www.cocoawithlove.com/2010/05/finding-or-creating-application-support.html

+ (NSString *)applicationSupportDirectory
{
    NSString *appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleExecutable"];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory,
                                                         NSUserDomainMask,
                                                         YES);
    
    if ([paths count] == 0) {
        // return error #shitshitshit
    }
    
    NSString *resolvedPath = [paths objectAtIndex:0];
    NSString *resolvedPathWithEndingSlash = [NSString stringWithFormat:@"%@/", resolvedPath];
    NSString *pathAndExecutableCombination = [resolvedPathWithEndingSlash stringByAppendingString:appName];
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    NSError *creationError = nil;
    
    BOOL pathCreateResult = [defaultManager createDirectoryAtPath:pathAndExecutableCombination
                                      withIntermediateDirectories:YES
                                                       attributes:nil
                                                            error:&creationError];
    
    if (!pathCreateResult) {
        if (creationError != nil) {
            NSLog(@"%@", [creationError localizedDescription]);
        }
        
        return nil;
    }
    
    return pathAndExecutableCombination;
}

@end
