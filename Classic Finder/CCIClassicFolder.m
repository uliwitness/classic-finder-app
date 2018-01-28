//
//  CCIClassicFolder.m
//  Classic Finder
//
//  Created by Ben Szymanski on 2/19/17.
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

#import "CCIClassicFolder.h"
#import "CCIClassicFolderIcon.h"
#import "CFRWindowManager.h"
#import "AppDelegate.h"
#import "CCIClassicFinderWindow.h"
#import "CCIClassicFinderWindowController.h"
#import "CCIApplicationStyles.h"

@interface CCIClassicFolder ()

@property (nonatomic, copy) NSString *folderTitle;
@property (nonatomic, strong) CCIClassicFolderIcon *iconImage;

@property BOOL folderSelected;
@property BOOL folderOpened;

@end

@implementation CCIClassicFolder

- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    
    if (self) {
        [self setFolderSelected:NO];
        [self setFolderOpened:NO];
        
        NSRect folderIconFrame = NSMakeRect(14.5, 2.0, 31.0, 25.0);
        self.iconImage = [[CCIClassicFolderIcon alloc] initWithFrame:folderIconFrame];
        
        [self addSubview:self.iconImage];
        
        NSRect folderLabelFrame = NSMakeRect(2.0, 35.0, 54.0, 50.0);
        self.folderLabel = [[NSTextField alloc] initWithFrame:folderLabelFrame];
        self.folderLabel.alignment = NSTextAlignmentCenter;
        self.folderLabel.font = [NSFont systemFontOfSize:10.0];
        self.folderLabel.bordered = NO;
        self.folderLabel.selectable = NO;
        self.folderLabel.lineBreakMode = NSLineBreakByCharWrapping;
        self.folderLabel.drawsBackground = YES;
        self.folderLabel.maximumNumberOfLines = 5;
        self.folderLabel.usesSingleLineMode = NO;
        
        [self addSubview:self.folderLabel];
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];

    // Drawing code here.
}

- (BOOL)isFlipped
{
    return YES;
}

- (void)mouseDown:(NSEvent *)event
{
    CCIClassicFinderWindowController *wc = event.window.windowController;
    [wc selectedNewFolder:self];
}

- (void)mouseUp:(NSEvent *)event
{
    if (event.clickCount == 2)
    {
        NSRect windowFrame = event.window.frame;
        CGFloat xPos = windowFrame.origin.x + 30.0;
        CGFloat yPos = windowFrame.origin.y - 30.0;
        NSPoint newWindowPosition = NSMakePoint(xPos, yPos);
        
        [self setOpenItemState];
        
        NSWindowController *finderWindow = [CFRWindowManager.sharedInstance createWindowForPath:self.representingDirectory
                                                                               atSpecifiedPoint:newWindowPosition];
        
        [finderWindow showWindow:self];
        
        [[NSNotificationCenter defaultCenter] addObserver:event.window.windowController
                                                 selector:@selector(closeOpenedFolder:)
                                                     name:NSWindowWillCloseNotification
                                                   object:finderWindow.window];
    }
}

- (void)normalFolderTitleTextColor
{
    self.folderLabel.backgroundColor = [[CCIApplicationStyles instance] whiteColor];
    self.folderLabel.textColor = [[CCIApplicationStyles instance] blackColor];
}

- (void)reverseFolderTitleTextColor
{
    self.folderLabel.backgroundColor = [[CCIApplicationStyles instance] blackColor];
    self.folderLabel.textColor = [[CCIApplicationStyles instance] whiteColor];
}

- (void)selectItem
{
    [self setFolderSelected:YES];
    [self reverseFolderTitleTextColor];
    [[self iconImage] selectFolder];
    [self setNeedsDisplay:YES];
}

- (void)deselectItem
{
    [self setFolderSelected:NO];
    [self normalFolderTitleTextColor];
    [[self iconImage] unselectFolder];
    [self setNeedsDisplay:YES];
}

- (void)setOpenItemState
{
    [self setFolderOpened:YES];
    [[self iconImage] openFolder];
    [self setNeedsDisplay:YES];
}

- (void)setCloseItemState
{
    [self setFolderOpened:NO];
    [[self iconImage] closeFolder];
    [self setNeedsDisplay:YES];
}

@end
