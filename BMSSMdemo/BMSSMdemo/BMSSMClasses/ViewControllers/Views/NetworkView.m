//
//  NetworkView.m
//  BMSSMdemo
//
//  Created by iDev on 6/9/16.
//  Copyright © 2016 iDev. All rights reserved.
//

#import "NetworkView.h"

#import "SystemLabelView.h"

@interface NetworkView()

@property (nonatomic, strong)SystemLabelView *networkAvailableLabelView;
@property (nonatomic, strong)SystemLabelView *hostNameLabelView;
@property (nonatomic, strong)SystemLabelView *ActiveWLANLabelView;
@property (nonatomic, strong)SystemLabelView *LocalWIFIIPLabelView;
@property (nonatomic, strong)SystemLabelView *ActiveWWANLabelView;
@property (nonatomic, strong)SystemLabelView *LocalCellularIPLabelView;
@property (nonatomic, strong)SystemLabelView *CarrierNameLabelView;
@property (nonatomic, strong)SystemLabelView *MCCLabelView;
@property (nonatomic, strong)SystemLabelView *MNCLabelView;
@property (nonatomic, strong)SystemLabelView *CountryCodeLabelView;
@property (nonatomic, strong)SystemLabelView *AllowsVOIPLabelView;

@end

@implementation NetworkView

-(UILabel*)WiFiLabel{
    if(!_WiFiLabel){
        _WiFiLabel = [UILabel new];
        _WiFiLabel.hidden = NO;
        _WiFiLabel.backgroundColor = TITLELABEL_BACKGROUNDCOLOR;
        _WiFiLabel.text = @"  WiFi Information";
        _WiFiLabel.textColor = [UIColor orangeColor];
        _WiFiLabel.font = TITLEFONT;
        //遮罩
        //将图层的边框设置为圆角
        _WiFiLabel.layer.cornerRadius = 5.0;
        _WiFiLabel.layer.masksToBounds = YES;
        //给图层添加一个有色边框
        _WiFiLabel.layer.borderWidth = 1;
        _WiFiLabel.layer.borderColor = [[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.5]CGColor];
    }
    return _WiFiLabel;
}

-(UILabel*)CellularLabel{
    if(!_CellularLabel){
        _CellularLabel = [UILabel new];
        _CellularLabel.hidden = NO;
        _CellularLabel.backgroundColor = TITLELABEL_BACKGROUNDCOLOR;
        _CellularLabel.text = @"  Cellular Information";
        _CellularLabel.textColor = [UIColor orangeColor];
        _CellularLabel.font = TITLEFONT;
        //遮罩
        //将图层的边框设置为圆角
        _CellularLabel.layer.cornerRadius = 5.0;
        _CellularLabel.layer.masksToBounds = YES;
        //给图层添加一个有色边框
        _CellularLabel.layer.borderWidth = 1;
        _CellularLabel.layer.borderColor = [[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.5]CGColor];
    }
    return _CellularLabel;
}
-(UILabel*)NetworkLabel{
    if(!_NetworkLabel){
        _NetworkLabel = [UILabel new];
        _NetworkLabel.hidden = NO;
        _NetworkLabel.backgroundColor = TITLELABEL_BACKGROUNDCOLOR;
        _NetworkLabel.text = @"  Network";
        _NetworkLabel.textColor = [UIColor orangeColor];
        _NetworkLabel.font = TITLEFONT;
        //遮罩
        //将图层的边框设置为圆角
        _NetworkLabel.layer.cornerRadius = 5.0;
        _NetworkLabel.layer.masksToBounds = YES;
        //给图层添加一个有色边框
        _NetworkLabel.layer.borderWidth = 1;
        _NetworkLabel.layer.borderColor = [[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.5]CGColor];
    }
    return _NetworkLabel;
}

