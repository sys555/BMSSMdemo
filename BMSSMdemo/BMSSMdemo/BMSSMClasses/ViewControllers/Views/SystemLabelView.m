//
//  SystemLabelView.m
//  BMSSMdemo
//
//  Created by iDev on 6/9/16.
//  Copyright © 2016 iDev. All rights reserved.
//

#import "SystemLabelView.h"

@interface SystemLabelView()

@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *valueLabel;
@property (nonatomic, strong)UIImageView *networkImageView;

@end

@implementation SystemLabelView

-(UILabel*)titleLabel{
    if(!_titleLabel){
        _titleLabel = [UILabel new];
        _titleLabel.hidden = NO;
        _titleLabel.text = _title;
        _titleLabel.font = TITLEFONT;
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

-(UILabel*)valueLabel{
    if(!_valueLabel){
        _valueLabel = [UILabel new];
        _valueLabel.hidden = NO;
        _valueLabel.text = _value;
        _valueLabel.font = TITLEFONT;
        _valueLabel.textAlignment = NSTextAlignmentRight;
        _valueLabel.textColor =[UIColor whiteColor];
    }
    return _valueLabel;
}

-(UIImageView*)networkImageView{
    if(!_networkImageView){
        _networkImageView = [UIImageView new];
        _networkImageView.hidden = NO;
        _networkImageView.backgroundColor = [UIColor clearColor];
        
        if (_isGreedImage) {
            [_networkImageView setImage:[self reSizeImage:[UIImage imageNamed:@"greedcicleImage"] toSize:CGSizeMake(19, 19)]];
        }else{
            [_networkImageView setImage:[self reSizeImage:[UIImage imageNamed:@"redcicleImage"] toSize:CGSizeMake(19, 19)]];
        }
    }
    return _networkImageView;
}

-(void)addSubviewTree{
    [self addSubview:[self titleLabel]];
    [self addSubview:[self valueLabel]];
    if(_isShowImageView){
        [self addSubview:[self networkImageView]];
    }
    
    if(_isBlackBackground){
        //有背景
        self.backgroundColor = SYSTEMLABELVIEW_BACKGROUNDCOLOR;
    }else{
        //无背景
        self.backgroundColor = [UIColor clearColor];
    }
}

-(void)setViewsLayout{
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.centerY.equalTo(self.mas_centerY);
        
        make.width.equalTo(@(200));
        make.height.equalTo(self.mas_height);
    }];
    
    [_valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-6);
        make.centerY.equalTo(self.mas_centerY);
        
        make.width.equalTo(@(200));
        make.height.equalTo(self.mas_height);
    }];
    
    [_networkImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-39);
        make.centerY.equalTo(self.mas_centerY);
    }];
}

-(void)initViews{
    [self setViewsLayout];
}

-(void)simulateViewDidLoad{
    [self addSubviewTree];
    [self initViews];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //传递出去
    [[self nextResponder] touchesBegan:touches withEvent:event];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //传递出去
    [[self nextResponder] touchesEnded:touches withEvent:event];
}

//缩放image
-(UIImage*)reSizeImage:(UIImage *)image toSize:(CGSize)size
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    //Determine whether the screen is retina
    //When set to 0.0, the scale factor of the main screen is used, which for Retina displays is 2.0 or higher (3.0 on the iPhone 6 Plus).
    if([[UIScreen mainScreen] scale] == 2.0){
        UIGraphicsBeginImageContextWithOptions(size, NO, 2.0);
    }else if([[UIScreen mainScreen] scale] == 3.0){
        UIGraphicsBeginImageContextWithOptions(size, NO, 3.0);
    }else{
        UIGraphicsBeginImageContext(size);
    }
    // 绘制改变大小的图片
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

@end
