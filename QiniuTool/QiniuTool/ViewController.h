//
//  ViewController.h
//  QiniuTool
//
//  Created by 周渊 on 14/12/31.
//  Copyright (c) 2014年 周渊. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DragDropView.h"


@interface ViewController : NSViewController<DragDropViewDelegate>

@property (weak) IBOutlet NSTextField *fileInput;
- (IBAction)choseFile:(id)sender;
@property (weak) IBOutlet NSTextFieldCell *resultInput;

@end

