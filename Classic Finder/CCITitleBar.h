//
//  CCITitleBar.h
//  Classic Finder
//
//  Created by Ben Szymanski on 2/18/17.
//  Copyright © 2017 Protype Software Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CCITitleBar : NSControl

@property (nonatomic, copy) NSString *titleText;
@property BOOL showCloseButton;
@property BOOL showMaximizeButton;

@end
