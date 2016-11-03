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
@property (weak, nonatomic) IBOutlet UILabel *textQuizLabel;
@property (weak, nonatomic) IBOutlet UILabel *imageQuizLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageQuizImageView;
@property NSInteger stageCount;
@property (weak, nonatomic) IBOutlet UIButton *option1Button;
@property (weak, nonatomic) IBOutlet UIButton *option2Button;
@property (weak, nonatomic) IBOutlet UIButton *option3Button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tabBarController.tabBar.hidden = YES;
    
    self.baseTimerBar.layer.cornerRadius = 10.0f;
    self.acitvityTimerBar.layer.cornerRadius = 5.0f;
    
    DataCenter *dataCenter = [DataCenter sharedManager];
    
    NSArray *quizData = [dataCenter getQuizData];
    
    NSInteger stageCount = [dataCenter getStageCount];
    
    NSLog(@"stage ? %ld",stageCount);
    
    NSMutableArray *stageQuizs = [[NSMutableArray alloc]init];
    
    for (NSDictionary *quiz in quizData) {
        
       
       NSNumber *outPutLevel = [quiz objectForKey:@"level"];
        NSInteger level = [outPutLevel integerValue];
        
        if(stageCount==level){
            
            [stageQuizs addObject:quiz];
          // NSLog(@"%@",[stageQuizs objectAtIndex:0]);
        }
        
    }
    
    NSUInteger randomValue = arc4random_uniform((int)stageQuizs.count);
    NSLog(@"%@, %ld",[stageQuizs objectAtIndex:randomValue], randomValue);
    
    NSDictionary *selectedQuiz = [stageQuizs objectAtIndex:randomValue];
    
  NSString *imageURL = [selectedQuiz objectForKey:@"imageURL"];
    
    if([imageURL isEqualToString:@""]){
    
        self.imageQuizLabel.hidden = YES;
        self.imageQuizImageView.hidden= YES;
        self.textQuizLabel.text = [selectedQuiz objectForKey:@"problem"];
        
    
    }else{
    
        self.textQuizLabel.hidden = YES;
        self.imageQuizLabel.text = [selectedQuiz objectForKey:@"problem"];
        self.imageQuizImageView.image = [UIImage imageNamed:[selectedQuiz objectForKey:@"imageURL"]];
        

    
    }
        NSArray *optionArray = [selectedQuiz objectForKey:@"option"];
    
    NSLog(@"%@",[optionArray objectAtIndex:0]);
   
    self.option1Button.titleLabel.text =[optionArray objectAtIndex:0];
    self.option2Button.titleLabel.text =[optionArray objectAtIndex:1];
    self.option3Button.titleLabel.text =[optionArray objectAtIndex:2];
    
    
}


-(IBAction)touchInSideOptions:(id)sender{

    UIButton * btn = sender;
    
    if([btn isKindOfClass:[UIButton class]]){
    
        //DataCenter *dataCenter = [DataCenter share]
        
        
        
    
        
    }
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
