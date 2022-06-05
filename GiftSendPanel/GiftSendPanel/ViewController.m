//
//  ViewController.m
//  GiftSendPanel
//
//  Created by hou hui on 2022/5/10.
//

#import "ViewController.h"
#import "HomeViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *addItemBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.addItemBtn.hidden = NO;
}

- (void)showHomePage {
    HomeViewController *homeVC = [HomeViewController new];
    homeVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:homeVC animated:YES completion:nil];
}

#pragma mark - lazy

- (UIButton *)addItemBtn {
    if (!_addItemBtn) {
        _addItemBtn = [[UIButton alloc] initWithFrame:CGRectMake((self.view.bounds.size.width-80)/2, 400, 80, 40)];
        _addItemBtn.backgroundColor = UIColor.redColor;
        [_addItemBtn setTitle:@"测试页面" forState:UIControlStateNormal];
        [_addItemBtn addTarget:self action:@selector(showHomePage) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_addItemBtn];
    }
    return _addItemBtn;
}


@end