-(SystemLabelView*)networkAvailableLabelView{
    if(!_networkAvailableLabelView){
        _networkAvailableLabelView = [SystemLabelView new];
        _networkAvailableLabelView.hidden = NO;
        _networkAvailableLabelView.isBlackBackground = NO;
        _networkAvailableLabelView.isShowImageView = YES;
        _networkAvailableLabelView.title = @"  Network Available";
        //判断网络连接状态
        if([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] != NotReachable || [[Reachability reachabilityForInternetConnection] currentReachabilityStatus] != NotReachable){
            _networkAvailableLabelView.isGreedImage = YES;
            _networkAvailableLabelView.value = @"YES";
        }else{
            _networkAvailableLabelView.value = @"NO";
        }
    }
    return _networkAvailableLabelView;
}

-(SystemLabelView*)hostNameLabelView{
    if(!_hostNameLabelView){
        _hostNameLabelView = [SystemLabelView new];
        _hostNameLabelView.hidden = NO;
        _hostNameLabelView.isBlackBackground = YES;
        _hostNameLabelView.title = @"  Host Name";
        _hostNameLabelView.value = [self hostname];
    }
    return _hostNameLabelView;
}

-(SystemLabelView*)ActiveWLANLabelView{
    if(!_ActiveWLANLabelView){
        _ActiveWLANLabelView = [SystemLabelView new];
        _ActiveWLANLabelView.hidden = NO;
        _ActiveWLANLabelView.isBlackBackground = NO;
        _ActiveWLANLabelView.isShowImageView = YES;
        _ActiveWLANLabelView.title = @"  Active WLAN";
        //判断网络连接状态
        if([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] != NotReachable){
            _ActiveWLANLabelView.isGreedImage = YES;
            _ActiveWLANLabelView.value = @"YES";
        }else{
            _ActiveWLANLabelView.value = @"NO";
        }
    }
    return _ActiveWLANLabelView;
}

-(SystemLabelView*)LocalWIFIIPLabelView{
    if(!_LocalWIFIIPLabelView){
        _LocalWIFIIPLabelView = [SystemLabelView new];
        _LocalWIFIIPLabelView.hidden = NO;
        _LocalWIFIIPLabelView.isBlackBackground = YES;
        _LocalWIFIIPLabelView.title = @"  Local WiFi IP";
        _LocalWIFIIPLabelView.value =[self localWiFiIPAddress];
    }
    return _LocalWIFIIPLabelView;
}

-(SystemLabelView*)ActiveWWANLabelView{
    if(!_ActiveWWANLabelView){
        _ActiveWWANLabelView = [SystemLabelView new];
        _ActiveWWANLabelView.hidden = NO;
        _ActiveWWANLabelView.isBlackBackground = NO;
        _ActiveWWANLabelView.isShowImageView = YES;
        _ActiveWWANLabelView.title = @"  Active WWAN";
        _ActiveWWANLabelView.value = @"NO";
    }
    return _ActiveWWANLabelView;
}

-(SystemLabelView*)LocalCellularIPLabelView{
    if(!_LocalCellularIPLabelView){
        _LocalCellularIPLabelView = [SystemLabelView new];
        _LocalCellularIPLabelView.hidden = NO;
        _LocalCellularIPLabelView.isBlackBackground = YES;
        _LocalCellularIPLabelView.title = @"  Local Cellular IP";
        _LocalCellularIPLabelView.value = nil;
    }
    return _LocalCellularIPLabelView;
}

-(SystemLabelView*)CarrierNameLabelView{
    if(!_CarrierNameLabelView){
        _CarrierNameLabelView = [SystemLabelView new];
        _CarrierNameLabelView.hidden = NO;
        _CarrierNameLabelView.isBlackBackground = NO;
        _CarrierNameLabelView.title = @"  Carrier Name";
        _CarrierNameLabelView.value = nil;
    }
    return _CarrierNameLabelView;
}

-(SystemLabelView*)MCCLabelView{
    if(!_MCCLabelView){
        _MCCLabelView = [SystemLabelView new];
        _MCCLabelView.hidden = NO;
        _MCCLabelView.isBlackBackground = YES;
        _MCCLabelView.title = @"  MCC";
        _MCCLabelView.value = nil;
    }
    return _MCCLabelView;
}

