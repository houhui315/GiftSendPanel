//
//  GiftSendModel.m
//  GiftSendPanel
//
//  Created by hou hui on 2022/5/10.
//

#import "GiftSendModel.h"

@implementation GiftSendModel

- (NSString *)identifier {
    return [NSString stringWithFormat:@"%@_%@",self.senderName,self.giftName];
}

@end
