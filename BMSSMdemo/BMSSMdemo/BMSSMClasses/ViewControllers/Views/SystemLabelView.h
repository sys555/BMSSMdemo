//
//  SystemLabelView.h
//  BMSSMdemo
//
//  Created by iDev on 6/9/16.
//  Copyright © 2016 iDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SystemLabelView : UIView

@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *value;
@property (nonatomic)BOOL isBlackBackground;
@property (nonatomic)BOOL isShowImageView;
@property (nonatomic)BOOL isGreedImage;

-(void)simulateViewDidLoad;

@end
