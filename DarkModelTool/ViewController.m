//
//  ViewController.m
//  DarkModelTool
//
//  Created by thor on 2019/9/26.
//  Copyright © 2019 thor. All rights reserved.
//

#import "ViewController.h"
#import "DarkModel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *logo;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // initUI
    [self initUI];
}

- (void)initUI{
    
    // 背景
    self.view.backgroundColor = [DarkModel adaptColor:[UIColor whiteColor] darkColor:[UIColor blackColor]];
  
    // titleLabel
    self.titleLabel.textColor = [DarkModel adaptColor:[UIColor blackColor] darkColor:[UIColor whiteColor]];
    
    // logo
    self.logo.image = [UIImage imageNamed:@"logo"];
    self.logo.layer.cornerRadius = 20;
    self.logo.layer.borderWidth = 5;
    
    // traitCollectionDidChange 只有变化才会调用，所以特殊要求的，要预设一下
    [self setupDarkModel];
}

#pragma mark - 处理一些特殊的情况，比如layer的CGColor、特殊的，明景和暗景造成的文字内容变化等等
-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    [super traitCollectionDidChange:previousTraitCollection];
    
    // darkmodel change
    [self setupDarkModel];
}

#pragma mark - setupDarkModel
- (void)setupDarkModel{
    if ([DarkModel isDarkMode]) {
        [self darkType];
    }else{
        [self lightType];
    }
}

// darkType
- (void)darkType{
    self.titleLabel.text = @"Dark 模式(黑夜)";
    self.logo.layer.borderColor = [UIColor whiteColor].CGColor;
}

// lightType
- (void)lightType{
     self.titleLabel.text = @"Light 模式(白天)";
    self.logo.layer.borderColor = [UIColor grayColor].CGColor;
}



@end
