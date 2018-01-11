//
//  CFRFileSystemUtils.m
//  Classic Finder
//
//  Created by Ben Szymanski on 1/8/18.
//  Copyright © 2018 Protype Software Ltd. All rights reserved.
//

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

@end
