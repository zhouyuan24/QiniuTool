//
//  Tool.m
//  QiniuTool
//
//  Created by 周渊 on 15/1/1.
//  Copyright (c) 2015年 周渊. All rights reserved.
//

#import "Tool.h"

@implementation Tool

+(void) showMsg:(NSString *)title message:(NSString *)msg{
    NSAlert *alert = [NSAlert alertWithMessageText: title
                                     defaultButton:@"确定"
                                   alternateButton:nil
                                       otherButton:nil
                         informativeTextWithFormat:msg];
    
    [alert runModal];
}
@end
