//
//  CCIClassicFile.m
//  Classic Finder
//
//  Created by Ben Szymanski on 10/4/17.
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

#import "CCIClassicFile.h"
#import "CCIClassicFileIcon.h"
#import "CFRFileSystemOperations.h"
#import "CCIClassicFinderWindowController.h"

@interface CCIClassicFile()

@property (nonatomic, copy) NSString *fileTitle;
@property (nonatomic, strong) CCIClassicFileIcon *iconImage;
@property BOOL fileSelected;

@end

@implementation CCIClassicFile

- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    
    if (self)
    {
        self.fileSelected = NO;
        
        NSRect fileIconFrame = NSMakeRect(18.5, 2.0, 31.0, 31.0);
        self.iconImage = [[CCIClassicFileIcon alloc] initWithFrame:fileIconFrame];
        
        [self addSubview:self.iconImage];
        
        NSRect fileLabelFrame = NSMakeRect(2.0, 35.0, 54.0, 24.0);
        self.fileLabel = [[NSTextField alloc] initWithFrame:fileLabelFrame];
        self.fileLabel.alignment = NSTextAlignmentCenter;
        self.fileLabel.font = [NSFont systemFontOfSize:10.0];
        self.fileLabel.bordered = NO;
        self.fileLabel.selectable = NO;
        self.fileLabel.lineBreakMode = NSLineBreakByCharWrapping;
        self.fileLabel.drawsBackground = YES;
        
        [self addSubview:self.fileLabel];
    }
    
    return self;
}

//- (void)drawRect:(NSRect)dirtyRect {
//    [super drawRect:dirtyRect];
//
//    // Drawing code here.
//}

- (BOOL)isFlipped
{
    return YES;
}

- (void)mouseDown:(NSEvent *)event
{
    CCIClassicFinderWindowController *wc = event.window.windowController;
    [wc selectedNewFile:self];
}

- (void)mouseUp:(NSEvent *)event
{
    if (event.clickCount == 2)
    {
        [CFRFileSystemOperations openFileAtURL:self.representedFile];
    }
}

- (void)normalFileTitleTextColor
{
    self.fileLabel.backgroundColor = [NSColor whiteColor];
    self.fileLabel.textColor = [NSColor blackColor];
}

- (void)reverseFileTitleTextColor
{
    self.fileLabel.backgroundColor = [NSColor blackColor];
    self.fileLabel.textColor = [NSColor whiteColor];
}

- (void)selectItem
{
    self.fileSelected = YES;
    [self reverseFileTitleTextColor];
    [self.iconImage selectFile];
    [self setNeedsDisplay:YES];
}

- (void)deselectItem
{
    self.fileSelected = NO;
    [self normalFileTitleTextColor];
    [self.iconImage deselectFile];
    [self setNeedsDisplay:YES];
}

@end
