//
//  AppDelegate.m
//  Classic Finder
//
//  Created by Ben Szymanski on 2/18/17.
//  Copyright © 2017 Protype Software Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import "CCIClassicFinderWindow.h"
#import "CFRWindowManager.h"

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
    
    NSString *userDirectoryPathExpanded = [@"~" stringByStandardizingPath];;
    NSURL *userDirectoryPath = [NSURL URLWithString:userDirectoryPathExpanded];
    
    NSWindowController * finderWindow = [CFRWindowManager.sharedInstance createWindowForPath:userDirectoryPath];
    [finderWindow showWindow:self];
    
    //[self.window makeKeyAndOrderFront:self];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
