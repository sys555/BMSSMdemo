//
//  NetworkView.h
//  BMSSMdemo
//
//  Created by iDev on 6/9/16.
//  Copyright © 2016 iDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NetworkView : UIView

@property (nonatomic, strong)UILabel *CellularLabel;
@property (nonatomic, strong)UILabel *WiFiLabel;
@property (nonatomic, strong)UILabel *NetworkLabel;

-(void)simulateViewDidLoad;

@end
