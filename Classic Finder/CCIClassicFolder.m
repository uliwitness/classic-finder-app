//
//  CCIClassicFolder.m
//  Classic Finder
//
//  Created by Ben Szymanski on 2/19/17.
//  Copyright © 2017 Protype Software Ltd. All rights reserved.
//

#import "CCIClassicFolder.h"
#import "CCIClassicFolderIcon.h"
#import "CFRWindowManager.h"
#import "AppDelegate.h"
#import "CCIClassicFinderWindow.h"

@interface CCIClassicFolder ()

@property (nonatomic, copy) NSString *folderTitle;
@property (nonatomic, strong) CCIClassicFolderIcon *iconImage;

@property BOOL folderSelected;

@end

@implementation CCIClassicFolder

- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    
    if (self) {
        self.folderSelected = NO;
        
        NSRect folderIconFrame = NSMakeRect(14.5, 2.0, 31.0, 25.0);
        self.iconImage = [[CCIClassicFolderIcon alloc] initWithFrame:folderIconFrame];
        
        [self addSubview:self.iconImage];
        
        NSRect folderLabelFrame = NSMakeRect(2.0, 35.0, 54.0, 24.0);
        self.folderLabel = [[NSTextField alloc] initWithFrame:folderLabelFrame];
        self.folderLabel.alignment = NSTextAlignmentCenter;
        self.folderLabel.font = [NSFont systemFontOfSize:10.0];
        self.folderLabel.bordered = NO;
        self.folderLabel.selectable = NO;
        self.folderLabel.lineBreakMode = NSLineBreakByCharWrapping;
        self.folderLabel.drawsBackground = YES;
        
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
    if (self.folderSelected) {
        [self unselectFolder];
    } else {
        [self selectFolder];
    }
}

- (void)mouseUp:(NSEvent *)event
{
    if (event.clickCount == 2) {
        NSRect windowFrame = event.window.frame;
        CGFloat xPos = windowFrame.origin.x + 30.0;
        CGFloat yPos = windowFrame.origin.y - 30.0;
        NSPoint newWindowPosition = NSMakePoint(xPos, yPos);
        
        NSWindowController *finderWindow = [CFRWindowManager.sharedInstance createWindowForPath:self.representingDirectory
                                                                               atSpecifiedPoint:newWindowPosition];
        [finderWindow showWindow:self];
    }
}

- (void)normalFolderTitleTextColor
{
    self.folderLabel.backgroundColor = [NSColor whiteColor];
    self.folderLabel.textColor = [NSColor blackColor];
}

- (void)reverseFolderTitleTextColor
{
    self.folderLabel.backgroundColor = [NSColor blackColor];
    self.folderLabel.textColor = [NSColor whiteColor];
}

- (void)selectFolder
{
    self.folderSelected = YES;
    [self reverseFolderTitleTextColor];
    [self.iconImage selectFolder];
    [self setNeedsDisplay:YES];
}

- (void)unselectFolder
{
    self.folderSelected = NO;
    [self normalFolderTitleTextColor];
    [self.iconImage unselectFolder];
    [self setNeedsDisplay:YES];
}

@end
