//
//  CCIClassicFinderWindowController.m
//  Classic Finder
//
//  Created by Ben Szymanski on 10/5/17.
//  Copyright © 2017 Protype Software Ltd. All rights reserved.
//

#import "CCIClassicFinderWindowController.h"
#import "CCIClassicFinderWindow.h"
#import "CFRFileSystemOperations.h"
#import "CFRWindowManager.h"

@interface CCIClassicFinderWindowController ()

@property (nonatomic, copy) NSString *windowDirectoryName;
@property (nonatomic, copy) NSArray *fileList;

@end

@implementation CCIClassicFinderWindowController

- (instancetype)initForDirectory:(NSURL *)directory
                         atPoint:(NSPoint)point
{
    self = [super init];
    
    if (self) {
        self.representedDirectory = directory;  
        self.windowDirectoryName = [self.representedDirectory lastPathComponent];
        self.fileList = [CFRFileSystemOperations getListingForDirectory:self.representedDirectory];
        
        NSUInteger windowStyleMask = NSWindowStyleMaskBorderless;
        NSRect initalContentRect = NSMakeRect(point.x, point.y, 500.0, 300.0);
        
        // https://stackoverflow.com/a/33229421/5096725
        CCIClassicFinderWindow *finderWindow = [[CCIClassicFinderWindow alloc] initWithContentRect:initalContentRect
                                                                                         styleMask:windowStyleMask
                                                                                           backing:NSBackingStoreBuffered
                                                                                             defer:YES
                                                                                   withWindowTitle:self.windowDirectoryName andFileList:self.fileList];
        finderWindow.delegate = [CFRWindowManager sharedInstance];
        self.window = finderWindow;
        
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
    NSLog(@"windowDidBecomeMain = %@", self.representedDirectory.absoluteString);
}

- (void)windowDidResignMain:(NSNotification *)notification
{
    NSLog(@"windowDidResignMain = %@", self.representedDirectory.absoluteString);
}

@end
