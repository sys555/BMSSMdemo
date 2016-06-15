//
//  BMSSMRootViewController.m
//  BMSSMdemo
//
//  Created by iDev on 6/9/16.
//  Copyright © 2016 iDev. All rights reserved.
//

#import "BMSSMRootViewController.h"

#import "BMSSMTopView.h"
#import "BMSSMBottomView.h"

@interface BMSSMRootViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong)BMSSMTopView *topView;
@property (nonatomic, strong)BMSSMBottomView *bottomView;

@end

@implementation BMSSMRootViewController

-(BMSSMTopView*)topView{
    if(!_topView){
        _topView = [BMSSMTopView new];
        _topView.hidden = NO;
        _topView.backgroundColor = VIEW_BACKGROUNDCOLOR;
    }
    return _topView;
}

-(BMSSMBottomView*)bottomView{
    if(!_bottomView){
        _bottomView = [BMSSMBottomView new];
        _bottomView.hidden = NO;
        _bottomView.backgroundColor = [UIColor clearColor];
    }
    return _bottomView;
}

-(void)addSubviewTree{
    [self.view addSubview:[self topView]];
    [self.view addSubview:[self bottomView]];
}

-(void)setViewsLayout{
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset([UIApplication sharedApplication].statusBarFrame.size.height + 5.0);
        make.centerX.equalTo(self.view.mas_centerX);
        
        make.width.equalTo(self.view.mas_width).multipliedBy(0.91);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.045);
    }];
    
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-10);
        make.centerX.equalTo(self.view.mas_centerX);
        
        make.width.equalTo(self.view.mas_width).multipliedBy(0.98);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.89);
    }];
}

-(void)initViews{
    [self setViewsLayout];
    
    [_topView simulateViewDidLoad];
    [_bottomView simulateViewDidLoad];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundImage"]]];
    // Do any additional setup after loading the view.
    [self addSubviewTree];
    [self initViews];
    
    //是否wifi
    if([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] != NotReachable){
        NSLog(@"wifi");
    }
    // 是否3G
    if([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] != NotReachable){
        NSLog(@"3g");
    }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
