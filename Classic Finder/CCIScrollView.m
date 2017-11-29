//
//  CCIScrollView.m
//  Classic Scrolling2
//
//  Created by Ben Szymanski on 11/12/17.
//  Copyright © 2017 Ben Szymanski. All rights reserved.
//

#import "CCIScrollView.h"
#import "CCIScrollContentView.h"
#import "CCIScrollbar.h"
#import "CCIScrollbarArrowButton.h"
#import "CCIWindowGripButton.h"

@interface CCIScrollView()

@property (nonatomic) NSSize scrollableDistance;
@property (nonatomic) NSSize scrollIntervalSize;
@property (nonatomic) NSPoint currentScrollPosition;
@property (nonatomic) NSPoint currentScrollerBarPosition;

@property (nonatomic, strong) CCIScrollbar *horizontalScrollbar;
@property (nonatomic, strong) CCIScrollbar *verticalScrollbar;
@property (nonatomic, strong) CCIWindowGripButton *gripButton;

@end

@implementation CCIScrollView

#pragma mark - INITIALIZATION METHODS
- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    
    if (self) {
        // // Create content view
        NSRect contentViewFrame = NSMakeRect(0.0, 1.0, 400.0, 900.0);
        CCIScrollContentView *contentView = [[CCIScrollContentView alloc] initWithFrame:contentViewFrame];
        [self setContentView:contentView];
        [self addSubview:self.contentView];
        
        // // Calculate scroll travel distances
        CGFloat scrollableDistanceW = (contentViewFrame.size.width > frameRect.size.width) ? (contentViewFrame.size.width - frameRect.size.width + 14.0) : 0.0;
        CGFloat scrollableDistanceH = (contentViewFrame.size.height > frameRect.size.height) ? (contentViewFrame.size.height - frameRect.size.height + 14.0) : 0.0;
        
        NSSize scrollableDistance = NSMakeSize(scrollableDistanceW, scrollableDistanceH);
        [self setScrollableDistance:scrollableDistance];
        
        //
        NSPoint currentScrollPosition = NSMakePoint(0.0, 0.0);
        [self setCurrentScrollPosition:currentScrollPosition];
        
        //
        CGFloat leftButtonWidth = 14.0;
        CGFloat rightButtonWidth = 14.0;
        CGFloat scrollerMidWidth = (14.0/2.0);
        CGFloat combinedNegativeWidth = leftButtonWidth + rightButtonWidth + scrollerMidWidth;
        
        CGFloat horizontalScrollInterval = (contentViewFrame.size.width > frameRect.size.width) ? (round(contentViewFrame.size.width - combinedNegativeWidth)) : 0.0;
        
        CGFloat verticalScrollInterval = (contentViewFrame.size.height > frameRect.size.height) ? (contentViewFrame.size.height - frameRect.size.height) : 0.0;
        
        NSSize scrollIntervalSize = NSMakeSize(horizontalScrollInterval, verticalScrollInterval);
        [self setScrollIntervalSize:scrollIntervalSize];
        
        // // Create scrollbar controls
        CCIScrollbar *verticalScrollbar = [CCIScrollbar verticalScrollbarForScrollView:self
                                                                    withMaxContentSize:900.0];
        [self setVerticalScrollbar:verticalScrollbar];
        [self addSubview:verticalScrollbar];
        
        CCIScrollbar *horizontalScrollbar = [CCIScrollbar horizontalScrollbarForScrollView:self
                                                                        withMaxContentSize:300.0];
        [self setHorizontalScrollbar:horizontalScrollbar];
        [self addSubview:horizontalScrollbar];
        
        // // Create Grip button
        NSRect gripButtonFrame = NSMakeRect(self.frame.size.width - 14.0, self.frame.size.height - 14.0, 14.0, 14.0);
        CCIWindowGripButton *gripButton = [[CCIWindowGripButton alloc] initWithFrame:gripButtonFrame];
        [self setGripButton:gripButton];
        
        [self addSubview:gripButton];
        
        // // Init scroller positions
        NSPoint scrollerInitialPoints = NSMakePoint(0.0, 0.0);
        [self setCurrentScrollerBarPosition:scrollerInitialPoints];
    }
    
    return self;
}

