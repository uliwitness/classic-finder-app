//
//  CCIClassicFinderWindow.h
//  Classic Finder
//
//  Created by Ben Szymanski on 2/19/17.
//  Copyright © 2017 Protype Software Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CCIClassicFinderWindow : NSWindow

@property (nonatomic, copy) NSString* windowTitle;
@property (nonatomic, copy) NSArray* fileList;

- (instancetype)initWithContentRect:(NSRect)contentRect
                          styleMask:(NSWindowStyleMask)style
                            backing:(NSBackingStoreType)bufferingType
                              defer:(BOOL)flag
                    withWindowTitle:(NSString *)windowTitle
                        andFileList:(NSArray *)fileList;

@end
