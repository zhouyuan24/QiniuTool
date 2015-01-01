//
//  DragDropView.h
//  APITools
//
//  Created by 吴银春 on 14/12/3.
//  Copyright (c) 2014年 江苏瑞蚨通软件科技有限公司. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@protocol DragDropViewDelegate;

@interface DragDropView : NSView

@property (assign) IBOutlet id<DragDropViewDelegate> delegate;

@end


@protocol DragDropViewDelegate <NSObject>
-(void)dragDropViewFileList:(NSArray*)fileList;
@end