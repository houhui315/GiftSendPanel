//
//  GiftSendItemView.h
//  GiftSendPanel
//
//  Created by hou hui on 2022/5/10.
//

#import <UIKit/UIKit.h>
#import "GiftSendModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GiftSendItemView : UIView

- (instancetype)initWithOriginY:(CGFloat)originY;

- (void)resetModel:(GiftSendModel *)model;

- (void)displayUI;

- (void)resetOriginY:(CGFloat)originY;

- (void)runGiftNumAnimate;

@property (nonatomic, assign) NSInteger originYIndex;

@property (nonatomic, strong) GiftSendModel *currModel;

@property (nonatomic, assign) BOOL isAnimateStatus;

@end

NS_ASSUME_NONNULL_END
