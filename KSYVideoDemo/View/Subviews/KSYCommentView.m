//
//  KSYCommentView.m
//  KSYVideoDemo
//
//  Created by 孙健 on 15/12/24.
//  Copyright © 2015年 kingsoft. All rights reserved.
//

#import "KSYCommentView.h"

@interface KSYCommentView ()<UITextFieldDelegate>

@end


@implementation KSYCommentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
    {
        [self addSubViews];
    }
    return self;
}
- (void)addSubViews
{
    self.backgroundColor=KSYCOLER(34, 34, 34);
    
    _kTextField=[[UITextField alloc]initWithFrame:CGRectMake(10, 5, self.width-10-60, 30)];
    _kTextField.borderStyle=UITextBorderStyleRoundedRect;
    _kTextField.tag=kCommentFieldTag;
    [self addSubview:_kTextField];
    _kTextField.backgroundColor=KSYCOLER(100, 100, 100);
    _kTextField.placeholder=@"填写评论内容";
    _kTextField.delegate=self;
    
    
    UIButton *kSendBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    kSendBtn.frame=CGRectMake(_kTextField.right+10, 5, 40, 30);
    [self addSubview:kSendBtn];
    [kSendBtn setTitle:@"发送"forState:UIControlStateNormal];
    [kSendBtn setTitleColor:THEMECOLOR forState:UIControlStateNormal];
    [kSendBtn addTarget:self action:@selector(sendComment) forControlEvents:UIControlEventTouchUpInside];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [self regNotification];
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    [self unregNotification];
}
- (void)regNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}
- (void)unregNotification{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
}
- (void)keyboardWillChangeFrame:(NSNotification*)aNotification{
    
    NSDictionary* info = [aNotification userInfo];
    
    CGRect endKeyboardRect = [[info objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    
    CGFloat height = endKeyboardRect.size.height;
    
    //通过代码块改变bottom的位置
    if (self.changeFrame) {
        self.changeFrame(height);
    }
}
- (void)sendComment
{
    if (self.send) {
        self.send();
    }
}

@end
