//
//  CCIScrollContentView.m
//  Classic Scrolling2
//
//  Created by Ben Szymanski on 11/12/17.
//  Copyright © 2017 Ben Szymanski. All rights reserved.
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

#import "CCIScrollContentView.h"

@implementation CCIScrollContentView

//- (void)drawRect:(NSRect)dirtyRect {
//    [super drawRect:dirtyRect];
//    
//    NSUInteger iterationCount = 0;
//    for (NSUInteger y = 0; y < self.frame.size.height; y += 30)
//    {
//        if (iterationCount % 2 == 0) {
//            [[NSColor redColor] setFill];
//        } else {
//            [[NSColor whiteColor] setFill];
//        }
//        
//        NSRectFill(NSMakeRect(0, y, self.frame.size.width, (y + 30)));
//        
//        NSString *yPos = [NSString stringWithFormat:@"%ld", y];
//        [yPos drawAtPoint:NSMakePoint(2.0, (y + 2.0)) withAttributes:nil];
//        
//        iterationCount += 1;
//    }
//}

- (BOOL)isFlipped
{
    return YES;
}

@end
