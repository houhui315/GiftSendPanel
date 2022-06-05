//
//  GiftSendItemView.m
//  GiftSendPanel
//
//  Created by hou hui on 2022/5/10.
//

#import "GiftSendItemView.h"

@interface GiftSendItemView ()

@property (nonatomic, strong) UIImageView *bgView;

@property (nonatomic, strong) UIImageView *avatarView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *subTitleLabel;

@property (nonatomic, strong) UIImageView *giftIconView;

@property (nonatomic, strong) UILabel *giftNumLabel;

@end

@implementation GiftSendItemView

- (instancetype)initWithOriginY:(CGFloat)originY {
    if (self = [super initWithFrame:CGRectMake(-300, originY, 300, 44)]) {
        self.bgView.hidden = NO;
        self.avatarView.hidden = NO;
        self.titleLabel.hidden = NO;
        self.subTitleLabel.hidden = NO;
        self.giftIconView.hidden = NO;
        self.giftNumLabel.hidden = NO;
    }
    return self;
}

- (void)resetModel:(GiftSendModel *)model {
    
    self.currModel = model;
    [self displayUI];
}

- (void)resetOriginY:(CGFloat)originY {
    CGRect rect = self.frame;
    rect.origin.y = originY;
    self.frame = rect;
    [self displayUI];
}

- (void)displayUI {
    
    self.titleLabel.text = self.currModel.senderName;
    self.subTitleLabel.text = [NSString stringWithFormat:@"送给主播%@",self.currModel.giftName];
    self.giftIconView.image = [UIImage imageNamed:self.currModel.giftUrl];
    self.giftNumLabel.text = [NSString stringWithFormat:@"x%ld",self.currModel.num];
    
//    self.titleLabel.text = [NSString stringWithFormat:@"%@%ld-%ld",self.currModel.giftName,self.currModel.num,self.originYIndex];
}

- (void)runGiftNumAnimate {
    if (!CGAffineTransformIsIdentity(self.giftNumLabel.transform)) {
        [self.giftNumLabel.layer removeAllAnimations];
    }
    self.giftNumLabel.transform = CGAffineTransformIdentity;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.giftNumLabel.transform = CGAffineTransformMakeScale(1.5, 1.5);
    } completion:^(BOOL finished) {
        if (finished) {
            self.giftNumLabel.transform = CGAffineTransformIdentity;
        }
    }];
}

#pragma mark - lazy

- (UIImageView *)bgView {
    if (!_bgView) {
        _bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 240, self.bounds.size.height)];
        _bgView.image = [UIImage imageNamed:@"w_liveGiftBack"];
        [self addSubview:_bgView];
    }
    return _bgView;
}

- (UIImageView *)avatarView {
    if (!_avatarView) {
        _avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(5, (self.bounds.size.height-30)/2, 30, 30)];
        _avatarView.image = [UIImage imageNamed:@"LiveDefaultIcon"];
        _avatarView.layer.masksToBounds = true;
        _avatarView.layer.cornerRadius = 30./2;
        [self addSubview:_avatarView];
    }
    return _avatarView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(42, 10, 180, 10)];
        _titleLabel.textColor = UIColor.whiteColor;
        _titleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightBold];
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.titleLabel.frame.origin.x, 24, self.titleLabel.bounds.size.width, 10)];
        _subTitleLabel.textColor = UIColor.whiteColor;
        _subTitleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightBold];
        [self addSubview:_subTitleLabel];
    }
    return _subTitleLabel;
}

- (UIImageView *)giftIconView {
    if (!_giftIconView) {
        _giftIconView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bgView.bounds.size.width-50, (self.bounds.size.height-30)/2, 30, 30)];
        [self addSubview:_giftIconView];
    }
    return _giftIconView;
}

- (UILabel *)giftNumLabel {
    if (!_giftNumLabel) {
        
        _giftNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.bgView.frame)+5, (self.bounds.size.height-20)/2, 60, 20)];
        _giftNumLabel.textColor = [UIColor colorWithRed:236./255 green:211./255 blue:132./255 alpha:1];
        _giftNumLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
        [self addSubview:_giftNumLabel];
    }
    return _giftNumLabel;
}


@end
