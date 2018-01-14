//
//  CFRFloppyDisk.h
//  Classic Finder
//
//  Created by Ben Szymanski on 1/14/18.
//  Copyright © 2018 Protype Software Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFRFloppyDisk : NSObject

- (instancetype)init;

- (void)saveWindowPosition:(NSPoint)newPosition;
- (void)saveIconPosition:(NSPoint)newPosition;

@end
