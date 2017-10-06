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
#import "CCIClassicScrollContentView.h"
#import "CCIClassicFolder.h"
#import "CCIClassicFile.h"
#import "CFRWindowManager.h"
#import "CFRFileSystemOperations.h"

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
                    atDirectoryPath: (NSString *)directoryPath
{
    self = [super initWithContentRect:contentRect
                            styleMask:style
                              backing:bufferingType
                                defer:flag];
    
    if (self) {
        self.directoryPath = directoryPath;
        self.windowDirectory = [NSURL URLWithString:[self.directoryPath stringByStandardizingPath]];
        self.windowDirectoryName = [self.windowDirectory lastPathComponent];
        
        self.fileList = [CFRFileSystemOperations getListingForDirectory:self.windowDirectory];
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
        
        CCIClassicScrollContentView *scrollViewContentView = [[CCIClassicScrollContentView alloc] initWithFrame:NSMakeRect(0.0, 0.0, self.frame.size.width, self.frame.size.height)];
        
        for (NSUInteger x = 0; x < self.fileList.count; x++) {
            NSURL *directoryItem = [self.fileList objectAtIndex:x];
            
            NSNumber *isDirectory;
            [directoryItem getResourceValue:&isDirectory
                                     forKey:NSURLIsDirectoryKey
                                      error:nil];
            
            if ([isDirectory boolValue])
            {
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
                folderIcon.representingDirectory = directoryItem;
                
                [scrollViewContentView addSubview:folderIcon];
            } else {
                NSString *fileTitle = [directoryItem lastPathComponent];
                
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
                
                CCIClassicFile *fileIcon = [[CCIClassicFile alloc] initWithFrame:folderFrame];
                fileIcon.fileLabel.stringValue = fileTitle;
                fileIcon.representedFile = directoryItem;
                
                [scrollViewContentView addSubview:fileIcon];
                
            }
            
            
            iconCol += 1;
        }
        
        [self.scrollView addSubview:scrollViewContentView];
    }
    
    return self;
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
