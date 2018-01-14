//
//  CFRFloppyDisk.m
//  Classic Finder
//
//  Created by Ben Szymanski on 1/14/18.
//  Copyright © 2018 Protype Software Ltd. All rights reserved.
//

#import "CFRFloppyDisk.h"
#import <sqlite3.h>

@interface CFRFloppyDisk() {
    
}

@end

@implementation CFRFloppyDisk

#pragma mark - INITIALIZATION METHODS
- (instancetype)init
{
    self = [super init];
    
    if (self) {
        [self openDatabase];
        [self initializeDatabaseStructure];
    }
    
    return self;
}

- (void)dealloc
{
    [self closeDatabase];
}

- (void)initializeDatabaseStructure
{
    if (![self hasGeneralTable]) {
        [self createGeneralTable];
    }
    
    if (![self hasUniqueIDField]) {
        [self createUniqueIDField];
    }
    
    if (![self hasObjectPathField]) {
        [self createObjectPathField];
    }
    
    if (![self hasCreationDateField]) {
        [self createCreationDateField];
    }
    
    if (![self hasLastModifiedField]) {
        [self createLastModifiedField];
    }
    
    if (![self hasTitleField]) {
        [self createTitleField];
    }
    
    if (![self hasWindowPositionXField]) {
        [self createWindowPositionXField];
    }
    
    if (![self hasWindowPositionYField]) {
        [self createWindowPositionYField];
    }
    
    if (![self hasIconPositionXField]) {
        [self createIconPositionXField];
    }
    
    if (![self hasIconPositionYField]) {
        [self createIconPositionYField];
    }
    
    if (![self hasWindowDimensionWidthField]) {
        [self createWindowDimensionWidthField];
    }
    
    if (![self hasWindowDimensionHeightField]) {
        [self createWindowDimensionHeightField];
    }
}

#pragma mark - SQLLITE CONNECTION METHODS

- (void)openDatabase
{
    
}

- (void)closeDatabase
{
    
}

#pragma mark - DATABASE STRUCTURE METHODS

- (BOOL)hasGeneralTable
{
    return NO;
}

- (void)createGeneralTable
{
    
}

- (BOOL)hasUniqueIDField
{
    return NO;
}

- (void)createUniqueIDField
{
    
}

- (BOOL)hasObjectPathField
{
    return NO;
}

- (void)createObjectPathField
{
    
}

- (BOOL)hasCreationDateField
{
    return NO;
}

- (void)createCreationDateField
{
    
}

- (BOOL)hasLastModifiedField
{
    return NO;
}

- (void)createLastModifiedField
{
    
}

- (BOOL)hasTitleField
{
    return NO;
}

- (void)createTitleField
{
    
}

- (BOOL)hasWindowPositionXField
{
    return NO;
}

- (void)createWindowPositionXField
{
    
}

- (BOOL)hasWindowPositionYField
{
    return NO;
}

- (void)createWindowPositionYField
{

}

- (BOOL)hasWindowDimensionWidthField
{
    return NO;
}

- (void)createWindowDimensionWidthField
{
    
}

- (BOOL)hasWindowDimensionHeightField
{
    return NO;
}

- (void)createWindowDimensionHeightField
{
    
}

- (BOOL)hasIconPositionXField
{
    return NO;
}

- (void)createIconPositionXField
{
    
}

- (BOOL)hasIconPositionYField
{
    return NO;
}

- (void)createIconPositionYField
{
    
}

#pragma mark - DATA OPERATION METHODS

- (void)saveWindowPosition:(NSPoint)newPosition
{
   
}

- (void)saveIconPosition:(NSPoint)newPosition
{
    
}

@end
