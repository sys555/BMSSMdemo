//
//  BMSSMScrollView.m
//  BMSSMdemo
//
//  Created by iDev on 6/14/16.
//  Copyright © 2016 iDev. All rights reserved.
//

#import "BMSSMScrollView.h"

@implementation BMSSMScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //传递出去
    [[self nextResponder] touchesBegan:touches withEvent:event];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //传递出去
    [[self nextResponder] touchesEnded:touches withEvent:event];
}

@end
