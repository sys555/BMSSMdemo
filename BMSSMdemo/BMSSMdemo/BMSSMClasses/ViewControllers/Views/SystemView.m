//
//  SystemView.m
//  BMSSMdemo
//
//  Created by iDev on 6/9/16.
//  Copyright © 2016 iDev. All rights reserved.
//

#import "SystemView.h"
#import "SystemLabelView.h"

#import "host_info.h"

@interface SystemView()

@property (nonatomic, strong)SystemLabelView *modelSystemLabelView;
@property (nonatomic, strong)SystemLabelView *nameSystemLabelView;
@property (nonatomic, strong)SystemLabelView *OSSystemLabelView;
@property (nonatomic, strong)SystemLabelView *OSVersionSystemLabelView;
@property (nonatomic, strong)SystemLabelView *kernelSystemLabelView;
@property (nonatomic, strong)SystemLabelView *numberSystemLabelView;
@property (nonatomic, strong)SystemLabelView *TBSystemLabelView;
@property (nonatomic, strong)SystemLabelView *cacheSystemLabelView;
@property (nonatomic, strong)SystemLabelView *L1ISystemLabelView;
@property (nonatomic, strong)SystemLabelView *L1DSystemLabelView;
@property (nonatomic, strong)SystemLabelView *L2SystemLabelView;
@property (nonatomic, strong)SystemLabelView *L3SystemLabelView;

@property (nonatomic, strong)UIDevice *device;
//NSString *name = device.name;		//获取设备所有者的名称
//NSString *model = device.name;		//获取设备的类别
//NSString *type = device.localizedModel; //获取本地化版本
//NSString *systemName = device.systemName;	//获取当前运行的系统
//NSString *systemVersion = device.systemVersion;//获取当前系统的版本

@end

@implementation SystemView

-(UILabel*)deviceLabel{
    if(!_deviceLabel){
        _deviceLabel = [UILabel new];
        _deviceLabel.hidden = NO;
        _deviceLabel.backgroundColor = TITLELABEL_BACKGROUNDCOLOR;
        _deviceLabel.text = @"  Device";
        _deviceLabel.textColor = [UIColor orangeColor];
        _deviceLabel.font = TITLEFONT;
        //遮罩
        //将图层的边框设置为圆角
        _deviceLabel.layer.cornerRadius = 5.0;
        _deviceLabel.layer.masksToBounds = YES;
        //给图层添加一个有色边框
        _deviceLabel.layer.borderWidth = 1;
        _deviceLabel.layer.borderColor = [[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.5]CGColor];
    }
    return _deviceLabel;
}

-(UILabel*)operatingsystemLabel{
    if(!_operatingsystemLabel){
        _operatingsystemLabel = [UILabel new];
        _operatingsystemLabel.hidden = NO;
        _operatingsystemLabel.backgroundColor = TITLELABEL_BACKGROUNDCOLOR;
        _operatingsystemLabel.text = @"  Operating System";
        _operatingsystemLabel.textColor = [UIColor orangeColor];
        _operatingsystemLabel.font = TITLEFONT;
        
        //遮罩
        //将图层的边框设置为圆角
        _operatingsystemLabel.layer.cornerRadius = 5.0;
        _operatingsystemLabel.layer.masksToBounds = YES;
        //给图层添加一个有色边框
        _operatingsystemLabel.layer.borderWidth = 1.0;
        _operatingsystemLabel.layer.borderColor = [[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.5]CGColor];
    }
    return _operatingsystemLabel;
}

-(UILabel*)CPULabel{
    if(!_CPULabel){
        _CPULabel = [UILabel new];
        _CPULabel.hidden = NO;
        _CPULabel.backgroundColor = TITLELABEL_BACKGROUNDCOLOR;
        _CPULabel.text = @"  CPU";
        _CPULabel.textColor = [UIColor orangeColor];
        _CPULabel.font = TITLEFONT;
        
        //遮罩
        //将图层的边框设置为圆角
        _CPULabel.layer.cornerRadius = 5.0;
        _CPULabel.layer.masksToBounds = YES;
        //给图层添加一个有色边框
        _CPULabel.layer.borderWidth = 1.0;
        _CPULabel.layer.borderColor = [[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.5]CGColor];
    }
    return _CPULabel;
}

-(SystemLabelView*)modelSystemLabelView{
    if(!_modelSystemLabelView){
        _modelSystemLabelView = [SystemLabelView new];
        _modelSystemLabelView.hidden = NO;
        _modelSystemLabelView.isBlackBackground = NO;
        _modelSystemLabelView.title = @"  Model";
        //_modelSystemLabelView.value = @"N78AP";
        _modelSystemLabelView.value = _device.localizedModel;
    }
    return _modelSystemLabelView;
}

-(SystemLabelView*)nameSystemLabelView{
    if(!_nameSystemLabelView){
        _nameSystemLabelView = [SystemLabelView new];
        _nameSystemLabelView.hidden = NO;
        _nameSystemLabelView.isBlackBackground = YES;
        _nameSystemLabelView.title = @"  Name";
        _nameSystemLabelView.value = _device.name;
    }
    return _nameSystemLabelView;
}

