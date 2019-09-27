# DarkModelTool

### OVERVIEW：
Designed for apple's dark model, It's a simple example of fitting iOS13 dark model. Yes, it's just a simple example

### Usage
#### 1. First, load 
<pre>
DarkModel.h 
darkModel.m
</pre>
#### 2. Begin to use
<pre>
self.view.backgroundColor = [DarkModel adaptColor:[UIColor whiteColor] darkColor:[UIColor blackColor]];
self.titleLabel.textColor = [DarkModel adaptColor:[UIColor blackColor] darkColor:[UIColor whiteColor]];
</pre>
#### 3. You can tell that the current state is dark model or light model
<pre>
Bool isDarkMode = [DarkModel isDarkMode]
</pre>
#### 4. More options
<pre>
You can use UIColor or RGBColor
+ (UIColor *)adaptColor:(UIColor *)color darkColor:(UIColor *)darkColor;

You can use hexadecimal strings. Default, alpha=1
+ (UIColor *)adaptHexColor:(NSString *)hexColor darkColor:(NSString *)hexDarkColor;

You can use hexadecimal strings and custom alpha values
+ (UIColor *)adaptHexColor:(NSString *)hexColor darkColor:(NSString *)hexDarkColor alpha:(CGFloat)alpha;
</pre>
#### 5. Suggest creating BaseViewController 
<pre>
ps:BaseViewController， Avoid writing this much for every VC
ps:ViewController, In light and dark, text content changes or CGColor changes and other special cases, The ViewController will override and call the parent method, otherwise it can be ignored
=> BaseViewController 
-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{}
- (void)setupDarkModel{}
- (void)darkType{}
- (void)lightType{}
=> ViewController 
1.[self setupDarkModel];
2.Rewrite
- (void)darkType{}
- (void)lightType{}
</pre>
#### 6. The sample is as follows
<pre>
- (void)initUI{

    // background
    self.view.backgroundColor = [DarkModel adaptColor:[UIColor whiteColor] darkColor:[UIColor blackColor]];
  
    // titleLabel
    self.titleLabel.textColor = [DarkModel adaptColor:[UIColor blackColor] darkColor:[UIColor whiteColor]];
    
    // logo
    self.logo.image = [UIImage imageNamed:@"logo"];
    self.logo.layer.cornerRadius = 20;
    self.logo.layer.borderWidth = 5;
    
    // traitCollectionDidChange Only changes will be called, so for special requirements, it should be preset
    [self setupDarkModel];
}

#pragma mark - Handle some special cases, such as CGColor in layer, special, text changes caused by light and dark scenes, etc
-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    [super traitCollectionDidChange:previousTraitCollection];
    
    // darkmodel change
    [self setupDarkModel];
}

#pragma mark - setupDarkModel
- (void)setupDarkModel{

    // Distinguish
    if ([DarkModel isDarkMode]) {
        [self darkType];
    }else{
        [self lightType];
    }
    
}

// darkType
- (void)darkType{
    self.titleLabel.text = @"Dark Pattern (night)";
    self.logo.layer.borderColor = [UIColor whiteColor].CGColor;
}

// lightType
- (void)lightType{
     self.titleLabel.text = @"Light Mode (day)";
    self.logo.layer.borderColor = [UIColor grayColor].CGColor;
}

</pre>
#### Improve
I don't want to use BaseViewController to solve the reuse problem. However, all the methods now thought of will make VC or DarkModel redundant and not concise. if only DarkModel can solve this problem, it will be perfect. if you have a better way, I hope you can share with me.
#### Postscript
You can already download the project, which has detailed examples. 

