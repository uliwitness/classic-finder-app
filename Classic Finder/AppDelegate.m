//
//  AppDelegate.m
//  Classic Finder
//
//  Created by Ben Szymanski on 2/18/17.
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

#import "AppDelegate.h"
#import "CCIClassicFinderWindow.h"
#import "CCIClassicFinderWindowController.h"
#import "CFRWindowManager.h"
#import "CFRDirectoryModel.h"
#import "CFRFloppyDisk.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

- (instancetype)init
{
    self = [super init];
    
    if (self)
    { }
    
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    [self openRootVolumeWindow];
}

- (void)applicationDidBecomeActive:(NSNotification *)notification
{
    CFRWindowManager *windowManager = [CFRWindowManager sharedInstance];
    
    if ([windowManager numberOfOpenWindows] == 0) {
        [self openRootVolumeWindow];
    }
}

// Inspiration for the following two methods comes from:
// http://www.cocoabuilder.com/archive/cocoa/238362-how-to-detect-click-on-app-dock-icon-when-the-app-is-active.html

- (BOOL)applicationShouldOpenUntitledFile:(NSApplication *)sender
{
    return YES;
}

- (BOOL)applicationOpenUntitledFile:(NSApplication *)sender
{
    CFRWindowManager *windowManager = [CFRWindowManager sharedInstance];
    
    if ([windowManager numberOfOpenWindows] == 0) {
        [self openRootVolumeWindow];
    }
    
    return YES;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)openRootVolumeWindow
{
    NSURL *userDirectoryPath = [NSURL URLWithString:@"file:///"];
    
    CFRDirectoryModel *rootDirectoryModel = [[CFRDirectoryModel alloc] init];
    [rootDirectoryModel setObjectPath:userDirectoryPath];
    
    [CFRFloppyDisk restoreDirectoryProperties:rootDirectoryModel];
    NSPoint persistedWindowPosition = [rootDirectoryModel windowPosition];
    
    if ((persistedWindowPosition.x == -1.0) &&
        (persistedWindowPosition.y == -1.0))
    {
        // We assume the window position hasn't been
        // previously set if windowPosition = (-1, -1).
        // We will just position at the midpoint of
        // the user's main screen
        
        NSRect screenSize = [[NSScreen mainScreen] frame];
        CGFloat xPos = (screenSize.size.width / 2.0) - 250.0;
        CGFloat yPos = (screenSize.size.height / 2.0) - 150.0;
        
        NSPoint newWindowPosition = NSMakePoint(xPos, yPos);
        [rootDirectoryModel setWindowPosition:newWindowPosition];
    }
    
    CCIClassicFinderWindowController *finderWindow = [CFRWindowManager.sharedInstance createWindowForDirectory:rootDirectoryModel];
    [finderWindow showWindow:self];
    
    self.window = finderWindow.window;
}

@end
