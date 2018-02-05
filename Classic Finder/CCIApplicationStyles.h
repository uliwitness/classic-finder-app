//
//  CCIApplicationStyles.h
//  Classic Finder
//
//  Created by Ben Szymanski on 12/2/17.
//  Copyright © 2017 Protype Software Ltd. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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
