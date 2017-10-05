//
//  CCIClassicFile.m
//  Classic Finder
//
//  Created by Ben Szymanski on 10/4/17.
//  Copyright © 2017 Protype Software Ltd. All rights reserved.
//

#import "CCIClassicFile.h"
#import "CCIClassicFileIcon.h"

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
        
        NSRect fileIconFrame = NSMakeRect(14.5, 2.0, 31.0, 25.0);
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
    if (self.fileSelected) {
        [self deselectFile];
    } else {
        [self selectFile];
    }
}

- (void)mouseUp:(NSEvent *)event
{
    if (event.clickCount == 2)
    {
        NSTask *openTask = [[NSTask alloc] init];
        NSArray *args = @[self.representedFile.absoluteString];
        
        [openTask setLaunchPath:@"/usr/bin/open"];
        [openTask setArguments:args];
        
        [openTask launch];
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

- (void)selectFile
{
    self.fileSelected = YES;
    [self reverseFileTitleTextColor];
    [self.iconImage selectFile];
    [self setNeedsDisplay:YES];
}

- (void)deselectFile
{
    self.fileSelected = NO;
    [self normalFileTitleTextColor];
    [self.iconImage deselectFile];
    [self setNeedsDisplay:YES];
}

@end
