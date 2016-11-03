//
//  CustomNavigationBar.h
//  CustumNavigationBar
//
//  Created by 진호놀이터 on 2016. 10. 31..
//  Copyright © 2016년 진호놀이터. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UICustomNavigationBarDelegate ;




@interface CustomNavigationBar : UIView

@property (nonatomic,weak) id<UICustomNavigationBarDelegate>delegate;


//노멀스타일,왼쪽버튼,오른쪽버튼,양쪽버튼스타일
  typedef NS_ENUM(NSInteger,UICustomNavigationBarStyle){

    UICustomNavigationBarNomalStyle=0,
    UICustomNavigationBarLeftButtonStyle,
    UICustomNavigationBarRightButtonStyle,
    UICustomNavigationBarLeftRightButtonStyle
    
  };

typedef NS_ENUM(NSInteger,UICustomNavigationBarColor){
    
    UICustomNavigationBarRedColor=0,
    UICustomNavigationBarGreenColor,
    UICustomNavigationBarBlueColor
    
};

- (instancetype)initWithStyle:(UICustomNavigationBarStyle)style barColor:(UICustomNavigationBarColor)barColor mainLogo:(NSString*)logo delegate:(id<UICustomNavigationBarDelegate>)delegate;
//- (void)setLeftButtonImage:(NSString *)imageName;
//- (void)setRightButtonImage:(NSString *)imageName;

@end

@protocol UICustomNavigationBarDelegate <NSObject>
@optional

- (void)didSelectedLeftButton:(CustomNavigationBar*)customNavigationBar;
- (void)didSelectedRightButton:(CustomNavigationBar*)customNavigationBar;
- (NSString *)uiCustomNavigationBarLeftButtonImageName;
- (NSString *)uiCustomNavigationBarRightButtonImageName;

@end
