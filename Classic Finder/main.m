//
//  main.m
//  Classic Finder
//
//  Created by Ben Szymanski on 2/18/17.
//  Copyright © 2017 Ben Szymanski. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, const char * argv[]) {
    
    // Inspired by SO solution
    // http://stackoverflow.com/questions/15694510/programatically-create-initial-window-of-cocoa-app-os-x
    
    NSArray *t1;
    NSApplication *application = [NSApplication sharedApplication];
    [[NSBundle mainBundle] loadNibNamed:@"MainMenu"
                                  owner:application
                        topLevelObjects:&t1];
    
    AppDelegate *applicationDelegate = [[AppDelegate alloc] init];
    [application setDelegate:applicationDelegate];
    [application run];
    
    return 0;
    
    //return NSApplicationMain(argc, argv);
}
