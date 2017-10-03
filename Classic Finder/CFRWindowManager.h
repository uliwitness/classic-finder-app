//
//  CFRWindowManager.h
//  Classic Finder
//
//  Created by Ben Szymanski on 3/25/17.
//  Copyright © 2017 Protype Software Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@class CCIClassicFinderWindow;

@interface CFRWindowManager : NSObject <NSWindowDelegate>

+(CFRWindowManager *)sharedInstance;

- (CCIClassicFinderWindow *)createWindowForPath:(NSURL *)path;

@end
