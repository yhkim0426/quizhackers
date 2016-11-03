
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
@property (weak, nonatomic) IBOutlet UISegmentedControl *currentLevelSegment;
@property NSInteger indexOfSelectedQuiz;
@property NSString *selectedCategoryName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tabBarController.tabBar.hidden = YES;
    
    self.baseTimerBar.layer.cornerRadius = 10.0f;
    self.acitvityTimerBar.layer.cornerRadius = 5.0f;
    
    DataCenter *dataCenter = [DataCenter sharedManager];
    
    NSArray *quizData = [dataCenter loadQuizDataFromPlist];
    
    NSInteger stageCount = [dataCenter getStageCount];
    
    //segment Level Setting
    
    self.currentLevelSegment.selectedSegmentIndex =stageCount;
    //sel.
    NSLog(@"stage ? %ld",stageCount);
    
    NSMutableArray *stageQuizs = [[NSMutableArray alloc]init];
    
    //해당카테고리의 스테이지카운트에 맞는 레벨의 문제를 가지고온다.
   
    for (NSDictionary *quizs in quizData) {
        
        NSArray *quizArray = [quizs objectForKey:@"quizs"];
        
         NSInteger  checkLevelIndex = 0;
        for (NSDictionary*quiz in quizArray) {
            
            NSNumber *outPutLevel = [quiz objectForKey:@"level"];
            NSInteger level = [outPutLevel integerValue];
            
            if(stageCount==level){
                self.selectedCategoryName =[quizs objectForKey:@"category"];
                NSLog(@"%@",self.selectedCategoryName);
                NSNumber *num = [NSNumber numberWithInteger:checkLevelIndex];
                NSLog(@"%ld",self.indexOfSelectedQuiz);
                NSLog(@"%ld",checkLevelIndex);
                                NSDictionary *dic =@{@"quiz":quiz,@"index":num};
                [stageQuizs addObject:dic];
                // NSLog(@"%@",[stageQuizs objectAtIndex:0]);
            }
            
            checkLevelIndex++;
        }
        
        
        }
        
        
        
        
        
        
        
        
      
    
    
    NSUInteger randomValue = arc4random_uniform((int)stageQuizs.count);
    NSLog(@"%@, %ld",[stageQuizs objectAtIndex:randomValue], randomValue);
    
   NSDictionary *selectedQuizDictionary = [stageQuizs objectAtIndex:randomValue];
    
    NSDictionary *selectedQuiz =[selectedQuizDictionary objectForKey:@"quiz"];
  NSString *imageURL = [selectedQuiz objectForKey:@"imageURL"];
    NSNumber *indexNumber = [selectedQuizDictionary objectForKey:@"index"];
    self.indexOfSelectedQuiz = [indexNumber integerValue];
    
    NSLog(@"%ld",self.indexOfSelectedQuiz);
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
    
    NSLog(@"%@",self.option1Button.titleLabel.text);
    
    [self.option1Button setTitle:[optionArray objectAtIndex:0] forState:UIControlStateNormal];
   [self.option2Button setTitle:[optionArray objectAtIndex:1] forState:UIControlStateNormal];
   [self.option3Button setTitle:[optionArray objectAtIndex:2] forState:UIControlStateNormal];
    
     NSLog(@"%@",self.option1Button.titleLabel.text);
}


-(IBAction)touchInSideOptions:(id)sender{

    UIButton * btn = sender;
    BOOL isCollectAnswer=NO;

    if([btn isKindOfClass:[UIButton class]]){
    
        DataCenter *dataCenter = [DataCenter sharedManager];
        
        
        isCollectAnswer = [dataCenter checkAnswer:btn.tag at:self.indexOfSelectedQuiz categoryName:self.selectedCategoryName];
        
       
        
        
        
    }
    
    NSLog(@"%d",isCollectAnswer);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
