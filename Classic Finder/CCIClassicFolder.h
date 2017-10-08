//
//  CCIClassicFolder.h
//  Classic Finder
//
//  Created by Ben Szymanski on 2/19/17.
//  Copyright © 2017 Protype Software Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CCIFinderIconProtocol.h"

@interface CCIClassicFolder : NSControl <CCIFinderIconProtocol>

@property (nonatomic, copy) NSURL *representingDirectory;
@property (nonatomic, strong) NSTextField *folderLabel;

- (void)selectItem;
- (void)deselectItem;

@end
