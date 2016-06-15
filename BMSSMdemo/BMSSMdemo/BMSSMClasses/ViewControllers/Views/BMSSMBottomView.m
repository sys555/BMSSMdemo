//
//  BMSSMBottomView.m
//  BMSSMdemo
//
//  Created by iDev on 6/9/16.
//  Copyright © 2016 iDev. All rights reserved.
//

#import "BMSSMBottomView.h"

#import "SummaryView.h"
#import "SystemView.h"
#import "NetworkView.h"

#import "ContainerView.h"
#import "BMSSMScrollView.h"

@interface BMSSMBottomView()<UIScrollViewDelegate>

@property (nonatomic, strong)BMSSMScrollView *scrollView;

@property (nonatomic, strong)ContainerView *containerView;

@property (nonatomic, strong)SummaryView *summaryView;
@property (nonatomic, strong)SystemView  *systemView;
@property (nonatomic, strong)NetworkView *networkView;

@property (nonatomic)CGRect originDeviceLabelFrame;
@property (nonatomic)CGRect originOperatingSystemLabelFrame;
@property (nonatomic)CGRect originCPULabelFrame;

@property (nonatomic)CGPoint scrollViewStartPosPoint;
@property (nonatomic)int     scrollDirection;

@property (nonatomic)CGPoint startPoint;
@property (nonatomic)CGPoint endPoint;

@end

@implementation BMSSMBottomView

-(BMSSMScrollView*)scrollView{
    if(!_scrollView){
        _scrollView = [BMSSMScrollView new];
        _scrollView.hidden = NO;
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.directionalLockEnabled = YES;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

-(ContainerView*)containerView{
    if(!_containerView){
        _containerView = [ContainerView new];
        _containerView.hidden = NO;
        _containerView.backgroundColor = [UIColor clearColor];
    }
    return _containerView;
}

-(SummaryView*)summaryView{
    if(!_summaryView){
        _summaryView = [SummaryView new];
        _summaryView.hidden = NO;
        _summaryView.backgroundColor = VIEW_BACKGROUNDCOLOR;
        
        //遮罩
        //将图层的边框设置为圆角
        _summaryView.layer.cornerRadius = 7.0;
        _summaryView.layer.masksToBounds = YES;
    }
    return _summaryView;
}

-(SystemView*)systemView{
    if(!_systemView){
        _systemView = [SystemView new];
        _systemView.hidden = NO;
        _systemView.backgroundColor = VIEW_BACKGROUNDCOLOR;
        
        //遮罩
        //将图层的边框设置为圆角
        _systemView.layer.cornerRadius = 7.0;
        _systemView.layer.masksToBounds = YES;
        
    }
    return _systemView;
}

-(NetworkView*)networkView{
    if(!_networkView){
        _networkView = [NetworkView new];
        _networkView.hidden = NO;
        _networkView.backgroundColor = VIEW_BACKGROUNDCOLOR;
        
        //遮罩
        //将图层的边框设置为圆角
        _networkView.layer.cornerRadius = 7.0;
        _networkView.layer.masksToBounds = YES;
    }
    return _networkView;
}

-(void)addSubviewTree{
    [self addSubview:[self scrollView]];
    [_scrollView addSubview:[self containerView]];
    
    [_containerView addSubview:[self summaryView]];
    [_containerView addSubview:[self systemView]];
    [_containerView addSubview:[self networkView]];
}

-(void)setViewsLayout{
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
        
        make.width.equalTo(self.mas_width);
        make.height.equalTo(self.mas_height);
    }];
    
    [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_scrollView);
        
        make.width.equalTo(self.mas_width).multipliedBy(3);
        make.height.equalTo(self.mas_height).offset(100);
    }];
    
    [_summaryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_containerView.mas_left).offset(5);
        make.top.equalTo(_containerView.mas_top);
        
        make.width.equalTo(self.mas_width).offset(-10);
        make.height.equalTo(_containerView.mas_width);
    }];
    
    [_systemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_containerView.mas_centerX);
        make.top.equalTo(_containerView.mas_top);
        
        make.width.equalTo(self.mas_width).offset(-10);
        make.height.equalTo(_containerView.mas_width);
    }];
    
    [_networkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_containerView.mas_right).offset(-5);
        make.top.equalTo(_containerView.mas_top);
        
        make.width.equalTo(self.mas_width).offset(-10);
        make.height.equalTo(_containerView.mas_width);
    }];
}