#pragma mark - EVENT METHODS
- (void)performScrollAction:(id)sender
{
    CCIScrollbarArrowButton *clickedBtn = (CCIScrollbarArrowButton *)sender;
    ButtonDirectionality direction = clickedBtn.direction;
    
    if (direction == Up) {
        CGFloat newYPosition = self.currentScrollPosition.y + 50.0;
        newYPosition = (newYPosition < 0) ? newYPosition : 0.0;

        NSRect newFrame = NSMakeRect(self.currentScrollPosition.x, newYPosition, self.contentView.frame.size.width, self.contentView.frame.size.height);
        [self.contentView setFrame:newFrame];
        
        self.currentScrollPosition = NSMakePoint(self.currentScrollPosition.x, newYPosition);
        
        // Set scroller position
        
        CGFloat scrollbarTrackHeight = self.verticalScrollbar.frame.size.height - 14.0 - 14.0;
        
        // current scroll position * height of scrollbar track / max height of scrollable distance
        CGFloat step1 = (0 - self.currentScrollPosition.y) * scrollbarTrackHeight;
        CGFloat YPositionOfScroller = step1 / self.scrollableDistance.height;
        YPositionOfScroller = (YPositionOfScroller < 14.0) ? 14.0 : YPositionOfScroller + 14.0;
        
        self.currentScrollerBarPosition = NSMakePoint(self.currentScrollerBarPosition.x, YPositionOfScroller);
        
        [self.verticalScrollbar setScrollerYPosition:YPositionOfScroller];
        
    } else if (direction == Down) {
        CGFloat newYPosition = self.currentScrollPosition.y - 50.0;
        newYPosition = (newYPosition > (0 - self.scrollableDistance.height)) ? newYPosition : 0 - self.scrollableDistance.height;
        
        NSRect newFrame = NSMakeRect(self.currentScrollPosition.x, newYPosition, self.contentView.frame.size.width, self.contentView.frame.size.height);
        [self.contentView setFrame:newFrame];
        
        self.currentScrollPosition = NSMakePoint(self.currentScrollPosition.x, newYPosition);
        
        // Set scroller position
        
        CGFloat scrollbarTrackHeight = self.verticalScrollbar.frame.size.height - 14.0 - 14.0;
        
        // current scroll position * height of scrollbar track / max height of scrollable distance
        CGFloat step1 = (0 - self.currentScrollPosition.y) * scrollbarTrackHeight;
        CGFloat YPositionOfScroller = step1 / self.scrollableDistance.height;
        YPositionOfScroller = (YPositionOfScroller >= scrollbarTrackHeight - 16.0) ? (scrollbarTrackHeight - 16.0) + 14.0 : YPositionOfScroller + 14.0;
        
        self.currentScrollerBarPosition = NSMakePoint(self.currentScrollerBarPosition.x, YPositionOfScroller);
        
        [self.verticalScrollbar setScrollerYPosition:YPositionOfScroller];
    } else if (direction == Left) {
        CGFloat newXPosition = self.currentScrollPosition.x + 50.0;
        newXPosition = (newXPosition < 0) ? newXPosition : 0.0;
        
        NSRect newFrame = NSMakeRect(newXPosition, self.currentScrollPosition.y, self.contentView.frame.size.width, self.contentView.frame.size.height);
        [self.contentView setFrame:newFrame];
        
        self.currentScrollPosition = NSMakePoint(newXPosition, self.currentScrollPosition.y);
        
        // Set scroller position
        
        CGFloat scrollbarTrackWidth = self.horizontalScrollbar.frame.size.width - 14.0 - 14.0;
        
        // current scroll position * height of scrollbar track / max height of scrollable distance
        CGFloat step1 = (0 - self.currentScrollPosition.x) * scrollbarTrackWidth;
        CGFloat XPositionOfScroller = step1 / self.scrollableDistance.width;
        XPositionOfScroller = (XPositionOfScroller < 14.0) ? 14.0 : XPositionOfScroller + 14.0;
        
        self.currentScrollerBarPosition = NSMakePoint(XPositionOfScroller, self.currentScrollerBarPosition.y);
        
        [self.horizontalScrollbar setScrollerXPosition:XPositionOfScroller];
    } else if (direction == Right) {
        CGFloat newXPosition = self.currentScrollPosition.x - 50.0;
        newXPosition = (newXPosition > (0 - self.scrollableDistance.width)) ? newXPosition : (0 - self.scrollableDistance.width);
        
        NSRect newFrame = NSMakeRect(newXPosition, self.currentScrollPosition.y, self.contentView.frame.size.width, self.contentView.frame.size.height);
        [self.contentView setFrame:newFrame];
        
        self.currentScrollPosition = NSMakePoint(newXPosition, self.currentScrollPosition.y);
        
        
        // Set scroller position
        
        CGFloat scrollbarTrackWidth = self.horizontalScrollbar.frame.size.width - 14.0 - 14.0;
        
        // current scroll position * height of scrollbar track / max height of scrollable distance
        CGFloat step1 = (0 - self.currentScrollPosition.x) * scrollbarTrackWidth;
        CGFloat XPositionOfScroller = step1 / self.scrollableDistance.width;
        XPositionOfScroller = (XPositionOfScroller >= (scrollbarTrackWidth - 16.0)) ? ((scrollbarTrackWidth - 16.0) + 14.0) : (XPositionOfScroller + 14.0);
        
        self.currentScrollerBarPosition = NSMakePoint(XPositionOfScroller, self.currentScrollerBarPosition.y);
        
        [self.horizontalScrollbar setScrollerXPosition:XPositionOfScroller];
    }
}

#pragma mark - DRAWING METHODS
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    NSColor *backgroundColor = [NSColor whiteColor];
    [backgroundColor setFill];
    
    NSRectFill(self.frame);
    
    NSColor *strokeColor = [NSColor blackColor];
    [strokeColor setStroke];
    
    NSBezierPath *topBorder = [[NSBezierPath alloc] init];
    [topBorder moveToPoint:NSMakePoint(0.0, 0.0)];
    [topBorder lineToPoint:NSMakePoint(self.frame.size.width, 0.0)];
    
    [topBorder stroke];
}

- (BOOL)isFlipped
{
    return YES;
}

@end
