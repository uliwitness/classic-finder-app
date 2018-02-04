//
//  CCIClassicFinderWindowController.m
//  Classic Finder
//
//  Created by Ben Szymanski on 10/5/17.
//  Copyright © 2017 Ben Szymanski. All rights reserved.
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

#import "CCIClassicFinderWindowController.h"
#import "CCIClassicFinderWindow.h"
#import "CFRFileSystemOperations.h"
#import "CFRWindowManager.h"
#import "CCIFinderIconProtocol.h"
#import "CCIClassicFile.h"
#import "CCIClassicFolder.h"
#import "CFRFileSystemUtils.h"
#import "CFRDirectoryModel.h"
#import "CFRFloppyDisk.h"

@interface CCIClassicFinderWindowController ()

@property (nonatomic, copy) NSString *windowDirectoryName;
@property (nonatomic, copy) NSArray *fileList;
@property (nonatomic, strong) NSMutableArray *selectedFiles;

@end

@implementation CCIClassicFinderWindowController

- (instancetype)initForDirectory:(CFRDirectoryModel *)directoryModel
{
    self = [super init];
    
    if (self) {
        NSString *directoryName = [CFRFileSystemUtils determineDirectoryNameForURL:directoryModel.objectPath];
        
        self.directoryModel = directoryModel;
        self.windowDirectoryName = directoryName;
        self.fileList = [CFRFileSystemOperations getListingForDirectory:self.directoryModel.objectPath];
        self.selectedFiles = [[NSMutableArray alloc] initWithCapacity:50];
        
        NSUInteger windowStyleMask = NSWindowStyleMaskBorderless;
        NSRect initalContentRect = NSMakeRect(self.directoryModel.windowPosition.x, self.directoryModel.windowPosition.y, 500.0, 300.0);
        
        // https://stackoverflow.com/a/33229421/5096725
        CCIClassicFinderWindow *finderWindow = [[CCIClassicFinderWindow alloc] initWithContentRect:initalContentRect
                                                                                         styleMask:windowStyleMask
                                                                                           backing:NSBackingStoreBuffered
                                                                                             defer:YES
                                                                                   withWindowTitle:self.windowDirectoryName
                                                                                          fileList:self.fileList
                                                                                     andController:self];

        [finderWindow setDelegate:[CFRWindowManager sharedInstance]];
        [finderWindow setWindowController:self];
        [self setWindow:finderWindow];
        
        [finderWindow makeKeyAndOrderFront:self];
        
        NSNotificationCenter *dc = [NSNotificationCenter defaultCenter];
        
        [dc addObserver:self
               selector:@selector(windowDidResignMain:)
                   name:NSWindowDidResignMainNotification
                 object:finderWindow];
        
        [dc addObserver:self
               selector:@selector(windowDidBecomeMain:)
                   name:NSWindowDidBecomeMainNotification
                 object:finderWindow];
    }
    
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
}

- (void)windowDidBecomeMain:(NSNotification *)notification
{
    CCIClassicFinderWindow *finderWindow = (CCIClassicFinderWindow *)self.window;
    [finderWindow setWindowActive];
}

- (void)windowDidResignMain:(NSNotification *)notification
{
    CCIClassicFinderWindow *finderWindow = (CCIClassicFinderWindow *)self.window;
    [finderWindow setWindowInactive];
}

- (void)closeOpenedFolder:(NSNotification *)notification
{
    CCIClassicFinderWindow *closingWindow = (CCIClassicFinderWindow *)[notification object];
    CCIClassicFinderWindowController *closingWindowController = closingWindow.windowController;
    
    for (CCIClassicFolder *folder in self.selectedFiles) {
        if (folder.directoryModel.objectPath == closingWindowController.directoryModel.objectPath) {
            [folder setCloseItemState];
            //NSLog(@"closing folder... %@", closingWindowController.representedDirectory);
        }
    }
}

- (void)selectedNewFile:(CCIClassicFile *)file
{
    for (CCIClassicFile *file in self.selectedFiles) {
        [file deselectItem];
    }
    
    [self.selectedFiles removeAllObjects];
    
    [file selectItem];
    [self.selectedFiles addObject:file];
}

- (void)selectedNewFolder:(CCIClassicFolder *)folder
{
    for (CCIClassicFolder *folder in self.selectedFiles) {
        [folder deselectItem];
    }
    
    [self.selectedFiles removeAllObjects];
    
    [folder selectItem];
    [self.selectedFiles addObject:folder];
}

- (void)deselectAllItems
{
    NSMutableArray *selectedFiles = [self selectedFiles];
    
    for (CCIClassicFile *file in selectedFiles) {
        [file deselectItem];
    }
    
    [self.selectedFiles removeAllObjects];
}

#pragma mark - TITLEBAR DELEGATE METHODS

- (void)titlebarDidFinishDetectingWindowPositionChange:(CCITitleBar *)sender
{
    NSPoint currentPosition = self.window.frame.origin;
    
    [[self directoryModel] setWindowPosition:currentPosition];
    [CFRFloppyDisk persistDirectoryProperties:[self directoryModel]];
}

@end