-(SystemLabelView*)MNCLabelView{
    if(!_MNCLabelView){
        _MNCLabelView = [SystemLabelView new];
        _MNCLabelView.hidden = NO;
        _MNCLabelView.isBlackBackground = NO;
        _MNCLabelView.title = @"  MNC";
        _MNCLabelView.value = nil;
    }
    return _MNCLabelView;
}

-(SystemLabelView*)CountryCodeLabelView{
    if(!_CountryCodeLabelView){
        _CountryCodeLabelView = [SystemLabelView new];
        _CountryCodeLabelView.hidden = NO;
        _CountryCodeLabelView.isBlackBackground = YES;
        _CountryCodeLabelView.title = @"  Country Code";
        _CountryCodeLabelView.value = nil;
    }
    return _CountryCodeLabelView;
}

-(SystemLabelView*)AllowsVOIPLabelView{
    if(!_AllowsVOIPLabelView){
        _AllowsVOIPLabelView = [SystemLabelView new];
        _AllowsVOIPLabelView.hidden = NO;
        _AllowsVOIPLabelView.isBlackBackground = NO;
        _AllowsVOIPLabelView.title = @"  Allows VOIP";
        _AllowsVOIPLabelView.isShowImageView = YES;
        _AllowsVOIPLabelView.value = @"NO";
    }
    return _AllowsVOIPLabelView;
}

-(void)addSubviewTree{
    [self addSubview:[self networkAvailableLabelView]];
    [self addSubview:[self hostNameLabelView]];
    [self addSubview:[self ActiveWLANLabelView]];
    [self addSubview:[self LocalWIFIIPLabelView]];
    [self addSubview:[self ActiveWWANLabelView]];
    [self addSubview:[self LocalCellularIPLabelView]];
    [self addSubview:[self CarrierNameLabelView]];
    [self addSubview:[self MCCLabelView]];
    [self addSubview:[self MNCLabelView]];
    [self addSubview:[self CountryCodeLabelView]];
    [self addSubview:[self AllowsVOIPLabelView]];
    
    //位于上述label之上
    [self addSubview:[self WiFiLabel]];
    [self addSubview:[self CellularLabel]];
    [self addSubview:[self NetworkLabel]];
}