-(SystemLabelView*)OSSystemLabelView{
    if(!_OSSystemLabelView){
        _OSSystemLabelView = [SystemLabelView new];
        _OSSystemLabelView.hidden = NO;
        _OSSystemLabelView.isBlackBackground = NO;
        _OSSystemLabelView.title = @"  OS";
        _OSSystemLabelView.value = _device.systemName;
    }
    return _OSSystemLabelView;
}

-(SystemLabelView*)OSVersionSystemLabelView{
    if(!_OSVersionSystemLabelView){
        _OSVersionSystemLabelView = [SystemLabelView new];
        _OSVersionSystemLabelView.hidden = NO;
        _OSVersionSystemLabelView.isBlackBackground = YES;
        _OSVersionSystemLabelView.title = @"  OS Version";
        _OSVersionSystemLabelView.value = _device.systemVersion;
    }
    return _OSVersionSystemLabelView;
}

-(SystemLabelView*)kernelSystemLabelView{
    if(!_kernelSystemLabelView){
        _kernelSystemLabelView = [SystemLabelView new];
        _kernelSystemLabelView.hidden = NO;
        _kernelSystemLabelView.isBlackBackground = NO;
        _kernelSystemLabelView.title = @"  Kernel";
        _kernelSystemLabelView.value = @"Darwin, 15.0.0";
    }
    return _kernelSystemLabelView;
}

-(SystemLabelView*)numberSystemLabelView{
    if(!_numberSystemLabelView){
        _numberSystemLabelView = [SystemLabelView new];
        _numberSystemLabelView.hidden = NO;
        _numberSystemLabelView.isBlackBackground = NO;
        _numberSystemLabelView.title = @"  Number of Cpus";
        _numberSystemLabelView.value = @"2";
    }
    return _numberSystemLabelView;
}

-(SystemLabelView*)TBSystemLabelView{
    if(!_TBSystemLabelView){
        _TBSystemLabelView = [SystemLabelView new];
        _TBSystemLabelView.hidden = NO;
        _TBSystemLabelView.isBlackBackground = YES;
        _TBSystemLabelView.title = @"  TB Frequency";
        _TBSystemLabelView.value = @"24 MHz";
    }
    return _TBSystemLabelView;
}

-(SystemLabelView*)cacheSystemLabelView{
    if(!_cacheSystemLabelView){
        _cacheSystemLabelView = [SystemLabelView new];
        _cacheSystemLabelView.hidden = NO;
        _cacheSystemLabelView.isBlackBackground = NO;
        _cacheSystemLabelView.title = @"  Cache Line Size";
        _cacheSystemLabelView.value = @"32 Bytes";
    }
    return _cacheSystemLabelView;
}

-(SystemLabelView*)L1ISystemLabelView{
    if(!_L1ISystemLabelView){
        _L1ISystemLabelView = [SystemLabelView new];
        _L1ISystemLabelView.hidden = NO;
        _L1ISystemLabelView.isBlackBackground = YES;
        _L1ISystemLabelView.title = @"  L1 I Cache Size";
        _L1ISystemLabelView.value = @"32 KB";
    }
    return _L1ISystemLabelView;
}

-(SystemLabelView*)L1DSystemLabelView{
    if(!_L1DSystemLabelView){
        _L1DSystemLabelView = [SystemLabelView new];
        _L1DSystemLabelView.hidden = NO;
        _L1DSystemLabelView.isBlackBackground = NO;
        _L1DSystemLabelView.title = @"  L1 D Cache Size";
        _L1DSystemLabelView.value = @"32 KB";
    }
    return _L1DSystemLabelView;
}

-(SystemLabelView*)L2SystemLabelView{
    if(!_L2SystemLabelView){
        _L2SystemLabelView = [SystemLabelView new];
        _L2SystemLabelView.hidden = NO;
        _L2SystemLabelView.isBlackBackground = YES;
        _L2SystemLabelView.title = @"  L2 Cache Size";
        _L2SystemLabelView.value = @"1MB";
    }
    return _L2SystemLabelView;
}

-(SystemLabelView*)L3SystemLabelView{
    if(!_L3SystemLabelView){
        _L3SystemLabelView = [SystemLabelView new];
        _L3SystemLabelView.hidden = NO;
        _L3SystemLabelView.isBlackBackground = NO;
        _L3SystemLabelView.title = @"  L3 Cache Size";
        _L3SystemLabelView.value = @"921MB";
    }
    return _L3SystemLabelView;
}

