//
//  CCIApplicationStyles.m
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

#import "CCIApplicationStyles.h"

@interface CCIApplicationStyles()
{
    NSColor *whiteColor;
    NSColor *blackColor;
    NSColor *darkPurpleColor;
    NSColor *midPurpleColor;
    NSColor *lightPurpleColor;
    NSColor *darkGrayColor;
    NSColor *midGrayColor;
    NSColor *lightGrayColor;
    NSColor *clickedMidGrayColor;
    NSColor *clickedDarkPurpleColor;
    NSColor *clickedLightPurpleColor;
    NSColor *folderShadowColor;
    NSColor *folderSelectedHighlightColor;
    NSColor *folderSelectedShadowColor;
    NSColor *folderOpenedBackgroundColor;
    NSColor *folderOpenedAndSelectedBackgroundColor;
}

@end

@implementation CCIApplicationStyles

#pragma mark - INITIALIZATION

+ (instancetype)instance
{
    static CCIApplicationStyles *styleStore = nil;
    static dispatch_once_t initOneTimeToken;
    
    dispatch_once(&initOneTimeToken, ^{
        styleStore = [[self alloc] initHidden];
    });
    
    return styleStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton Init Warning"
                                   reason:@"Use +[instance]"
                                 userInfo:nil];
    
    return nil;
}

- (instancetype)initHidden
{
    self = [super init];
    
    if (self) { }
    
    return self;
}

#pragma mark - GENERAL COLORS

- (NSColor *)whiteColor
{
    if (whiteColor == nil) {
        whiteColor = [NSColor colorWithWhite:1.0 alpha:1.0];
    }
    
    return whiteColor;
}

- (NSColor *)blackColor
{
    if (blackColor == nil) {
        blackColor = [NSColor colorWithWhite:0.0 alpha:1.0];
    }
    
    return blackColor;
}

- (NSColor *)darkPurpleColor
{
    if (darkPurpleColor == nil) {
        darkPurpleColor = [NSColor colorWithCalibratedRed:0.15
                                                    green:0.14
                                                     blue:0.31
                                                    alpha:1.0];
    }
    
    return darkPurpleColor;
}

- (NSColor *)midPurpleColor
{
    if (midPurpleColor == nil) {
        midPurpleColor = [NSColor colorWithCalibratedRed:0.58
                                                   green:0.57
                                                    blue:0.80
                                                   alpha:1.0];
    }
    
    return midPurpleColor;
}

- (NSColor *)lightPurpleColor
{
    if (lightPurpleColor == nil) {
        lightPurpleColor = [NSColor colorWithCalibratedRed:0.76
                                                     green:0.76
                                                      blue:1.0
                                                     alpha:1.0];
    }
    
    return lightPurpleColor;
}

- (NSColor *)darkGrayColor
{
    if (darkGrayColor == nil) {
        darkGrayColor = [NSColor colorWithCalibratedWhite:0.38
                                                   alpha:1.0];
    }
    
    return darkGrayColor;
}

- (NSColor *)midGrayColor
{
    if (midGrayColor == nil) {
        midGrayColor = [NSColor colorWithCalibratedWhite:0.58
                                                     alpha:1.0];
    }
    
    return midGrayColor;
}

- (NSColor *)lightGrayColor
{
    if (lightGrayColor == nil) {
        lightGrayColor = [NSColor colorWithCalibratedWhite:0.92
                                                     alpha:1.0];
    }
    
    return lightGrayColor;
}

#pragma mark - GENERAL CLICKED COLORS

- (NSColor *)clickedMidGrayColor
{
    if (clickedMidGrayColor == nil) {
        clickedMidGrayColor = [NSColor colorWithCalibratedWhite:0.45
                                                          alpha:1.0];
    }
    
    return clickedMidGrayColor;
}

- (NSColor *)clickedDarkPurpleColor
{
    if (clickedDarkPurpleColor == nil) {
        clickedDarkPurpleColor = [NSColor colorWithCalibratedRed:0.14
                                                           green:0.13
                                                            blue:0.30
                                                           alpha:1.0];
    }
    
    return clickedDarkPurpleColor;
}

- (NSColor *)clickedLightPurpleColor
{
    if (clickedLightPurpleColor == nil) {
        clickedLightPurpleColor = [NSColor colorWithCalibratedRed:0.70
                                                            green:0.70
                                                             blue:0.96
                                                            alpha:1.0];
    }
    
    return clickedLightPurpleColor;
}

#pragma mark - FOLDER ICON COLORS

- (NSColor *)folderShadowColor
{
    if (clickedLightPurpleColor == nil) {
        clickedLightPurpleColor = [NSColor colorWithCalibratedRed:0.70
                                                            green:0.70
                                                             blue:0.96
                                                            alpha:1.0];
    }
    
    return clickedLightPurpleColor;
}

- (NSColor *)folderSelectedHighlightColor
{
    if (folderSelectedHighlightColor == nil) {
        folderSelectedHighlightColor = [NSColor colorWithCalibratedRed:0.41
                                                                 green:0.41
                                                                  blue:0.41
                                                                 alpha:1.0];
    }
    
    return folderSelectedHighlightColor;
}

- (NSColor *)folderSelectedShadowColor
{
    if (folderSelectedShadowColor == nil) {
        folderSelectedShadowColor = [NSColor colorWithCalibratedRed:0.10
                                                              green:0.07
                                                               blue:0.41
                                                              alpha:1.0];
    }
    
    return folderSelectedShadowColor;
}

- (NSColor *)folderOpenedBackgroundColor
{
    if (folderOpenedBackgroundColor == nil) {
        folderOpenedBackgroundColor = [NSColor colorWithCalibratedRed:0.77
                                                                green:0.77
                                                                 blue:0.95
                                                                alpha:1.0];
    }
    
    return folderOpenedBackgroundColor;
}

- (NSColor *)folderOpenedAndSelectedBackgroundColor
{
    if (folderOpenedAndSelectedBackgroundColor == nil) {
        folderOpenedAndSelectedBackgroundColor = [NSColor colorWithCalibratedRed:0.19
                                                                           green:0.19
                                                                            blue:0.48
                                                                           alpha:1.00];
    }
    
    return folderOpenedAndSelectedBackgroundColor;
}


@end
