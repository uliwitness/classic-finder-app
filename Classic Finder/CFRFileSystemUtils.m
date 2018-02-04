//
//  CFRFileSystemUtils.m
//  Classic Finder
//
//  Created by Ben Szymanski on 1/8/18.
//  Copyright © 2018 Ben Szymanski. All rights reserved.
//
//
// This file is part of Classic Finder.
//
// Classic Finder is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Classic Finder is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Classic Finder.  If not, see <http://www.gnu.org/licenses/>.

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
