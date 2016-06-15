//
//  SummaryView.m
//  BMSSMdemo
//
//  Created by iDev on 6/9/16.
//  Copyright © 2016 iDev. All rights reserved.
//

#import "SummaryView.h"

@implementation SummaryView

-(void)simulateViewDidLoad{
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //传递出去
    [[self nextResponder] touchesBegan:touches withEvent:event];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //传递出去
    [[self nextResponder] touchesEnded:touches withEvent:event];
}

@end
