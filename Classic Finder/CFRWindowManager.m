//
//  CFRWindowManager.m
//  Classic Finder
//
//  Created by Ben Szymanski on 3/25/17.
//  Copyright © 2017 Ben Szymanski. All rights reserved.
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

#import "CFRWindowManager.h"
#import "CCIClassicFinderWindow.h"
#import "AppDelegate.h"
#import "CCIClassicFinderWindowController.h"
#import "CFRDirectoryModel.h"

@interface CFRWindowManager ()

@property (nonatomic, strong) NSMutableDictionary *activeWindows;
@property (nonatomic, strong) CCIClassicFinderWindowController *activeWindow;

@end

@implementation CFRWindowManager

+(CFRWindowManager *)sharedInstance
{
    static CFRWindowManager *sharedInstance = nil;
    static dispatch_once_t pred;
    
    if (sharedInstance != nil) {
        return sharedInstance;
    }
    
    dispatch_once(&pred, ^{
        sharedInstance = [CFRWindowManager alloc];
        sharedInstance = [sharedInstance init];
        sharedInstance.activeWindows = [[NSMutableDictionary alloc] initWithCapacity:30];
    });
    
    return sharedInstance;
}

- (CCIClassicFinderWindowController *)createWindowForDirectory:(CFRDirectoryModel *)directoryModel
{
    CCIClassicFinderWindowController *finderWindowController;
    
    if ([self.activeWindows objectForKey:directoryModel.objectPath.absoluteString] != nil)
    {
        finderWindowController = [self.activeWindows objectForKey:directoryModel.objectPath.absoluteString];
    } else
    {
        CCIClassicFinderWindowController *wc = [[CCIClassicFinderWindowController alloc] initForDirectory:directoryModel];
        
        [wc.window makeKeyAndOrderFront:self];
        
        finderWindowController = wc;
        
        [self.activeWindows setObject:wc
                               forKey:directoryModel.objectPath.absoluteString];
    }
    
    return finderWindowController;
}

- (void)windowWillClose:(NSNotification *)notification
{
    CCIClassicFinderWindow *finderWindow = notification.object;
    CCIClassicFinderWindowController *finderWindowController = finderWindow.windowController;
    NSString *pathString = finderWindowController.directoryModel.objectPath.absoluteString;
    
    [self.activeWindows removeObjectForKey:pathString];
}

- (void)windowDidBecomeMain:(NSNotification *)notification
{
    CCIClassicFinderWindow *finderWindow = notification.object;
    CCIClassicFinderWindowController *finderWindowController = finderWindow.windowController;
    
    self.activeWindow = finderWindowController;
}

- (NSUInteger)numberOfOpenWindows
{
    return [[self activeWindows] count];
}

@end
