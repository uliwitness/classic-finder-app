//
//  CFRWindowManager.m
//  Classic Finder
//
//  Created by Ben Szymanski on 3/25/17.
//  Copyright © 2017 Protype Software Ltd. All rights reserved.
//

#import "CFRWindowManager.h"
#import "CCIClassicFinderWindow.h"
#import "AppDelegate.h"

@interface CFRWindowManager ()

@property (nonatomic, strong) NSMutableArray *activeWindows;

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
        sharedInstance.activeWindows = [[NSMutableArray alloc] init];
    });
    
    return sharedInstance;
}

- (NSWindowController *)createWindowForPath:(NSURL *)path
{
    NSUInteger windowStyleMask = NSWindowStyleMaskBorderless;
    NSRect initalContentRect = NSMakeRect(300.0, 300.0, 500.0, 300.0);
    
    // https://stackoverflow.com/a/33229421/5096725
    
    CCIClassicFinderWindow *finderWindow = [[CCIClassicFinderWindow alloc] initWithContentRect:initalContentRect
                                                                                  styleMask:windowStyleMask
                                                                                    backing:NSBackingStoreBuffered
                                                                                      defer:YES
                                                                            atDirectoryPath: [path absoluteString]];
    finderWindow.delegate = self;
    finderWindow.representedURL = path;
    [finderWindow makeKeyAndOrderFront:self];
    
    NSWindowController *finderWindowController = [[NSWindowController alloc] initWithWindow:finderWindow];
    
    [self.activeWindows addObject:finderWindowController];
    
    return finderWindowController;
}

- (void)windowWillClose:(NSNotification *)notification
{
    CCIClassicFinderWindow *finderWindow = notification.object;
    [self.activeWindows removeObject:finderWindow.windowController];
}

@end