-(void)setViewsLayout{
    [_NetworkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(10);
        make.left.equalTo(self.mas_left).offset(12);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.6);
        make.height.equalTo(self.mas_height).multipliedBy(0.026);
    }];
    
    [_WiFiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(130);
        make.left.equalTo(self.mas_left).offset(12);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.6);
        make.height.equalTo(self.mas_height).multipliedBy(0.026);
    }];
    
    [_CellularLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(248);
        make.left.equalTo(self.mas_left).offset(12);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.6);
        make.height.equalTo(self.mas_height).multipliedBy(0.026);
    }];
    
    [_networkAvailableLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(39);
        make.left.equalTo(_NetworkLabel.mas_left);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.925);
        make.height.equalTo(self.mas_height).multipliedBy(0.0395);
    }];
    
    [_hostNameLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_networkAvailableLabelView.mas_bottom).offset(2);
        make.left.equalTo(_NetworkLabel.mas_left);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.925);
        make.height.equalTo(self.mas_height).multipliedBy(0.0395);
    }];
    
    [_ActiveWLANLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(157);
        make.left.equalTo(_NetworkLabel.mas_left);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.925);
        make.height.equalTo(self.mas_height).multipliedBy(0.0395);
    }];
    
    [_LocalWIFIIPLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_ActiveWLANLabelView.mas_bottom).offset(2);
        make.left.equalTo(_NetworkLabel.mas_left);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.925);
        make.height.equalTo(self.mas_height).multipliedBy(0.0395);
    }];
    
    [_ActiveWWANLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(278);
        make.left.equalTo(_NetworkLabel.mas_left);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.925);
        make.height.equalTo(self.mas_height).multipliedBy(0.0395);
    }];
    
    [_LocalCellularIPLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_ActiveWWANLabelView.mas_bottom).offset(2);
        make.left.equalTo(_NetworkLabel.mas_left);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.925);
        make.height.equalTo(self.mas_height).multipliedBy(0.0395);
    }];
    
    [_CarrierNameLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_LocalCellularIPLabelView.mas_bottom).offset(2);
        make.left.equalTo(_NetworkLabel.mas_left);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.925);
        make.height.equalTo(self.mas_height).multipliedBy(0.0395);
    }];
    
    [_MCCLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_CarrierNameLabelView.mas_bottom).offset(2);
        make.left.equalTo(_NetworkLabel.mas_left);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.925);
        make.height.equalTo(self.mas_height).multipliedBy(0.0395);
    }];
    
    [_MNCLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_MCCLabelView.mas_bottom).offset(2);
        make.left.equalTo(_NetworkLabel.mas_left);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.925);
        make.height.equalTo(self.mas_height).multipliedBy(0.0395);
    }];
    
    [_CountryCodeLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_MNCLabelView.mas_bottom).offset(2);
        make.left.equalTo(_NetworkLabel.mas_left);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.925);
        make.height.equalTo(self.mas_height).multipliedBy(0.0395);
    }];
    
    [_AllowsVOIPLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_CountryCodeLabelView.mas_bottom).offset(2);
        make.left.equalTo(_NetworkLabel.mas_left);
        
        make.width.equalTo(self.mas_width).multipliedBy(0.925);
        make.height.equalTo(self.mas_height).multipliedBy(0.0395);
    }];
}

-(void)initViews{
    [self setViewsLayout];
    
    [_networkAvailableLabelView simulateViewDidLoad];
    [_hostNameLabelView simulateViewDidLoad];
    [_ActiveWLANLabelView simulateViewDidLoad];
    [_LocalWIFIIPLabelView simulateViewDidLoad];
    [_ActiveWLANLabelView simulateViewDidLoad];
    [_LocalWIFIIPLabelView simulateViewDidLoad];
    [_ActiveWWANLabelView simulateViewDidLoad];
    [_LocalCellularIPLabelView simulateViewDidLoad];
    [_CarrierNameLabelView simulateViewDidLoad];
    [_MCCLabelView simulateViewDidLoad];
    [_MNCLabelView simulateViewDidLoad];
    [_CountryCodeLabelView simulateViewDidLoad];
    [_AllowsVOIPLabelView simulateViewDidLoad];
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

//获取WiFi的IP地址
- (NSString *)localWiFiIPAddress
{
    BOOL success;
    struct ifaddrs * addrs;
    const struct ifaddrs * cursor;
    
    success = getifaddrs(&addrs) == 0;
    if (success) {
        cursor = addrs;
        while (cursor != NULL) {
            // the second test keeps from picking up the loopback address
            if (cursor->ifa_addr->sa_family == AF_INET && (cursor->ifa_flags & IFF_LOOPBACK) == 0)
            {
                NSString *name = [NSString stringWithUTF8String:cursor->ifa_name];
                if ([name isEqualToString:@"en0"])  // Wi-Fi adapter
                    return [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)cursor->ifa_addr)->sin_addr)];
            }
            cursor = cursor->ifa_next;
        }
        freeifaddrs(addrs);
    }
    return nil;
}

//获取hostname
- (NSString *) hostname
{
    char baseHostName[256]; // Thanks, Gunnar Larisch
    int success = gethostname(baseHostName, 255);
    if (success != 0) return nil;
    baseHostName[255] = '/0';
    
#if TARGET_IPHONE_SIMULATOR
    return [NSString stringWithFormat:@"%s", baseHostName];
#else
    return [NSString stringWithFormat:@"%s.local", baseHostName];
#endif
}


@end
