//
//  SystemView.h
//  BMSSMdemo
//
//  Created by iDev on 6/9/16.
//  Copyright © 2016 iDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SystemView : UIView

@property (nonatomic, strong)UILabel *deviceLabel;
@property (nonatomic, strong)UILabel *operatingsystemLabel;
@property (nonatomic, strong)UILabel *CPULabel;

-(void)simulateViewDidLoad;

@end
