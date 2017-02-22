//
//  AppDelegate.m
//  Classic Finder
//
//  Created by Ben Szymanski on 2/18/17.
//  Copyright © 2017 Protype Software Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import "CCIClassicFinderWindow.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

- (instancetype)init
{
    self = [super init];
    
    if (self) {

        NSUInteger windowStyleMask = NSWindowStyleMaskBorderless;
        NSRect initalContentRect = NSMakeRect(300.0, 300.0, 500.0, 300.0);
        
        CCIClassicFinderWindow *initialFW = [[CCIClassicFinderWindow alloc] initWithContentRect:initalContentRect
                                                                                      styleMask:windowStyleMask
                                                                                        backing:NSBackingStoreBuffered
                                                                                          defer:YES];
        
        [self setWindow:initialFW];
        [self.window makeKeyAndOrderFront:self];
        
    }
    
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    [self.window makeKeyAndOrderFront:self];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
