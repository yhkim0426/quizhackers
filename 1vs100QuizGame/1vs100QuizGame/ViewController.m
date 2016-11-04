
//
//  ViewController.m
//  1vs100QuizGame
//
//  Created by 진호놀이터 on 2016. 11. 3..
//  Copyright © 2016년 진호놀이터. All rights reserved.
//

#import "ViewController.h"
#import "BIZCircularProgressView.h"

@interface ViewController ()  <ProgressViewHandlerDelegate>

@property (nonatomic, strong) BIZCircularProgressView *circularProgressViewForCode;
@property (nonatomic, strong) BIZProgressViewHandler *progressViewHandlerForCode;
@property (nonatomic, strong) BIZProgressViewHandler *progressViewHandlerForStoryboard;


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

    // 타이머 값 셋팅 및 호출 시작
    self.circularProgressViewForCode = [[BIZCircularProgressView alloc] initWithFrame:CGRectMake(self.view.center.x-75, 100, 150, 150)];
    [self.view addSubview:self.circularProgressViewForCode];
    self.circularProgressViewForCode.progressLineColor = [UIColor blackColor];
    self.circularProgressViewForCode.circleBackgroundColor = [UIColor yellowColor];
    self.circularProgressViewForCode.progressLineWidth = 5;
    self.circularProgressViewForCode.textLabel.textColor = [UIColor blackColor];
    self.circularProgressViewForCode.textLabel.font = [UIFont boldSystemFontOfSize:25];
    self.progressViewHandlerForCode = [[BIZProgressViewHandler alloc] initWithProgressView:self.circularProgressViewForCode minValue:0 maxValue:15];
    [self.progressViewHandlerForCode start];
    self.progressViewHandlerForCode.liveProgress = YES;
    self.progressViewHandlerForCode.delegate = self;
    
    // DataCenter
    DataCenter *dataCenter = [DataCenter sharedManager];
    NSArray *quizData = [dataCenter loadQuizDataFromPlist];
    NSInteger stageCount = [dataCenter getStageCount];
    NSLog(@"%ld",[dataCenter getNumberOfCategory]);
    
    NSDictionary *quizs = [quizData objectAtIndex:[dataCenter getSelectedCategoryIndex]];
       //segment Level Setting
    self.currentLevelSegment.selectedSegmentIndex = stageCount;
    NSLog(@"stage ? %ld",stageCount);
    NSMutableArray *stageQuizs = [[NSMutableArray alloc]init];
    
    //해당카테고리의 스테이지카운트에 맞는 레벨의 문제를 가지고온다.
    NSArray *quizArray = [quizs objectForKey:@"quizs"];
    NSInteger  checkLevelIndex = 0;
    
    for (NSDictionary*quiz in quizArray) {
        NSNumber *outPutLevel = [quiz objectForKey:@"level"];
        NSInteger level = [outPutLevel integerValue];
        NSLog(@"%ld",level);
        if(stageCount == level){
            self.selectedCategoryName = [quizs objectForKey:@"category"];

            //NSLog(@"%@",self.selectedCategoryName);
           // NSLog(@"%ld")
           
            //NSLog(@"%ld",self.indexOfSelectedQuiz);
            //NSLog(@"%ld",checkLevelIndex);

            NSNumber *num = [NSNumber numberWithInteger:checkLevelIndex];

            NSDictionary *dic =@{@"quiz":quiz,@"index":num};
            [stageQuizs addObject:dic];
            // NSLog(@"%@",[stageQuizs objectAtIndex:0]);
        }
        checkLevelIndex++;
    }
    NSLog(@"%ld",stageQuizs.count);
    NSUInteger randomValue = arc4random_uniform((int)stageQuizs.count);
    NSLog(@"%@, %ld",[stageQuizs objectAtIndex:randomValue], randomValue);
    NSDictionary *selectedQuizDictionary = [stageQuizs objectAtIndex:randomValue];
    NSDictionary *selectedQuiz =[selectedQuizDictionary objectForKey:@"quiz"];
    NSString *imageURL = [selectedQuiz objectForKey:@"imageURL"];
    NSNumber *indexNumber = [selectedQuizDictionary objectForKey:@"index"];
    self.indexOfSelectedQuiz = [indexNumber integerValue];
    
    NSLog(@"indexedSelectedItem %ld",self.indexOfSelectedQuiz);
    
    if ([imageURL isEqualToString:@""]) {
        self.imageQuizLabel.hidden = YES;
        self.imageQuizImageView.hidden= YES;
        self.textQuizLabel.lineBreakMode = UILineBreakModeWordWrap;
        self.textQuizLabel.numberOfLines = 0;
        self.textQuizLabel.text = [selectedQuiz objectForKey:@"problem"];
    } else {
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

// 문제 답을 탭 했을 시 정답 오답 처리 후 전달
- (IBAction)touchInSideOptions:(id)sender {
    DataCenter *dataCenter = [DataCenter sharedManager];
    UIButton * btn = sender;
    BOOL isCollectAnswer=NO;
    NSLog(@"btn tag : %ld",btn.tag);
    NSLog(@"indexQUiz ; %ld",self.indexOfSelectedQuiz);
    NSLog(@"categoryName : %@",self.selectedCategoryName);
    if([btn isKindOfClass:[UIButton class]]){
        
        NSLog(@"indexOfselectedquiz %ld", self.indexOfSelectedQuiz);
        isCollectAnswer = [dataCenter checkAnswer:btn.tag
                                             at:self.indexOfSelectedQuiz
                                     categoryName:self.selectedCategoryName];
    }
    NSLog(@"%d",isCollectAnswer);
    
    if (isCollectAnswer == 1) {
        [self.progressViewHandlerForCode stop];
        [dataCenter plusOneStageCount];
        if ([dataCenter getStageCount] == 9) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"해커톤 힘들다" message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:alertAction];
            [self presentViewController:alertController animated:YES completion:nil];
            
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ViewController *vc =   [storyBoard instantiateViewControllerWithIdentifier:@"TableViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *vc =   [storyBoard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self.navigationController pushViewController:vc animated:YES];
        }
    else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"당신은 빠가입니다" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:alertAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *vc =   [storyBoard  instantiateInitialViewController];
    
        [self.navigationController pushViewController:vc animated:YES];
    }
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 타이머 완료시 델리게이트 처리
- (void)progressViewHandler:(BIZProgressViewHandler *)progressViewHandler didFinishProgressForProgressView:(BIZCircularProgressView *)progressView {

    if (self.progressViewHandlerForCode.current < 0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Yellow progress is completed" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:alertAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

@end
