//
//  CCIClassicTitlebarDelegate.h
//  Classic Finder
//
//  Created by Ben Szymanski on 2/4/18.
//  Copyright © 2018 Protype Software Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCITitleBar.h"

@protocol CCIClassicTitlebarDelegate <NSObject>

@optional
- (void)titlebarDidFinishDetectingWindowPositionChange:(CCITitleBar *)sender;

@end
