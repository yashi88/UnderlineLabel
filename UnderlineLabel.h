//
//  UnderlineLabel.h
//
//
//  Created by AndyShi on 1/15/14.
//  Copyright (c) 2014 AndyShi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UnderlineLabel : UILabel

@property (nonatomic) BOOL underlineEnabled;
@property (strong,nonatomic) UIColor *underlineColor;
@property (nonatomic) CGFloat underlineOffset;
@property (nonatomic) CGFloat underlineHeight;

@end
