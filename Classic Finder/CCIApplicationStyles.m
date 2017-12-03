//
//  CCIApplicationStyles.m
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

#import "CCIApplicationStyles.h"

@interface CCIApplicationStyles()
{
    NSColor *darkPurpleColor;
    NSColor *lightPurpleColor;
    NSColor *midGrayColor;
    NSColor *lightGrayColor;
    NSColor *clickedMidGrayColor;
    NSColor *clickedDarkPurpleColor;
    NSColor *clickedLightPurpleColor;
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
    
    if (self) {

    }
    
    return self;
}

#pragma mark - GENERAL COLORS

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

- (NSColor *)midGrayColor;
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

@end
