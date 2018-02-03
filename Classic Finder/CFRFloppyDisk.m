//
//  CFRFloppyDisk.m
//  Classic Finder
//
//  Created by Ben Szymanski on 1/14/18.
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

#import "CFRFloppyDisk.h"
#import "CFRFileSystemUtils.h"
#import "CFRFileModel.h"
#import "CFRDirectoryModel.h"
#import "CFRAppModel.h"

@implementation CFRFloppyDisk

+ (void)restoreFileProperties:(CFRFileModel *)fileModel
{
    NSString *applicationSupportDirectory = [CFRFileSystemUtils applicationSupportDirectory];
    NSString *archivePath = [applicationSupportDirectory stringByAppendingString:[fileModel uniqueID]];

    BOOL archiveFileExists = [[NSFileManager defaultManager] fileExistsAtPath:archivePath];
    
    if (archiveFileExists) {
        id archivedObject = [NSKeyedUnarchiver unarchiveObjectWithFile:archivePath];
        CFRFileModel *unarchivedFileModel = (CFRFileModel *)archivedObject;
        
        [fileModel setIconPosition:[unarchivedFileModel iconPosition]];
    } else {
        [fileModel setIconPosition:NSMakePoint(-1.0, -1.0)];
    }
}

+ (void)restoreDirectoryProperties:(CFRDirectoryModel *)directoryModel
{
    NSString *applicationSupportDirectory = [CFRFileSystemUtils applicationSupportDirectory];
    NSString *archivePath = [applicationSupportDirectory stringByAppendingString:[directoryModel uniqueID]];
    
    BOOL archiveFileExists = [[NSFileManager defaultManager] fileExistsAtPath:archivePath];
    
    if (archiveFileExists) {
        id archivedObject = [NSKeyedUnarchiver unarchiveObjectWithFile:archivePath];
        CFRDirectoryModel *unarchivedDirectoryModel = (CFRDirectoryModel *)archivedObject;
        
        [directoryModel setIconPosition:[unarchivedDirectoryModel iconPosition]];
        [directoryModel setWindowDimensions:[unarchivedDirectoryModel windowDimensions]];
        [directoryModel setWindowPosition:[unarchivedDirectoryModel windowPosition]];
    } else {
        [directoryModel setIconPosition:NSMakePoint(-1.0, -1.0)];
        [directoryModel setWindowDimensions:NSMakeSize(-1.0, -1.0)];
        [directoryModel setWindowPosition:NSMakePoint(-1.0, -1.0)];
    }
}

+ (void)restoreAppDirectoryProperties:(CFRAppModel *)appDirectoryModel
{
    NSString *applicationSupportDirectory = [CFRFileSystemUtils applicationSupportDirectory];
    NSString *archivePath = [applicationSupportDirectory stringByAppendingString:[appDirectoryModel uniqueID]];
    
    BOOL archiveFileExists = [[NSFileManager defaultManager] fileExistsAtPath:archivePath];
    
    if (archiveFileExists) {
        id archivedObject = [NSKeyedUnarchiver unarchiveObjectWithFile:archivePath];
        CFRAppModel *unarchivedAppModel = (CFRAppModel *)archivedObject;
        
        [appDirectoryModel setIconPosition:[unarchivedAppModel iconPosition]];
    } else {
        [appDirectoryModel setIconPosition:NSMakePoint(-1.0, -1.0)];
    }
}

+ (BOOL)persistFileProperties:(CFRFileModel *)fileModel;
{
    NSString *applicationSupportDirectory = [CFRFileSystemUtils applicationSupportDirectory];
    NSString *archivePath = [applicationSupportDirectory stringByAppendingString:[fileModel uniqueID]];
    
    BOOL result = [NSKeyedArchiver archiveRootObject:fileModel
                                              toFile:archivePath];
    
    return result;
}

+ (BOOL)persistDirectoryProperties:(CFRDirectoryModel *)directoryModel
{
    NSString *applicationSupportDirectory = [CFRFileSystemUtils applicationSupportDirectory];
    NSString *archivePath = [applicationSupportDirectory stringByAppendingString:[directoryModel uniqueID]];
    
    BOOL result = [NSKeyedArchiver archiveRootObject:directoryModel
                                              toFile:archivePath];
    
    return result;
}

+ (BOOL)persistAppDirectoryProperties:(CFRAppModel *)appDirectoryModel
{
    NSString *applicationSupportDirectory = [CFRFileSystemUtils applicationSupportDirectory];
    NSString *archivePath = [applicationSupportDirectory stringByAppendingString:[appDirectoryModel uniqueID]];
    
    BOOL result = [NSKeyedArchiver archiveRootObject:appDirectoryModel
                                              toFile:archivePath];
    
    return result;
}

@end
