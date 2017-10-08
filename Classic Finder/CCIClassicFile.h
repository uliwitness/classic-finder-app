//
//  CCIClassicFile.h
//  Classic Finder
//
//  Created by Ben Szymanski on 10/4/17.
//  Copyright © 2017 Protype Software Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CCIFinderIconProtocol.h"

@interface CCIClassicFile : NSControl <CCIFinderIconProtocol>

@property (nonatomic, copy) NSURL *representedFile;
@property (nonatomic, strong) NSTextField *fileLabel;

- (void)selectItem;
- (void)deselectItem;

@end
