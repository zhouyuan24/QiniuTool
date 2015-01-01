//
//  Tool.h
//  QiniuTool
//
//  Created by 周渊 on 15/1/1.
//  Copyright (c) 2015年 周渊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface Tool : NSObject

/**
 *  alert框弹出提示细心
 *
 *  @param title 标题
 *  @param msg   信息
 */
+(void) showMsg:(NSString *)title message:(NSString *)msg;
@end
