//
//  CCITitleBar.m
//  Classic Finder
//
//  Created by Ben Szymanski on 2/18/17.
//  Copyright © 2017 Protype Software Ltd. All rights reserved.
//

#import "CCITitleBar.h"
#import "CCICloseButton.h"
#import "CCIMaximizeButton.h"

@interface CCITitleBar ()

@property (nonatomic, strong) CCICloseButton *closeButton;
@property (nonatomic, strong) CCIMaximizeButton *maximizeButton;

@property NSPoint originalMouseCoordinates;

@end

@implementation CCITitleBar

- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    
    if (self) {
        self.showCloseButton = YES;
        self.showMaximizeButton = YES;
        
        [self addCloseButtonToTitlebar];
        [self addMaximizeButtonToTitlebar];
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    [self drawOutlinesAndShadows];
    [self drawTextureLines];
    [self drawTitleText];
}

- (void)addCloseButtonToTitlebar
{
    if (self.showCloseButton) {
        NSRect frame = NSMakeRect(8.0, 4.0, 13.0, 11.0);
        self.closeButton = [[CCICloseButton alloc] initWithFrame:frame];
        
        [self addSubview:self.closeButton];
    }
}

- (void)addMaximizeButtonToTitlebar
{
    if (self.showMaximizeButton) {
        NSRect frame = NSMakeRect(self.frame.size.width - 8.0 - 13.0, 4.0, 13.0, 11.0);
        self.maximizeButton = [[CCIMaximizeButton alloc] initWithFrame:frame];
        
        [self addSubview:self.maximizeButton];
    }
}

- (void)mouseDown:(NSEvent *)event
{
    self.originalMouseCoordinates = event.locationInWindow;
}

- (void)mouseDragged:(NSEvent *)event
{
    NSPoint newCoordinates = event.locationInWindow;
    
    CGFloat deltaX = newCoordinates.x - self.originalMouseCoordinates.x;
    CGFloat deltaY = newCoordinates.y - self.originalMouseCoordinates.y;
    
    if (event.window != nil) {
        NSRect activeWindowFrame = event.window.frame;
        
        activeWindowFrame.origin.x += deltaX;
        activeWindowFrame.origin.y += deltaY;
        
        [event.window setFrame:activeWindowFrame
                       display:YES
                       animate:NO];
    }
}

- (void)drawOutlinesAndShadows
{
    [[NSColor colorWithCalibratedWhite:0.92
                                 alpha:1.0] setFill];
    
    NSRectFill(NSMakeRect(0.0, 0.0, self.frame.size.width, self.frame.size.height));
    
    [[NSColor blackColor] setStroke];
    
    NSBezierPath *titlebarOutline = [[NSBezierPath alloc] init];
    [titlebarOutline moveToPoint:NSMakePoint(0.5, 0.5)];
    [titlebarOutline lineToPoint:NSMakePoint(0.5, 18.5)];
    [titlebarOutline lineToPoint:NSMakePoint(self.frame.size.width - 0.5, 18.5)];
    [titlebarOutline lineToPoint:NSMakePoint(self.frame.size.width - 0.5, 0.5)];
    [titlebarOutline lineToPoint: NSMakePoint(0.5, 0.5)];
    [titlebarOutline stroke];
    
    [[NSColor colorWithCalibratedRed:0.76
                               green:0.76
                                blue:1.0
                               alpha:1.0] setStroke];
    
    NSBezierPath *titlebarHighlight = [[NSBezierPath alloc] init];
    [titlebarHighlight moveToPoint:NSMakePoint(1.5, 1.5)];
    [titlebarHighlight lineToPoint:NSMakePoint(1.5, 17.5)];
    [titlebarHighlight lineToPoint:NSMakePoint(self.frame.size.width - 1.5, 17.5)];
    [titlebarHighlight stroke];
    
    [[NSColor colorWithCalibratedRed:0.58
                              green:0.57
                               blue:0.80
                              alpha:1.0] setStroke];
    
    NSBezierPath *titlebarShadow = [[NSBezierPath alloc] init];
    [titlebarShadow moveToPoint:NSMakePoint(1.0, 1.5)];
    [titlebarShadow lineToPoint:NSMakePoint(self.frame.size.width - 1.5, 1.5)];
    [titlebarShadow lineToPoint:NSMakePoint(self.frame.size.width - 1.5, 17.5)];
    [titlebarShadow stroke];

}

- (void)drawTextureLines
{
    CGFloat textureLineStartPos = 0.0;
    
    [NSGraphicsContext saveGraphicsState];
    [[NSColor colorWithCalibratedWhite:0.38 alpha:1.0] setStroke];
    
    NSAffineTransform *textureTransform = [NSAffineTransform transform];
    [textureTransform translateXBy:2.5 yBy:4.5];
    [textureTransform concat];
    
    for (NSUInteger x = 0; x < 6; x++) {
        NSBezierPath *line = [[NSBezierPath alloc] init];
        [line moveToPoint:NSMakePoint(0.0, textureLineStartPos)];
        [line lineToPoint:NSMakePoint(self.frame.size.width - 3.5, textureLineStartPos)];
        [line stroke];
        
        textureLineStartPos += 2.0;
    }
    
    [NSGraphicsContext restoreGraphicsState];
}

- (void)drawTitleText
{
    [NSGraphicsContext saveGraphicsState];
    
    NSAffineTransform *titleTextTransform = [NSAffineTransform transform];
    [titleTextTransform translateXBy:2.0 yBy:0.0];
    [titleTextTransform concat];
    
    NSMutableParagraphStyle *titleStyle = [[NSMutableParagraphStyle alloc] init];
    [titleStyle setAlignment:NSTextAlignmentCenter];
    
    NSDictionary *fontAttributes = @{NSFontAttributeName: [NSFont boldSystemFontOfSize:11.0],
                                     NSParagraphStyleAttributeName: titleStyle};
    
    NSSize titleTextSize = [self.titleText sizeWithAttributes:fontAttributes];
    CGFloat textWidth = titleTextSize.width + 12.0;
    
    [[NSColor colorWithCalibratedWhite:0.92 alpha:1.0] setFill];
    NSRectFill(NSMakeRect(((self.frame.size.width - textWidth) / 2.0), 2.0, textWidth, 15.0));
    
    [[NSColor blackColor] setFill];
    
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:self.titleText attributes:fontAttributes];
    [title drawInRect:NSMakeRect(((self.frame.size.width - textWidth) / 2.0), 1.5, textWidth, 15.0)];
    
    [NSGraphicsContext restoreGraphicsState];
}

@end
