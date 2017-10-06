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
#import "CCIClassicFinderWindowController.h"

@interface CFRWindowManager ()

@property (nonatomic, strong) NSMutableDictionary *activeWindows;

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

- (NSWindowController *)createWindowForPath:(NSURL *)path
{
    NSRect screenSize = [[NSScreen mainScreen] frame];
    CGFloat xPos = (screenSize.size.width / 2.0) - 250.0;
    CGFloat yPos = (screenSize.size.height / 2.0) - 150.0;
    
    NSWindowController *newFinderWindow = [self createWindowForPath:path
                                                   atSpecifiedPoint:NSMakePoint(xPos, yPos)];
    
    return newFinderWindow;
}

- (NSWindowController *)createWindowForPath:(NSURL *)path
                              atSpecifiedPoint:(NSPoint)point
{
    NSWindowController *finderWindowController;
    
    if ([self.activeWindows objectForKey:path.absoluteString] != nil)
    {
        finderWindowController = [self.activeWindows objectForKey:path.absoluteString];
    } else
    {
        
        //finderWindowController = [[NSWindowController alloc] initWithWindow:finderWindow];
        
        CCIClassicFinderWindowController *wc = [[CCIClassicFinderWindowController alloc] initForDirectory:path
                                                                                                  atPoint:point];
        [wc.window makeKeyAndOrderFront:self];
        
        [self.activeWindows setObject:wc
                               forKey:path.absoluteString];
        
        
    }

    return finderWindowController;
}

- (void)windowWillClose:(NSNotification *)notification
{
    CCIClassicFinderWindow *finderWindow = notification.object;
    CCIClassicFinderWindowController *finderWindowController = finderWindow.windowController;
    [self.activeWindows removeObjectForKey:finderWindowController.representedDirectory.absoluteString];
}

@end
