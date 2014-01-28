//
//  UnderlineLabel.m
//
//  Created by AndyShi on 1/15/14.
//  Copyright (c) 2014 AndyShi. All rights reserved.
//

#import "UnderlineLabel.h"

@implementation UnderlineLabel

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    _underlineEnabled = YES;
    _underlineOffset = 10;
    _underlineColor = [UIColor redColor];
    _underlineHeight = 2;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        _underlineEnabled = YES;
        _underlineOffset = 10;
        _underlineColor = [UIColor redColor];
        _underlineHeight = 2;
    }
    return self;
}


- (void)drawTextInRect:(CGRect)rect
{
    [super drawTextInRect:rect];
    
    CGSize textSize = [[self text] sizeWithFont:[self font]];
    //NSDictionary *attributes = @{NSFontAttributeName: self.font};
    //CGSize anotherSize = [[self text] sizeWithAttributes:attributes];
    CGFloat strikeWidth = textSize.width;
    CGRect lineRect;
    
    if ([self textAlignment] == NSTextAlignmentRight)
    {
        lineRect = CGRectMake(rect.size.width - strikeWidth, rect.size.height/2 + self.underlineOffset, strikeWidth, self.underlineHeight);
    }
    else if ([self textAlignment] == NSTextAlignmentCenter)
    {
        lineRect = CGRectMake(rect.size.width/2 - strikeWidth/2, rect.size.height/2 + self.underlineOffset, strikeWidth, self.underlineHeight);
    }
    else
    {
        lineRect = CGRectMake(0, rect.size.height/2 + self.underlineOffset, strikeWidth, self.underlineHeight);
    }
    
    if (_underlineEnabled)
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, self.underlineColor.CGColor);
        CGContextFillRect(context, lineRect);
    }
}

- (void)setStrikeThroughEnabled:(BOOL)strikeThroughEnabled
{
    
    _underlineEnabled = strikeThroughEnabled;
    
    NSString *tempText = [self.text copy];
    self.text = @"";
    self.text = tempText;
}

@end
