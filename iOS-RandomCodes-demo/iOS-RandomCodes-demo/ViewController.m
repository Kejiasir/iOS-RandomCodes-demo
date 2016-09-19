//
//  ViewController.m
//  iOS-RandomCodes-demo
//
//  Created by Arvin on 16/9/18.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import "ViewController.h"
#import "YYRandomCodes.h"
#import "UIView+Extension.h"

#define WIDTH [[UIScreen mainScreen] bounds].size.width

@interface ViewController ()<UITextFieldDelegate>

/** 纯代码创建控件 **/
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) YYRandomCodes *randomCodes;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIButton *submitBtn;

/** storyboard创建控件 **/
@property (weak, nonatomic) IBOutlet UITextField *IBTextField;
@property (weak, nonatomic) IBOutlet YYRandomCodes *IBRandomCodes;

@property (nonatomic, copy) NSString *inputCodeStr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    
    [self.view addSubview:self.label = ({
        self.label = [[UILabel alloc] init];
        self.label.text = @"验证码";
        self.label.frame = CGRectMake(15, 100, 60, 35);
        self.label;
    })];
    
    [self.view addSubview:self.textField = ({
        self.textField = [[UITextField alloc] init];
        self.textField.delegate = self;
        self.textField.placeholder = @"请输入验证码";
        [self.textField setClearButtonMode:UITextFieldViewModeWhileEditing];
        self.textField.frame = CGRectMake(CGRectGetMaxX(self.label.frame), 100, WIDTH-30-60-80, 35);
        self.textField;
    })];
    
    [self.view addSubview:self.randomCodes = ({
        CGRect frame = CGRectMake(CGRectGetMaxX(self.textField.frame), 100, 80, 35);
        self.randomCodes = [[YYRandomCodes alloc] initWithFrame:frame];
        __weak typeof(self) weakSelf = self;
        self.randomCodes.CurrentStrBlock = ^(NSString *currentStr) {
            // 获取到当前的随机字符
            weakSelf.inputCodeStr = currentStr;
        };
        self.randomCodes;
    })];
    
    [self.view addSubview:self.lineView = ({
        self.lineView = [[UIView alloc] init];
        self.lineView.backgroundColor = [UIColor lightGrayColor];
        self.lineView.frame = CGRectMake(15, CGRectGetMaxY(self.textField.frame)+5, WIDTH-30, 1);
        self.lineView;
    })];
    
    [self.view addSubview:self.submitBtn = ({
        self.submitBtn = [[UIButton alloc] init];
        [self.submitBtn setEnabled:NO];
        [self.submitBtn setBackgroundColor:[self rgbWithAlpha:.6f]];
        [self.submitBtn setFrame:CGRectMake(50, CGRectGetMaxY(self.lineView.frame)+30, WIDTH-100, 40)];
        [self.submitBtn setTitle:@"提 交" forState:UIControlStateNormal];
        [self.submitBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
        [self.submitBtn.layer setCornerRadius:CGRectGetHeight(self.submitBtn.frame)*.1f];
        [self.submitBtn.layer setMasksToBounds:YES];
        [self.submitBtn addTarget:self action:@selector(submitBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.submitBtn;
    })];
}

- (void)submitBtnClick:(UIButton *)submitBtn {
    if (![self.textField.text isEqualToString:self.inputCodeStr]) {
        [self.view showMessage:@"验证码错误, 请重新输入" duration:2.5f];
    } else {
        [self.view showMessage:@"验证码正确" duration:2.5f];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *replaceStr = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (replaceStr.length > 0) {
        [self.submitBtn setEnabled:YES];
        [self.submitBtn setBackgroundColor:[self rgbWithAlpha:1.f]];
    } else if (replaceStr.length == 0) {
        [self.submitBtn setEnabled:NO];
        [self.submitBtn setBackgroundColor:[self rgbWithAlpha:.6f]];
    }
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    [self.submitBtn setEnabled:NO];
    [self.submitBtn setBackgroundColor:[self rgbWithAlpha:.6f]];
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textField endEditing:YES];
    [self.IBTextField endEditing:YES];
}

- (void)setupView {
    [self.IBRandomCodes.layer setCornerRadius:3.0f];
    [self.IBRandomCodes.layer setMasksToBounds:YES];
}

- (UIColor *)rgbWithAlpha:(CGFloat)alpha {
    return [UIColor colorWithRed:29/255.0f green:130/255.0f blue:250/255.0f alpha:alpha];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
