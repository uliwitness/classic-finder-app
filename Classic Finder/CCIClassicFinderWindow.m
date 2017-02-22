//
//  CCIClassicFinderWindow.m
//  Classic Finder
//
//  Created by Ben Szymanski on 2/19/17.
//  Copyright © 2017 Protype Software Ltd. All rights reserved.
//

#import "CCIClassicFinderWindow.h"
#import "CCIClassicContentView.h"
#import "CCITitleBar.h"
#import "CCIClassicFinderDetailBar.h"
#import "CCIClassicScrollView.h"
#import "CCIClassicFolder.h"

@interface CCIClassicFinderWindow ()

@property (nonatomic, copy) NSURL *windowDirectory;
@property (nonatomic, copy) NSString *windowDirectoryName;
@property (nonatomic, copy) NSArray *fileList;
@property (nonatomic, strong) NSMutableArray *folderObjets;

@property (nonatomic, strong) CCITitleBar *titlebar;
@property (nonatomic, strong) CCIClassicFinderDetailBar *detailBar;
@property (nonatomic, strong) CCIClassicScrollView *scrollView;

@end

@implementation CCIClassicFinderWindow

- (instancetype)initWithContentRect:(NSRect)contentRect
                          styleMask:(NSWindowStyleMask)style
                            backing:(NSBackingStoreType)bufferingType
                              defer:(BOOL)flag
{
    self = [super initWithContentRect:contentRect
                            styleMask:style
                              backing:bufferingType
                                defer:flag];
    
    if (self) {
        self.windowDirectory = [NSURL URLWithString:@"/Users/bszyman/Downloads"];
        self.windowDirectoryName = [self.windowDirectory lastPathComponent];
        
        self.fileList = [self getDirectoryListing];
        self.folderObjets = [[NSMutableArray alloc] init];
        
        self.contentView = [[CCIClassicContentView alloc] initWithFrame:self.frame];
        
        NSRect contentArea = [self.contentView contentArea];
        NSRect titlebarFrame = NSMakeRect(0.0,
                                          0.0,
                                          contentArea.size.width,
                                          19.0);
        
        self.titlebar = [[CCITitleBar alloc] initWithFrame:titlebarFrame];
        self.titlebar.titleText = self.windowDirectoryName;
        
        [self.contentView addSubview:self.titlebar];
        
        NSRect detailFrame = NSMakeRect(0.0, 19.0, contentArea.size.width, 24.0);
        self.detailBar = [[CCIClassicFinderDetailBar alloc] initWithFrame:detailFrame];
        [self.detailBar setNumberOfFileItemsText:self.fileList.count];
        [self.contentView addSubview:self.detailBar];
        
        
        NSRect scrollViewFrame = NSMakeRect(0.0,
                                            38.0,
                                            self.frame.size.width - 1.0,
                                            self.frame.size.height - 38.0 - 1.0);
        
        self.scrollView = [[CCIClassicScrollView alloc] initWithFrame:scrollViewFrame];
        
        [self.contentView addSubview:self.scrollView];
        
//        CCIClassicFolder *folderIcon = [[CCIClassicFolder alloc] initWithFrame:NSMakeRect(25.0, 15.0, 55.0, 55.0)];
//        [self.scrollView addSubview:folderIcon];
//        
//        CCIClassicFolder *selectedFolderIcon = [[CCIClassicFolder alloc] initWithFrame:NSMakeRect(81.0, 15.0, 55.0, 55.0)];
//        [selectedFolderIcon selectFolder];
//        [self.scrollView addSubview:selectedFolderIcon];
        
        NSUInteger iconRow = 0;
        NSUInteger iconCol = 0;
        
        NSView *scrollViewContentView = [[NSView alloc] initWithFrame:NSMakeRect(0.0, 0.0, 300.0, 300.0)];
        
        for (NSUInteger x = 0; x < self.fileList.count; x++) {
            NSURL *directoryItem = [self.fileList objectAtIndex:x];
            NSString *directoryTitle = [directoryItem lastPathComponent];
            
            CGFloat iconLeftPosition = (10.0 + (iconCol * 60.0));
            CGFloat frameWidthWithBorder = (self.frame.size.width - 55.0);
            if (iconLeftPosition > frameWidthWithBorder) {
                iconRow += 1;
                iconCol = 0;
                iconLeftPosition = (10.0 + (iconCol * 60.0));
            }
            
            CGFloat iconTopPosition = 15.0 + (iconRow * 60.0);
            
            CGRect folderFrame = NSMakeRect(iconLeftPosition,
                                            iconTopPosition,
                                            55.0,
                                            60.0);
            
            CCIClassicFolder *folderIcon = [[CCIClassicFolder alloc] initWithFrame:folderFrame];
            folderIcon.folderLabel.stringValue = directoryTitle;
            
            [scrollViewContentView addSubview:folderIcon];
            iconCol += 1;
        }
        
        
        
        [self.scrollView addSubview:scrollViewContentView];
        
    }
    
    return self;
}

- (NSArray *)getDirectoryListing
{
    NSArray *fileList;
    NSArray *keys = @[NSURLNameKey, NSURLPathKey];
    NSError *err = nil;
    
    fileList = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:self.windowDirectory
                                             includingPropertiesForKeys:keys
                                                                options:(NSDirectoryEnumerationSkipsPackageDescendants |
                                                                         NSDirectoryEnumerationSkipsHiddenFiles |
                                                                         NSDirectoryEnumerationSkipsSubdirectoryDescendants)
                                                                  error:&err];
    
    if (err != nil) {
        NSLog(@"%@", err);
    }
    
    return fileList;
}

- (BOOL)canBecomeKeyWindow
{
    return YES;
}

- (BOOL)canBecomeMainWindow
{
    return YES;
}

@end
