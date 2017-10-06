//
//  CCIClassicFinderWindowController.h
//  Classic Finder
//
//  Created by Ben Szymanski on 10/5/17.
//  Copyright © 2017 Protype Software Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CCIClassicFinderWindowController : NSWindowController

@property (nonatomic, copy) NSURL *representedDirectory;

- (instancetype)initForDirectory:(NSURL *)directory
                         atPoint:(NSPoint)point;

@end
