//
//  CCIApplicationStyles.h
//  Classic Finder
//
//  Created by Ben Szymanski on 12/2/17.
//  Copyright © 2017 Protype Software Ltd. All rights reserved.
//
//
// This file is part of Classic Finder.
//
// Classic Finder is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Classic Finder is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Classic Finder.  If not, see <http://www.gnu.org/licenses/>.

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface CCIApplicationStyles : NSObject

+ (instancetype)instance;

- (NSColor *)whiteColor;
- (NSColor *)blackColor;

- (NSColor *)darkPurpleColor;
- (NSColor *)midPurpleColor;
- (NSColor *)lightPurpleColor;

- (NSColor *)darkGrayColor;
- (NSColor *)midGrayColor;
- (NSColor *)lightGrayColor;

- (NSColor *)clickedMidGrayColor;
- (NSColor *)clickedDarkPurpleColor;
- (NSColor *)clickedLightPurpleColor;

- (NSColor *)folderShadowColor;
- (NSColor *)folderSelectedHighlightColor;
- (NSColor *)folderSelectedShadowColor;
- (NSColor *)folderOpenedBackgroundColor;
- (NSColor *)folderOpenedAndSelectedBackgroundColor;

@end
