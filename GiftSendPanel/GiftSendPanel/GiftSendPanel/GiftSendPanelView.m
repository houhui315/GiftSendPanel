//
//  GiftSendPanelView.m
//  GiftSendPanel
//
//  Created by hou hui on 2022/5/10.
//

#import "GiftSendPanelView.h"


@interface GiftSendPanelView ()

@property (nonatomic, strong) NSMutableArray < GiftSendItemView *>*itemViews;

@property (nonatomic, strong) NSMutableArray < GiftSendModel *> *waitModelItems;

@property (nonatomic, strong) NSArray *originYItems;

@end

@implementation GiftSendPanelView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.originYItems = @[@(100),@(50),@(0)];
    }
    return self;
}

- (void)addModel:(GiftSendModel *)model {
    
    GiftSendItemView *itemView = nil;
    for (GiftSendItemView *view in self.itemViews) {
        if ([view.currModel.giftName isEqualToString:model.giftName]) {
            itemView = view;
            break;
        }
    }
    if (!itemView) {
        NSInteger itemViewCount = self.itemViews.count;
        if (itemViewCount >= 3) {
            [self.waitModelItems addObject:model];
        }else{
            
            [self resetViewItemsOriginY];
            CGFloat originY = [self.originYItems[0] floatValue];
            GiftSendItemView *itemView = [[GiftSendItemView alloc] initWithOriginY:originY];
            itemView.originYIndex = 0;
            [itemView resetModel:model];
            [self addSubview:itemView];
            [self.itemViews addObject:itemView];
            [self showAnimate:itemView];
        }
        
    }else{
        itemView.currModel.num += model.num;
        [itemView displayUI];
        [itemView runGiftNumAnimate];
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hideAnimate:) object:itemView];
        [self performSelector:@selector(hideAnimate:) withObject:itemView afterDelay:3];
    }
}


- (void)showAnimate:(GiftSendItemView *)itemView {
    
    CGRect rect = itemView.frame;
    rect.origin.x = - rect.size.width;
    itemView.frame = rect;
    itemView.isAnimateStatus = YES;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        CGRect rect = itemView.frame;
        rect.origin.x = 0;
        itemView.frame = rect;
        
    } completion:^(BOOL finished) {
        
        itemView.isAnimateStatus = NO;
        [self performSelector:@selector(hideAnimate:) withObject:itemView afterDelay:3];
    }];
}

- (void)hideAnimate:(GiftSendItemView *)itemView {
    
    itemView.isAnimateStatus = YES;
    [UIView animateWithDuration:0.25 animations:^{
        
        CGRect rect = itemView.frame;
        rect.origin.x = - rect.size.width;
        itemView.frame = rect;
        
    } completion:^(BOOL finished) {
        
        itemView.isAnimateStatus = NO;
        [self.itemViews removeObject:itemView];
        [itemView removeFromSuperview];
        [self reAddModel];
    }];
}

- (void)resetViewItemsOriginY {
    
    for (NSInteger i = 0; i < self.itemViews.count; i++) {
        GiftSendItemView *view = self.itemViews[i];
        NSInteger originYIndex = view.originYIndex+1;
        if (originYIndex <= 2) {
            
            BOOL found = NO;
            for (GiftSendItemView *fView in self.itemViews) {
                if (fView.originYIndex == originYIndex) {
                    found = YES;
                    break;
                }
            }
            if (!found) {
                CGFloat originY = [self.originYItems[originYIndex] floatValue];
                view.originYIndex = originYIndex;
                [view resetOriginY:originY];
            }
        }
    }
}

- (void)reAddModel {
    if (self.waitModelItems.count) {
        [self resetViewItemsOriginY];
        [self addModel:self.waitModelItems.firstObject];
        [self.waitModelItems removeObjectAtIndex:0];
    }
}


#pragma mark - lazy


- (NSMutableArray<GiftSendModel *> *)waitModelItems {
    if (!_waitModelItems) {
        _waitModelItems = [NSMutableArray array];
    }
    return _waitModelItems;
}

- (NSMutableArray<GiftSendItemView *> *)itemViews {
    if (!_itemViews) {
        _itemViews = [NSMutableArray array];
    }
    return _itemViews;
}

@end
