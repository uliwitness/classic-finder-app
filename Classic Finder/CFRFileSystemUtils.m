//
//  CFRFileSystemUtils.m
//  Classic Finder
//
//  Created by Ben Szymanski on 1/8/18.
//  Copyright © 2018 Protype Software Ltd. All rights reserved.
//

#import "CFRFileSystemUtils.h"

@implementation CFRFileSystemUtils

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
