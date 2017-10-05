//
//  CCIClassicFile.h
//  Classic Finder
//
//  Created by Ben Szymanski on 10/4/17.
//  Copyright © 2017 Protype Software Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CCIClassicFile : NSControl

@property (nonatomic, copy) NSURL *representedFile;
@property (nonatomic, strong) NSTextField *fileLabel;

- (void)selectFile;
- (void)deselectFile;

@end
