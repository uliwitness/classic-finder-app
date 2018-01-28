//
//  CFRFloppyDisk.m
//  Classic Finder
//
//  Created by Ben Szymanski on 1/14/18.
//  Copyright © 2018 Ben Szymanski. All rights reserved.
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

#import "CFRFloppyDisk.h"
#import "CFRFileSystemUtils.h"
#import <sqlite3.h>

@interface CFRFloppyDisk() {
    sqlite3 *dbConnection;
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
    if (![self hasFinderSpatialsTable]) {
        [self createFinderSpatialsTable];
    }
    
//    if (![self hasUniqueIDField]) {
//        [self createUniqueIDField];
//    }
    
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

- (BOOL)openDatabase
{
    NSString *applicationSupportDirectory = [CFRFileSystemUtils applicationSupportDirectory];
    NSString *databasePath = [applicationSupportDirectory stringByAppendingString:@"cfdb.sqlite"];
    
    sqlite3_initialize();
    
    BOOL openDatabaseResult = sqlite3_open([databasePath UTF8String],
                                           &dbConnection);
    
    return openDatabaseResult;
}

- (void)closeDatabase
{
    sqlite3_close(dbConnection);
    sqlite3_shutdown();
}

#pragma mark - DATABASE STRUCTURE METHODS

- (BOOL)hasFinderSpatialsTable
{
    return NO;
}

- (void)createFinderSpatialsTable
{
    NSString *sqlStatementString = @"CREATE TABLE IF NOT EXISTS finder_spatials (dirID text PRIMARY KEY)";
    const char *sqlStatement = [sqlStatementString cStringUsingEncoding:NSUTF8StringEncoding];
    sqlite3_stmt *sqlStatementPrepared;
    
    int result = sqlite3_prepare(dbConnection, sqlStatement, -1, &sqlStatementPrepared, 0);
    
    if (result != SQLITE_OK) {
        
    } else {
        sqlite3_step(sqlStatementPrepared);
    }
}

//- (BOOL)hasUniqueIDField
//{
//    return NO;
//}
//
//- (void)createUniqueIDField
//{
//
//}

- (BOOL)hasObjectPathField
{
    BOOL queryFinding = NO;
    NSString *columnName = @"path_field";
    
    queryFinding = [self determineIfColumnExists:columnName];
    
    return queryFinding;
}

- (void)createObjectPathField
{
    NSString *sqlStatementString = @"ALTER TABLE finder_spatials ADD COLUMN path_field text";
    const char *sqlStatement = [sqlStatementString cStringUsingEncoding:NSUTF8StringEncoding];
    sqlite3_stmt *sqlStatementPrepared;
    
    int result = sqlite3_prepare(dbConnection, sqlStatement, -1, &sqlStatementPrepared, 0);
    
    if (result != SQLITE_OK) {
        
    } else {
        sqlite3_step(sqlStatementPrepared);
    }
}

- (BOOL)hasCreationDateField
{
    BOOL queryFinding = NO;
    NSString *columnName = @"create_date";
    
    queryFinding = [self determineIfColumnExists:columnName];
    
    return queryFinding;
}

- (void)createCreationDateField
{
    NSString *sqlStatementString = @"ALTER TABLE finder_spatials ADD COLUMN create_date integer";
    const char *sqlStatement = [sqlStatementString cStringUsingEncoding:NSUTF8StringEncoding];
    sqlite3_stmt *sqlStatementPrepared;
    
    int result = sqlite3_prepare(dbConnection, sqlStatement, -1, &sqlStatementPrepared, 0);
    
    if (result != SQLITE_OK) {
        
    } else {
        sqlite3_step(sqlStatementPrepared);
    }
}

- (BOOL)hasLastModifiedField
{
    BOOL queryFinding = NO;
    NSString *columnName = @"last_update";
    
    queryFinding = [self determineIfColumnExists:columnName];
    
    return queryFinding;
}

- (void)createLastModifiedField
{
    NSString *sqlStatementString = @"ALTER TABLE finder_spatials ADD COLUMN last_update integer";
    const char *sqlStatement = [sqlStatementString cStringUsingEncoding:NSUTF8StringEncoding];
    sqlite3_stmt *sqlStatementPrepared;
    
    int result = sqlite3_prepare(dbConnection, sqlStatement, -1, &sqlStatementPrepared, 0);
    
    if (result != SQLITE_OK) {
        
    } else {
        sqlite3_step(sqlStatementPrepared);
    }
}

- (BOOL)hasTitleField
{
    BOOL queryFinding = NO;
    NSString *columnName = @"title";
    
    queryFinding = [self determineIfColumnExists:columnName];
    
    return queryFinding;
}

- (void)createTitleField
{
    NSString *sqlStatementString = @"ALTER TABLE finder_spatials ADD COLUMN title text";
    const char *sqlStatement = [sqlStatementString cStringUsingEncoding:NSUTF8StringEncoding];
    sqlite3_stmt *sqlStatementPrepared;
    
    int result = sqlite3_prepare(dbConnection, sqlStatement, -1, &sqlStatementPrepared, 0);
    
    if (result != SQLITE_OK) {
        
    } else {
        sqlite3_step(sqlStatementPrepared);
    }
}

- (BOOL)hasWindowPositionXField
{
    BOOL queryFinding = NO;
    NSString *columnName = @"window_pos_x";
    
    queryFinding = [self determineIfColumnExists:columnName];
    
    return queryFinding;
}

- (void)createWindowPositionXField
{
    NSString *sqlStatementString = @"ALTER TABLE finder_spatials ADD COLUMN window_pos_x integer";
    const char *sqlStatement = [sqlStatementString cStringUsingEncoding:NSUTF8StringEncoding];
    sqlite3_stmt *sqlStatementPrepared;
    
    int result = sqlite3_prepare(dbConnection, sqlStatement, -1, &sqlStatementPrepared, 0);
    
    if (result != SQLITE_OK) {
        
    } else {
        sqlite3_step(sqlStatementPrepared);
    }
}

- (BOOL)hasWindowPositionYField
{
    BOOL queryFinding = NO;
    NSString *columnName = @"window_pos_y";
    
    queryFinding = [self determineIfColumnExists:columnName];
    
    return queryFinding;
}

- (void)createWindowPositionYField
{
    NSString *sqlStatementString = @"ALTER TABLE finder_spatials ADD COLUMN window_pos_y integer";
    const char *sqlStatement = [sqlStatementString cStringUsingEncoding:NSUTF8StringEncoding];
    sqlite3_stmt *sqlStatementPrepared;
    
    int result = sqlite3_prepare(dbConnection, sqlStatement, -1, &sqlStatementPrepared, 0);
    
    if (result != SQLITE_OK) {
        
    } else {
        sqlite3_step(sqlStatementPrepared);
    }
}

- (BOOL)hasWindowDimensionWidthField
{
    BOOL queryFinding = NO;
    NSString *columnName = @"window_w";
    
    queryFinding = [self determineIfColumnExists:columnName];
    
    return queryFinding;
}

- (void)createWindowDimensionWidthField
{
    NSString *sqlStatementString = @"ALTER TABLE finder_spatials ADD COLUMN window_w integer";
    const char *sqlStatement = [sqlStatementString cStringUsingEncoding:NSUTF8StringEncoding];
    sqlite3_stmt *sqlStatementPrepared;
    
    int result = sqlite3_prepare(dbConnection, sqlStatement, -1, &sqlStatementPrepared, 0);
    
    if (result != SQLITE_OK) {
        
    } else {
        sqlite3_step(sqlStatementPrepared);
    }
}

- (BOOL)hasWindowDimensionHeightField
{
    BOOL queryFinding = NO;
    NSString *columnName = @"window_h";
    
    queryFinding = [self determineIfColumnExists:columnName];
    
    return queryFinding;
}

- (void)createWindowDimensionHeightField
{
    NSString *sqlStatementString = @"ALTER TABLE finder_spatials ADD COLUMN window_h integer";
    const char *sqlStatement = [sqlStatementString cStringUsingEncoding:NSUTF8StringEncoding];
    sqlite3_stmt *sqlStatementPrepared;
    
    int result = sqlite3_prepare(dbConnection, sqlStatement, -1, &sqlStatementPrepared, 0);
    
    if (result != SQLITE_OK) {
        
    } else {
        sqlite3_step(sqlStatementPrepared);
    }
}

- (BOOL)hasIconPositionXField
{
    BOOL queryFinding = NO;
    NSString *columnName = @"icon_pos_x";
    
    queryFinding = [self determineIfColumnExists:columnName];
    
    return queryFinding;
}

- (void)createIconPositionXField
{
    NSString *sqlStatementString = @"ALTER TABLE finder_spatials ADD COLUMN icon_pos_x integer";
    const char *sqlStatement = [sqlStatementString cStringUsingEncoding:NSUTF8StringEncoding];
    sqlite3_stmt *sqlStatementPrepared;
    
    int result = sqlite3_prepare(dbConnection, sqlStatement, -1, &sqlStatementPrepared, 0);
    
    if (result != SQLITE_OK) {
        
    } else {
        sqlite3_step(sqlStatementPrepared);
    }
}

- (BOOL)hasIconPositionYField
{
    BOOL queryFinding = NO;
    NSString *columnName = @"icon_pos_y";
    
    queryFinding = [self determineIfColumnExists:columnName];
    
    return queryFinding;
}

- (void)createIconPositionYField
{
    NSString *sqlStatementString = @"ALTER TABLE finder_spatials ADD COLUMN icon_pos_y integer";
    const char *sqlStatement = [sqlStatementString cStringUsingEncoding:NSUTF8StringEncoding];
    sqlite3_stmt *sqlStatementPrepared;
    
    int result = sqlite3_prepare(dbConnection, sqlStatement, -1, &sqlStatementPrepared, 0);
    
    if (result != SQLITE_OK) {
        
    } else {
        sqlite3_step(sqlStatementPrepared);
    }
}

- (BOOL)determineIfColumnExists:(NSString *)columnTitle
{
    BOOL queryFinding = NO;
    
    NSString *sqlStatementString = @"PRAGMA table_info(finder_spatials)";
    const char *sqlStatement = [sqlStatementString cStringUsingEncoding:NSUTF8StringEncoding];
    sqlite3_stmt *sqlStatementPrepared;
    
    int result = sqlite3_prepare(dbConnection, sqlStatement, -1, &sqlStatementPrepared, 0);
    
    if (result != SQLITE_OK) {
        queryFinding = NO;
    } else {
        const char *columnTitleConverted = [columnTitle cStringUsingEncoding:NSUTF8StringEncoding];
        
        while (sqlite3_step(sqlStatementPrepared) == SQLITE_ROW) {
            const unsigned char *columnTitleAsUnsigned = sqlite3_column_text(sqlStatementPrepared, 1);
            char *columnTitleTest = (char *)columnTitleAsUnsigned;
            
            if (strcmp(columnTitleConverted, columnTitleTest)) {
                queryFinding = YES;
                break;
            } else {
                queryFinding = NO;
            }
        }
    }
    
    return queryFinding;
}

#pragma mark - DATA OPERATION METHODS

- (void)saveWindowPosition:(NSPoint)newPosition
{
   
}

- (void)saveIconPosition:(NSPoint)newPosition
{
    
}

- (NSPoint)findWindowPositionForDirectory:(NSString *)fsObjectID
{
    NSPoint position = NSMakePoint(0.0, 0.0);
    
    NSString *sqlStatementString = @"SELECT window_pos_x, window_pos_y FROM finder_spatials WHERE";
    const char *sqlStatement = [sqlStatementString cStringUsingEncoding:NSUTF8StringEncoding];
    sqlite3_stmt *sqlStatementPrepared;
    
    int result = sqlite3_prepare(dbConnection, sqlStatement, -1, &sqlStatementPrepared, 0);
    
    if (result != SQLITE_OK) {
        
    } else {
        if (sqlite3_step(sqlStatementPrepared)) {
            double windowPosX = sqlite3_column_double(sqlStatementPrepared, 0);
            double windowPosY = sqlite3_column_double(sqlStatementPrepared, 1);
            
            position = NSMakePoint(windowPosX, windowPosY);
        }
    }
    
    return position;
}

- (NSSize)findWindowSizeForDirectory:(NSString *)fsObjectID
{
    NSSize windowSize = NSMakeSize(0.0, 0.0);
    
    NSString *sqlStatementString = @"SELECT window_w, window_h FROM finder_spatials WHERE dirID = ?";
    const char *sqlStatement = [sqlStatementString cStringUsingEncoding:NSUTF8StringEncoding];
    sqlite3_stmt *sqlStatementPrepared;
    
    int result = sqlite3_prepare(dbConnection, sqlStatement, -1, &sqlStatementPrepared, 0);
    
    if (result != SQLITE_OK) {
        
    } else {
        const char *fsObjectIDAsCString = [fsObjectID cStringUsingEncoding:NSUTF8StringEncoding];
        int fsObjectIDByteLength = (int)[fsObjectID lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
        sqlite3_bind_text(sqlStatementPrepared, 1, fsObjectIDAsCString, fsObjectIDByteLength, SQLITE_STATIC);
        
        if (sqlite3_step(sqlStatementPrepared)) {
            double windowWidth = sqlite3_column_double(sqlStatementPrepared, 0);
            double windowHeight = sqlite3_column_double(sqlStatementPrepared, 1);
            
            windowSize = NSMakeSize(windowWidth, windowHeight);
        }
    }
    
    return windowSize;
}

- (NSRect)findWindowFrameForDirectory:(NSString *)fsObjectID
{
    NSRect windowFrame = NSMakeRect(0.0, 0.0, 0.0, 0.0);
    
    NSString *sqlStatementString = @"SELECT window_w, window_h, window_pos_x, window_pos_y FROM finder_spatials WHERE dirID = ?";
    const char *sqlStatement = [sqlStatementString cStringUsingEncoding:NSUTF8StringEncoding];
    sqlite3_stmt *sqlStatementPrepared;
    
    int result = sqlite3_prepare(dbConnection, sqlStatement, -1, &sqlStatementPrepared, 0);
    
    if (result != SQLITE_OK) {
        
    } else {
        const char *fsObjectIDAsCString = [fsObjectID cStringUsingEncoding:NSUTF8StringEncoding];
        int fsObjectIDByteLength = (int)[fsObjectID lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
        sqlite3_bind_text(sqlStatementPrepared, 1, fsObjectIDAsCString, fsObjectIDByteLength, SQLITE_STATIC);
        
        if (sqlite3_step(sqlStatementPrepared)) {
            double windowWidth = sqlite3_column_double(sqlStatementPrepared, 0);
            double windowHeight = sqlite3_column_double(sqlStatementPrepared, 1);
            double windowPosX = sqlite3_column_double(sqlStatementPrepared, 2);
            double windowPosY = sqlite3_column_double(sqlStatementPrepared, 3);
            
            windowFrame = NSMakeRect(windowPosX, windowPosY, windowWidth, windowHeight);
        }
    }
    
    return windowFrame;
}

- (NSPoint)findIconPositionForDirectory:(NSString *)fsObjectID
{
    NSPoint position = NSMakePoint(0.0, 0.0);
    
    NSString *sqlStatementString = @"SELECT icon_pos_x, icon_pos_y FROM finder_spatials WHERE dirID = ?";
    const char *sqlStatement = [sqlStatementString cStringUsingEncoding:NSUTF8StringEncoding];
    sqlite3_stmt *sqlStatementPrepared;
    
    int result = sqlite3_prepare(dbConnection, sqlStatement, -1, &sqlStatementPrepared, 0);
    
    if (result != SQLITE_OK) {
        
    } else {
        const char *fsObjectIDAsCString = [fsObjectID cStringUsingEncoding:NSUTF8StringEncoding];
        int fsObjectIDByteLength = (int)[fsObjectID lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
        sqlite3_bind_text(sqlStatementPrepared, 1, fsObjectIDAsCString, fsObjectIDByteLength, SQLITE_STATIC);
        
        if (sqlite3_step(sqlStatementPrepared)) {
            double windowPosX = sqlite3_column_double(sqlStatementPrepared, 0);
            double windowPosY = sqlite3_column_double(sqlStatementPrepared, 1);
            
            position = NSMakePoint(windowPosX, windowPosY);
        }
    }
    
    return position;
}

@end