-(void)initViews{
    [self setViewsLayout];
    
    [_summaryView simulateViewDidLoad];
    [_systemView simulateViewDidLoad];
    [_networkView simulateViewDidLoad];
}

-(void)simulateViewDidLoad{
    [self addSubviewTree];
    [self initViews];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    _originDeviceLabelFrame = _systemView.deviceLabel.frame;
    _originOperatingSystemLabelFrame = _systemView.operatingsystemLabel.frame;
    _originCPULabelFrame = _systemView.CPULabel.frame;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollViewsender{
    if(self.scrollDirection == 0){
        //we need to determine direction
        //use the difference between positions to determin the direction
        if(fabs(self.scrollViewStartPosPoint.x - _scrollView.contentOffset.x) <
           fabs(self.scrollViewStartPosPoint.y - _scrollView.contentOffset.y)){
            //Vertical Scrolling
            self.scrollDirection = 1;
        }else{
            //Horitonzal Scrolling
            self.scrollDirection = 2;
        }
    }
    //Update scroll position of the scrollview acoording to detected direction.
    if(self.scrollDirection == 1){
        _scrollView.contentOffset = CGPointMake(self.scrollViewStartPosPoint.x, _scrollView.contentOffset.y);
    }else if(self.scrollDirection == 2){
        _scrollView.contentOffset = CGPointMake(_scrollView.contentOffset.x, self.scrollViewStartPosPoint.y);
    }
    [self moveLabel];
}

-(void)moveLabel{
    
    /*--------------SystemView--------------*/
    //operatingsystemLabel
    if(_scrollView.contentOffset.y <= 0){
        //恢复origin
        [_systemView.deviceLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_containerView.mas_top).offset(10);
        }];
    }else if(130 - _systemView.operatingsystemLabel.frame.size.height - 10 >
             _systemView.deviceLabel.frame.origin.y){
        //当deviceLabel碰到scrollview的顶端(+10)，并且底端未碰到下一个label时，更新frame
        [_systemView.deviceLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_containerView.mas_top).offset(_scrollView.contentOffset.y + 10);
        }];
    }else if(_systemView.deviceLabel.frame.origin.y - 10 >= _scrollView.contentOffset.y){
        //当scrollview在上拉，并且显示label时，更新frame
        [_systemView.deviceLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_containerView.mas_top).offset(_scrollView.contentOffset.y + 10);
        }];
    }else{
        
    }
    
    //operatingsystemLabel
    if(_scrollView.contentOffset.y <= 130 - 10){
        [_systemView.operatingsystemLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_containerView.mas_top).offset(130);
        }];
    }else if(281 - _systemView.CPULabel.frame.size.height - 10 >
             _systemView.operatingsystemLabel.frame.origin.y){
        //当operatingsystemLabel碰到scrollview的顶端(+10)，并且底端未碰到下一个label时，更新frame
        [_systemView.operatingsystemLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_containerView.mas_top).offset(_scrollView.contentOffset.y + 10);
        }];
    }else if(_systemView.operatingsystemLabel.frame.origin.y - 10 >= _scrollView.contentOffset.y){
        //当scrollview在上拉，并且显示label时，更新frame
        [_systemView.operatingsystemLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_containerView.mas_top).offset(_scrollView.contentOffset.y + 10);
        }];
    }else{
        
    }
    
    //CPUlabel
    if(_scrollView.contentOffset.y <= 281 - 10){
        [_systemView.CPULabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_containerView.mas_top).offset(281);
        }];
    }else if(_scrollView.frame.size.height < _systemView.frame.size.height){
        [_systemView.CPULabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_containerView.mas_top).offset(_scrollView.contentOffset.y + 10);
        }];
    }else{
        
    }
    
    /*--------------NetworkView--------------*/
    //networkLabel
    if(_scrollView.contentOffset.y <= 0){
        //恢复origin
        [_networkView.NetworkLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_containerView.mas_top).offset(10);
        }];
    }else if(130 - _networkView.WiFiLabel.frame.size.height - 10 >
             _networkView.NetworkLabel.frame.origin.y){
        [_networkView.NetworkLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_containerView.mas_top).offset(10 + _scrollView.contentOffset.y);
        }];
    }else if(_networkView.NetworkLabel.frame.origin.y - 10 > _scrollView.contentOffset.y){
        [_networkView.NetworkLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_containerView.mas_top).offset(10 + _scrollView.contentOffset.y);
        }];
    }else{
        
    }
    
    //WiFiLabel
    if(_scrollView.contentOffset.y <= 130 - 10){
        //恢复origin
        [_networkView.WiFiLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_containerView.mas_top).offset(130);
        }];
    }else if(248 - _networkView.CellularLabel.frame.size.height - 10 >
             _networkView.WiFiLabel.frame.origin.y){
        [_networkView.WiFiLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_containerView.mas_top).offset(_scrollView.contentOffset.y + 10);
        }];
    }else if(_networkView.WiFiLabel.frame.origin.y - 10 > _scrollView.contentOffset.y){
        [_networkView.WiFiLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_containerView.mas_top).offset(_scrollView.contentOffset.y + 10);
        }];
    }else{
        
    }
    
    //CellularLabel
    if(_scrollView.contentOffset.y <= 248 - 10){
        //恢复origin
        [_networkView.CellularLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_containerView.mas_top).offset(248);
        }];
    }else if(_scrollView.frame.size.height < _networkView.frame.size.height){
        [_networkView.CellularLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_containerView.mas_top).offset(_scrollView.contentOffset.y + 10);
        }];
    }else{
        
    }
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollViewsender{
    self.scrollViewStartPosPoint = _scrollView.contentOffset;
    self.scrollDirection = 0;
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollViewsender willDecelerate:(BOOL)decelerate{
    if(decelerate){
        self.scrollDirection = 0;
    }
    if(_scrollView.contentOffset.x < 0.5 * self.frame.size.width){
        [_scrollView setContentOffset:CGPointMake(0, _scrollView.contentOffset.y) animated:YES];
    }else if(_scrollView.contentOffset.x < 0.5 * _containerView.frame.size.width){
        [_scrollView setContentOffset:CGPointMake(_containerView.frame.size.width / 3, _scrollView.contentOffset.y) animated:YES];
    }else{
        [_scrollView setContentOffset:CGPointMake(2 * _containerView.frame.size.width / 3, _scrollView.contentOffset.y) animated:YES];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for(UITouch *touch in event.allTouches){
        _startPoint = [touch locationInView:self];
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for(UITouch *touch in event.allTouches){
        _endPoint = [touch locationInView:self];
    }
//    if([self distancefrompointA:_startPoint topointB:_endPoint] < 200){
//        if(_scrollView.contentOffset.x < 0.5 * self.frame.size.width){
//            [_scrollView setContentOffset:CGPointMake(0, _scrollView.contentOffset.y) animated:YES];
//        }else if(_scrollView.contentOffset.x < 0.5 * _containerView.frame.size.width){
//            [_scrollView setContentOffset:CGPointMake(_containerView.frame.size.width / 3, _scrollView.contentOffset.y) animated:YES];
//        }else{
//            [_scrollView setContentOffset:CGPointMake(2 * _containerView.frame.size.width / 3, _scrollView.contentOffset.y) animated:YES];
//        }
//    }
}

-(float)distancefrompointA:(CGPoint)pointA topointB:(CGPoint)pointB{
    return sqrt(pow((pointA.y - pointB.y), 2) + pow((pointA.x - pointB.x), 2));
}

@end
