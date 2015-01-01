//
//  ViewController.m
//  QiniuTool
//
//  Created by 周渊 on 14/12/31.
//  Copyright (c) 2014年 周渊. All rights reserved.
//

#import "ViewController.h"
#import "QiniuSDK.h"
#import "Tool.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

#pragma mark - DragDropViewDelegate
-(void)dragDropViewFileList:(NSArray *)fileList{
    if(!fileList || [fileList count] <= 0){
     [Tool showMsg:@"错误提示" message:@"请选择一个文件"];
        return;
    };
    [self uploadFile:[fileList objectAtIndex:0]];
    self.fileInput.stringValue = [fileList objectAtIndex:0];
}

-(void) uploadFile:(NSString *)filePath{
    NSString *token = @"sDaC65xORzqH1Uikw2cXXO10Mw6Adtd9gOO_YGdj:XSPyFFjc3CNtzvJ5qOP1Ta-tKtU=:eyJzY29wZSI6Imh1cnJ5dXAiLCJkZWFkbGluZSI6MTQyMDA5NDIwN30=";
    QNUploadManager *upManager = [[QNUploadManager alloc] init];
    NSString *fileName = [self getNewFileName:filePath];
    NSLog(@"%@",fileName);
    NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
    [upManager putFile:fileUrl.path key:fileName token:token
              complete: ^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
                  if(info.isOK){
                  self.resultInput.stringValue = [NSString stringWithFormat:@"%@/%@",@"http://hurryup.qiniudn.com",fileName];
                  } else {
                      [Tool showMsg:@"上传失败" message:info.error.userInfo.description];
                  }
                  
              } option:nil];

}

/**
 *   获取新得文件名称
 *
 *  @param filePath <#filePath description#>
 *
 *  @return <#return value description#>
 */
-(NSString *)getNewFileName:(NSString *) filePath{
    NSString *fileEx =  [filePath pathExtension];
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970]*1000000;
    NSString *timeString = [NSString stringWithFormat:@"%ld", (long)a];//转为字符型
    return [NSString stringWithFormat:@"%@.%@",timeString,fileEx];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)choseFile:(id)sender {
    
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    
    [openDlg setCanChooseFiles:TRUE]; //确定可以选择文件
    [openDlg setCanChooseDirectories:FALSE]; //可以浏览目录
    [openDlg setAllowsMultipleSelection:FALSE]; //不可以多选
    [openDlg setAllowsOtherFileTypes:FALSE]; //不可以选择其他格式类型的文件
    //    [openDlg setAllowedFileTypes:[NSArray arrayWithObject:@"png"]]; //可以选择.png后缀的文件
    if ([openDlg runModal] == NSModalResponseOK) {  //如果用户点OK
        [self.fileInput setStringValue:[[openDlg URL] path]]; //获得选择的文件路径，这个地方我也GG很久，后来试出来这个。
        [self uploadFile:[[openDlg URL] path]];
        
    }
}
@end