-(void)addSubviewTree{
    [self addSubview:[self modelSystemLabelView]];
    [self addSubview:[self nameSystemLabelView]];
    [self addSubview:[self OSSystemLabelView]];
    [self addSubview:[self OSVersionSystemLabelView]];
    [self addSubview:[self kernelSystemLabelView]];
    [self addSubview:[self numberSystemLabelView]];
    [self addSubview:[self TBSystemLabelView]];
    [self addSubview:[self cacheSystemLabelView]];
    [self addSubview:[self L1ISystemLabelView]];
    [self addSubview:[self L1DSystemLabelView]];
    [self addSubview:[self L2SystemLabelView]];
    [self addSubview:[self L3SystemLabelView]];
    
    //位于上述label之上
    [self addSubview:[self deviceLabel]];
    [self addSubview:[self operatingsystemLabel]];
    [self addSubview:[self CPULabel]];
}

-(void)setViewsLayout{
    [_deviceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(10);
        make.left.equalTo(self.mas_left).offset(12);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.6);
        make.height.equalTo(self.mas_height).multipliedBy(0.026);
    }];
    
    [_operatingsystemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(130);
        make.left.equalTo(self.mas_left).offset(12);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.6);
        make.height.equalTo(self.mas_height).multipliedBy(0.026);
    }];
    
    [_CPULabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(281);
        make.left.equalTo(self.mas_left).offset(12);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.6);
        make.height.equalTo(self.mas_height).multipliedBy(0.026);
    }];
    
    [_modelSystemLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(39);
        make.left.equalTo(_deviceLabel.mas_left);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.925);
        make.height.equalTo(self.mas_height).multipliedBy(0.0395);
    }];
    
    [_nameSystemLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_modelSystemLabelView.mas_bottom).offset(3);
        make.left.equalTo(_deviceLabel.mas_left);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.925);
        make.height.equalTo(self.mas_height).multipliedBy(0.0395);
    }];
    
    [_OSSystemLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(157);
        make.left.equalTo(_deviceLabel.mas_left);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.925);
        make.height.equalTo(self.mas_height).multipliedBy(0.0395);
    }];
    
    [_OSVersionSystemLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_OSSystemLabelView.mas_bottom).offset(2);
        make.left.equalTo(_deviceLabel.mas_left);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.925);
        make.height.equalTo(self.mas_height).multipliedBy(0.0395);
    }];
    
    [_kernelSystemLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_OSVersionSystemLabelView.mas_bottom).offset(2);
        make.left.equalTo(_deviceLabel.mas_left);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.925);
        make.height.equalTo(self.mas_height).multipliedBy(0.0395);
    }];
    
    [_numberSystemLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(309);
        make.left.equalTo(_deviceLabel.mas_left);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.925);
        make.height.equalTo(self.mas_height).multipliedBy(0.0395);
    }];
    
    [_TBSystemLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_numberSystemLabelView.mas_bottom).offset(2);
        make.left.equalTo(_deviceLabel.mas_left);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.925);
        make.height.equalTo(self.mas_height).multipliedBy(0.0395);
    }];
    
    [_cacheSystemLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_TBSystemLabelView.mas_bottom).offset(2);
        make.left.equalTo(_deviceLabel.mas_left);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.925);
        make.height.equalTo(self.mas_height).multipliedBy(0.0395);
    }];
    
    [_L1ISystemLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_cacheSystemLabelView.mas_bottom).offset(2);
        make.left.equalTo(_deviceLabel.mas_left);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.925);
        make.height.equalTo(self.mas_height).multipliedBy(0.0395);
    }];
    
    [_L1DSystemLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_L1ISystemLabelView.mas_bottom).offset(2);
        make.left.equalTo(_deviceLabel.mas_left);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.925);
        make.height.equalTo(self.mas_height).multipliedBy(0.0395);
    }];
    
    [_L2SystemLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_L1DSystemLabelView.mas_bottom).offset(2);
        make.left.equalTo(_deviceLabel.mas_left);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.925);
        make.height.equalTo(self.mas_height).multipliedBy(0.0395);
    }];
    
    [_L3SystemLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_L2SystemLabelView.mas_bottom).offset(2);
        make.left.equalTo(_deviceLabel.mas_left);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.925);
        make.height.equalTo(self.mas_height).multipliedBy(0.0395);
    }];
}

-(void)initViews{
    [self setViewsLayout];
    
    [_modelSystemLabelView simulateViewDidLoad];
    [_nameSystemLabelView simulateViewDidLoad];
    [_OSSystemLabelView simulateViewDidLoad];
    [_OSVersionSystemLabelView simulateViewDidLoad];
    [_kernelSystemLabelView simulateViewDidLoad];
    [_numberSystemLabelView simulateViewDidLoad];
    [_TBSystemLabelView simulateViewDidLoad];
    [_cacheSystemLabelView simulateViewDidLoad];
    [_L1ISystemLabelView simulateViewDidLoad];
    [_L1DSystemLabelView simulateViewDidLoad];
    [_L2SystemLabelView simulateViewDidLoad];
    [_L3SystemLabelView simulateViewDidLoad];
}

-(void)simulateViewDidLoad{
    _device = [UIDevice new];
    
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

-(NSString*)getSubCpuType{
    host_basic_info_data_t hostinfo;
    
}

@end
