//
//  GiftSendModel.h
//  GiftSendPanel
//
//  Created by hou hui on 2022/5/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GiftSendModel : NSObject

- (NSString *)identifier;

@property (nonatomic, strong) NSString *senderName;

@property (nonatomic, strong) NSString *receivedName;

@property (nonatomic, strong) NSString *giftName;

@property (nonatomic, strong) NSString *giftUrl;

@property (nonatomic, assign) NSInteger giftCount;

@property (nonatomic, assign) NSInteger num;

@end

NS_ASSUME_NONNULL_END
