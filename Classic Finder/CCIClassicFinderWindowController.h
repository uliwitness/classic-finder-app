//
//  CCIClassicFinderWindowController.h
//  Classic Finder
//
//  Created by Ben Szymanski on 10/5/17.
//  Copyright © 2017 Ben Szymanski. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class CCIClassicFile;
@class CCIClassicFolder;

@interface CCIClassicFinderWindowController : NSWindowController

@property (nonatomic, copy) NSURL *representedDirectory;

- (instancetype)initForDirectory:(NSURL *)directory
                         atPoint:(NSPoint)point;

- (void)selectedNewFile:(CCIClassicFile *)file;
- (void)selectedNewFolder:(CCIClassicFolder *)folder;

@end
