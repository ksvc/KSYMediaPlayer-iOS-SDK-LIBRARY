//
//  KSYShortTabelViewCell.m
//  KSYVideoDemo
//
//  Created by 孙健 on 15/12/28.
//  Copyright © 2015年 kingsoft. All rights reserved.
//

#import "KSYShortTabelViewCell.h"

@interface KSYShortTabelViewCell ()

@end


@implementation KSYShortTabelViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier urlstr:(NSString *)urlstring frame:(CGRect)frame;
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        if (!_ksyShortView) {
            _ksyShortView=[[KSYShortView alloc]initWithFrame:frame urlShortString:urlstring];
            [self addSubview:_ksyShortView];
        }
    }
    return self;
}
-(void)dealloc{

}
@end
