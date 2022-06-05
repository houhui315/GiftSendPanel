//
//  HomeViewController.m
//  GiftSendPanel
//
//  Created by hou hui on 2022/5/11.
//

#import "HomeViewController.h"
#import "GiftSendPanelView.h"

@interface HomeViewController ()

@property (nonatomic, strong) GiftSendPanelView *panelView;
@property (nonatomic, strong) UIButton *addItemBtn;
@property (nonatomic, strong) UIButton *backBtn;

@property (nonatomic, strong) NSArray *giftItems;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    self.panelView.hidden = NO;
    self.addItemBtn.hidden = NO;
    self.backBtn.hidden = NO;
    self.giftItems = @[
        @{@"name":@"松果",@"icon":@"songguo"},
        @{@"name":@"花束",@"icon":@"huasu"},
        @{@"name":@"果汁",@"icon":@"guozhi"},
        @{@"name":@"棒棒糖",@"icon":@"bangbangtang"},
        @{@"name":@"泡泡糖",@"icon":@"paopaotang"}
    ];
}


- (void)addItemBtnTouch {
    
    GiftSendModel *model = [GiftSendModel new];
    model.senderName = @"张三";
    NSDictionary *gift = self.giftItems[random()%5];
    model.giftName = gift[@"name"];
    model.giftUrl = gift[@"icon"];
    model.num = 1;
    [self.panelView addModel:model];
    
}

- (void)backAction {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - lazy

- (GiftSendPanelView *)panelView {
    if (!_panelView) {
        _panelView = [[GiftSendPanelView alloc] initWithFrame:CGRectMake(0, 100, 300, 200)];
        [self.view addSubview:_panelView];
    }
    return _panelView;
}

- (UIButton *)addItemBtn {
    if (!_addItemBtn) {
        _addItemBtn = [[UIButton alloc] initWithFrame:CGRectMake((self.view.bounds.size.width-80)/2, 400, 80, 40)];
        _addItemBtn.backgroundColor = UIColor.greenColor;
        [_addItemBtn setTitle:@"添加数据" forState:UIControlStateNormal];
        [_addItemBtn addTarget:self action:@selector(addItemBtnTouch) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_addItemBtn];
    }
    return _addItemBtn;
}

- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [[UIButton alloc] initWithFrame:CGRectMake((self.view.bounds.size.width-80)/2, 500, 80, 40)];
        _backBtn.backgroundColor = UIColor.blueColor;
        [_backBtn setTitle:@"离开页面" forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_backBtn];
    }
    return _backBtn;
}

@end
