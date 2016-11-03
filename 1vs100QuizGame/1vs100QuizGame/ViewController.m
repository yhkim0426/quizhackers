//
//  ViewController.m
//  1vs100QuizGame
//
//  Created by 진호놀이터 on 2016. 11. 3..
//  Copyright © 2016년 진호놀이터. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *baseTimerBar;
@property (weak, nonatomic) IBOutlet UIView *acitvityTimerBar;
@property NSInteger stageCount;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tabBarController.tabBar.hidden = YES;
    
    self.baseTimerBar.layer.cornerRadius = 10.0f;
    self.acitvityTimerBar.layer.cornerRadius = 5.0f;
    
    DataCenter *dataCenter = [DataCenter sharedManager];
    
    dataCenter.
    
    
    
    
    
    
    
    
    
}

-(IBAction)touchInSideOptions:(id)sender{

    UIButton * btn = sender;
    
    if([btn isKindOfClass:[UIButton class]]){
    
        DataCenter *dataCenter = [DataCenter share]
        
        
        
    
        
    }
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
