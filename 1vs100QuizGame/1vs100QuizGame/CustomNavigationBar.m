//
//  CustomNavigationBar.m
//  CustumNavigationBar
//
//  Created by 진호놀이터 on 2016. 10. 31..
//  Copyright © 2016년 진호놀이터. All rights reserved.
//

#import "CustomNavigationBar.h"


@interface CustomNavigationBar ()
@property UIImageView *mainImageView;
@property UIButton  *leftButton;
@property UIButton  *rightButton;
@property UILabel   *mainLabel;

@end
@implementation CustomNavigationBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
    // image를받는 델리게이트를 init 안에 create에서 해주기떄문에 생성할때 델리게이트를 함께넣어줘야한다 나중에넣어주면 델리게이트 발생하지않음
- (instancetype)initWithStyle:(UICustomNavigationBarStyle)style barColor:(UICustomNavigationBarColor)barColor mainLogo:(NSString*)logo delegate:(id<UICustomNavigationBarDelegate>)delegate {

    
    self = [super init];
    
    if(self){
        
        [self setDelegate:delegate];
        [self createNavigationBar:style barColor:barColor mainLogo:logo];
        [self layoutSubviews];
    
    }

    return self;
}

//생성

- (void)createNavigationBar:(UICustomNavigationBarStyle)style barColor:(UICustomNavigationBarColor)barColor mainLogo:(NSString*)logo{

   
    UIImage *mainImage = [UIImage imageNamed:logo];
    if([mainImage isKindOfClass:[UIImage class]]){
     self.mainImageView = [[UIImageView alloc]init];
    self.mainImageView.image =mainImage;
        [self addSubview:self.mainImageView];

    }else{
        
        self.mainLabel = [[UILabel alloc]init];
        self.mainLabel.text = logo;
        self.mainLabel.textColor =[UIColor whiteColor];
        self.mainLabel.textAlignment=NSTextAlignmentCenter;
        [self addSubview:self.mainLabel];
    }
    
    
    switch (style) {
        case UICustomNavigationBarNomalStyle:
            
            break;
        case UICustomNavigationBarLeftButtonStyle:
            
            self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.leftButton addTarget:self action:@selector(onTouchInSideLeftButton:) forControlEvents:UIControlEventTouchUpInside];
            [self setLeftButtonImage];
            
            [self addSubview:self.leftButton];
            
            break;
         case UICustomNavigationBarRightButtonStyle:
            
            self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.rightButton addTarget:self action:@selector(onTouchInSideRightButton:) forControlEvents:UIControlEventTouchUpInside];
            [self setRightButtonImage];
            [self addSubview:self.rightButton];

            break;
        case UICustomNavigationBarLeftRightButtonStyle:
            
            self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
            self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
            
            [self.leftButton addTarget:self action:@selector(onTouchInSideLeftButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.rightButton addTarget:self action:@selector(onTouchInSideRightButton:) forControlEvents:UIControlEventTouchUpInside];
            [self setLeftButtonImage];
             [self setRightButtonImage];
            [self addSubview:self.leftButton];
            [self addSubview:self.rightButton];
            
            break;
            
        default:
            break;
    }

    switch (barColor) {
        case 0:
            self.backgroundColor =[UIColor colorWithRed:225.0f/255.0f green:63.0f/255.0f blue:62.0f/255.0f alpha:1];
            break;
        case 1:
            self.backgroundColor =[UIColor colorWithRed:62.0f/255.0f green:173.0f/255.0f blue:121.0f/255.0f alpha:1];
            break;
            
        case 2:
            self.backgroundColor =[UIColor colorWithRed:38.0f/255.0f green:138.0f/255.0f blue:251.0f/255.0f alpha:1];
            break;
            
        default:
            self.backgroundColor =[UIColor colorWithRed:248.0f/255.0f green:221.0f/255.0f blue:10.0f/255.0f alpha:1];
            break;
    }
    
}
//-(void)setLeftButtonImage:(NSString *)imageName{
//
//    UIImage *image = [UIImage imageNamed:imageName];
//    if([image isKindOfClass:[UIImage class]]){
//        [self.leftButton setBackgroundImage:image forState:UIControlStateNormal];
//    }else{
//    
//        [self.leftButton setTitle:imageName forState:UIControlStateNormal];
//    
//    }
//    
//
//    
//}
//-(void)setRightButtonImage:(NSString *)imageName{
//    
//    UIImage *image = [UIImage imageNamed:imageName];
//    if([image isKindOfClass:[UIImage class]]){
//        [self.rightButton setBackgroundImage:image forState:UIControlStateNormal];
//    }else{
//        
//        [self.rightButton setTitle:imageName forState:UIControlStateNormal];
//        
//    }
//    
//    
//    
//}


