[![Build Status](https://travis-ci.org/Kejiasir/iOS-RandomCodes-demo.svg?branch=master)](https://travis-ci.org/Kejiasir/iOS-RandomCodes-demo)
[![CocoaPods](https://img.shields.io/cocoapods/v/YYRandomCodes.svg)](http://cocoadocs.org/docsets/YYRandomCodes)
[![CocoaPods](https://img.shields.io/cocoapods/p/YYRandomCodes.svg)](http://cocoadocs.org/docsets/YYRandomCodes)
[![CocoaPods](https://img.shields.io/cocoapods/l/YYRandomCodes.svg)](https://raw.githubusercontent.com/kejiasir/YYRandomCodes/master/LICENSE)

## 随机字符的图片验证码

### 集成方法
* 第一, 直接把demo中的 `YYRandomCodes` 文件夹拷贝到你的项目
* 第二, 使用 `CocoaPods` 安装, `pod 'YYRandomCodes', '~> 0.1.0'`
* 在需要使用的类中导入主头文件 `import "YYRandomCodes.h"` 即可

### 使用方法
```objc
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
```
### 具体的可以参照demo, 支持 `纯代码 / storyboard / xib` 创建方式


### Screenshot
<img src="001.gif?v=3&s=100" alt="GitHub" title="demo预览效果" width="260" height="480"/>


## License
**YYRandomCodes 使用 MIT 许可证，详情见 LICENSE 文件**
