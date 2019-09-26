# DarkModelTool

### OVERVIEW：
Designed for apple's dark model, It's a simple example of fitting iOS13 dark model. Yes, it's just a simple example

### Usage
##### 1.First, load 
<pre>
DarkModel.h 
darkModel.m
</pre>
##### 2.Direct use of
<pre>
self.view.backgroundColor = [DarkModel adaptColor:[UIColor whiteColor] darkColor:[UIColor blackColor]];
self.titleLabel.textColor = [DarkModel adaptColor:[UIColor blackColor] darkColor:[UIColor whiteColor]];
</pre>
##### 3.You can tell that the current state is dark model or light model
<pre>
Bool isDarkMode = [DarkModel isDarkMode]
</pre>
##### 4.The sample is as follows
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
###### You can already download the project, which has detailed examples. 
###### The documents in the project are in Chinese, don't ask me why, if you must ask, ask is 'taolu'