- (void)setLeftButtonImage{
   
    NSLog(@"들어가쯤");
    NSString *imageName;
    if ([self.delegate respondsToSelector:@selector(uiCustomNavigationBarLeftButtonImageName)]) {
        
     imageName  = [self.delegate uiCustomNavigationBarLeftButtonImageName];
        
        UIImage *image = [UIImage imageNamed:imageName];
        
        if([image isKindOfClass:[UIImage class]]){
        
            [self.leftButton setBackgroundImage:image forState:UIControlStateNormal];
            
            
        }else{
            
            [self.leftButton setTitle:imageName forState:UIControlStateNormal];
            
            
        }
        
       
        
            }
    
    
}
- (void)setRightButtonImage{
    
    NSLog(@"들어가쯤");
    NSString *imageName;
    if ([self.delegate respondsToSelector:@selector(uiCustomNavigationBarRightButtonImageName)]) {
        
        //뷰컨트롤에서 받아올게  string만받아오고 viewController에서 터치같은것을 받지않아도 될때 self를 안써도 될 것같다.
        imageName  = [self.delegate uiCustomNavigationBarRightButtonImageName];
        
        UIImage *image = [UIImage imageNamed:imageName];
        
        if([image isKindOfClass:[UIImage class]]){
            
            [self.rightButton setBackgroundImage:image forState:UIControlStateNormal];
            
            
        }else{
            
            [self.rightButton setTitle:imageName forState:UIControlStateNormal];
        }
    }
    
}


- (void)onTouchInSideLeftButton:(UIButton *)seder{

    if([self.delegate respondsToSelector:@selector(didSelectedLeftButton:)]){
            //터치를 받아오기위해서 여기서는 터치값을 받아올 수없어서>.?
        
          [self.delegate didSelectedLeftButton:self];
    }
}

- (void)onTouchInSideRightButton:(UIButton *)seder{
    
    if([self.delegate respondsToSelector:@selector(didSelectedRightButton:)]){
          [self.delegate didSelectedRightButton:self];
    }
}



- (void)updateLayout{

       self.frame = CGRectMake(0, 25,[UIScreen mainScreen].bounds.size.width, 80);
    if (self.mainImageView!=nil) {
        self.mainImageView.frame = CGRectMake(self.center.x-( self.frame.size.width/2)/2,self.center.y-(self.frame.size.height)/4-25, self.frame.size.width/2, self.frame.size.height/2);
    }else{
    
        self.mainLabel.frame = CGRectMake(self.center.x-( self.frame.size.width/2)/2,self.center.y-(self.frame.size.height)/3-25, self.frame.size.width/2, self.frame.size.height/1.5);
        self.mainLabel.font =[UIFont systemFontOfSize:self.mainLabel.frame.size.height-8];
         }
    
       self.leftButton.frame = CGRectMake(self.frame.origin.x+10,self.frame.origin.y-20, self.frame.size.width/4,self.frame.size.height);
       self.rightButton.frame = CGRectMake(self.frame.size.width-self.frame.size.width/4, self.frame.origin.y-20,self.frame.size.width/4, self.frame.size.height);
    
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    [self updateLayout];

}

@end
