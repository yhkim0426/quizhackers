//
//  DataCenter.m
//  1vs100QuizGame
//
//  Created by Nexus_MYT on 2016. 11. 3..
//  Copyright © 2016년 진호놀이터. All rights reserved.
//

#import "DataCenter.h"

@interface DataCenter ()

@property NSArray *quizData;
@property NSInteger stageCount;
@property NSInteger currentSelectedCategoryIndex;
@end

@implementation DataCenter

+ (id)sharedManager {
    static DataCenter * dataCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[self alloc] init];
    });
    
    return dataCenter;
}

- (id)init {
    if ([super init]) {
        self.stageCount = 0;
        self.quizData = @[
                            @{@"category":@"common",
                              @"quizs":@[
                              @{
                                  @"problem":@"스파게티 까르보나라에서 까르보나라의 어원은?",
                                  @"option":@[@"숯", @"크림", @"달걀 노른자"],
                                  @"answer":@(0),
                                  @"detail":@"이탈리아어 '카르보네(숯, Carbone)' 에서 유래, 이탈리아에서 숯을 굽던 사람들이 만들어 먹기 시작했다고 함",
                                  @"level":@(2),
                                  @"imageURL":@""
                                  },
                              @{
                                  @"problem":@"가장 많은 층수의 건물은?",
                                  @"option":@[@"타이베이-타이베이금융센터", @"시카고-시어스타워", @"뉴욕-엠파이어스테이트빌딩"],
                                  @"answer":@(1),
                                  @"detail":@"순서대로 101층,108층,102층",
                                  @"level":@(2),
                                  @"imageURL":@""
                                  },
                              @{
                                  @"problem":@"'도미솔 도미솔 라라라솔 파파파 미미미 레레레도'에 나오지 않는 것은?",
                                  @"option":@[@"숟가락", @"젓가락", @"윷가락"],
                                  @"answer":@(0),
                                  @"detail":@"동요 <똑같아요>의 계이름. 무엇이 무엇이 똑같은가 / 젓가락 두 짝이 똑같아요. 무엇이 무엇이 똑같은가 / 윷가락 네 짝이 똑같아요",
                                  @"level":@(0),
                                  @"imageURL":@""
                                  },
                              @{
                                  @"problem":@"나는 알프스 산맥을 넘지 않았다. 나는?",
                                  @"option":@[@"한니발", @"칭기즈칸", @"나폴레옹"],
                                  @"answer":@(1),
                                  @"detail":@"",
                                  @"level":@(0),
                                  @"imageURL":@""
                                  },
                              @{
                                  @"problem":@"청소년보호법에서는 청소년을 만 19세 미만으로 규정한다. 그렇다면, 소년법에서 소년은?",
                                  @"option":@[@"13세 미만", @"15세 미만", @"19세 미만"],
                                  @"answer":@(2),
                                  @"detail":@"소년법 제1장 제2조 中 <이 법에서 ""소년""이란 19세 미만인 자를 말하며, ""보호자""란 법률상 감호교육을 할 의무가 있는 자 또는 현재 감호하는 자를 말한다>",
                                  @"level":@(1),
                                  @"imageURL":@""
                                  },
                              @{
                                  @"problem":@"적으로부터 자신을 보호하기 위해 몸 색깔을 바꾸는 동물이 아닌 것은?",
                                  @"option":@[@"불가사리", @"문어", @"개구리"],
                                  @"answer":@(0),
                                  @"detail":@"불가사리는 생태학적으로는 천적이 없어서, 생물학적으로는 색깔을 바꿀 수 없는 색소포가 없기 때문에 몸 색깔을 바꾸지 않는다.",
                                  @"level":@(1),
                                  @"imageURL":@""
                                  },
                              @{
                                  @"problem":@"카이사르가 <주사위는 던져졌다>라는 말을 하고 건넌 루비콘 강은 어디에 위치해 있는가?",
                                  @"option":@[@"터키", @"그리스", @"이탈리아"],
                                  @"answer":@(2),
                                  @"detail":@"<루비콘 강> - 이탈리아 북부 리미니 부근에서 아드리아 해로 흘러드는 강.",
                                  @"level":@(1),
                                  @"imageURL":@""
                                  },
                              @{
                                  @"problem":@"동요 <오빠 생각>에서 뜸북새가 우는 장소는?",
                                  @"option":@[@"숲", @"논", @"밭"],
                                  @"answer":@(1),
                                  @"detail":@"뜸북 뜸북 뜸북새 논에서 울고~",
                                  @"level":@(0),
                                  @"imageURL":@""
                                  },
                              @{
                                  @"problem":@"우리나라에서 유래되지 않은 것은?",
                                  @"option":@[@"이전투구", @"이판사판", @"화룡점정"],
                                  @"answer":@(2),
                                  @"detail":@"",
                                  @"level":@(0),
                                  @"imageURL":@""
                                  },
                              @{
                                  @"problem":@"알라딘과 이상한 램프에서 알라딘은?",
                                  @"option":@[@"이란소년", @"중국소년", @"인도소년"],
                                  @"answer":@(1),
                                  @"detail":@"",
                                  @"level":@(0),
                                  @"imageURL":@""
                                  },
                              @{
                                  @"problem":@"장군이 한 말이 아닌 것은 ?",
                                  @"option":@[@"나의 사전에 불가능이란 없다", @"주사위는 던져졌다", @"나는생각한다,고로 존재한다"],
                                  @"answer":@(2),
                                  @"detail":@"",
                                  @"level":@(0),
                                  @"imageURL":@""
                                  },
                              @{
                                  @"problem":@"사람이름이 아닌 것은?",
                                  @"option":@[@"옴의법칙", @"돌턴의 법칙", @"코사인의 법칙"],
                                  @"answer":@(2),
                                  @"detail":@"",
                                  @"level":@(0),
                                  @"imageURL":@""
                                  },
                              @{
                                  @"problem":@"편지 형식의 소설이 아닌 것은?",
                                  @"option":@[@"진웹스터의 <키다리아저씨>", @"괴테의 <젊은 베르테르의 슬픔>", @"스콧 피츠제럴드의 <위대한 개츠비>"],
                                  @"answer":@(2),
                                  @"detail":@"",
                                  @"level":@(0),
                                  @"imageURL":@""
                                  },
                              @{
                                  @"problem":@"김제동과 가장 닮았다고 생각하는 인물은?",
                                  @"option":@[@"싸이", @"조영남", @"박휘순"],
                                  @"answer":@(2),
                                  @"detail":@"",
                                  @"level":@(0),
                                  @"imageURL":@""
                                  },
                              @{
                                  @"problem":@"남자친구가 가장 해줬으면 하는 스킨십은?",
                                  @"option":@[@"머리 쓰다듬어 주기", @"뒤에서 껴안아 주기", @"가볍게 뽀뽀해주기"],
                                  @"answer":@(1),
                                  @"detail":@"",
                                  @"level":@(1),
                                  @"imageURL":@""
                                  }
                              ]},
                            @{@"category":@"history",
                              @"quizs":@[
                                      @{
                                          @"problem":@"임진왜란과 정유재란 당시의 참상을 기록한 정경운의 작품으로, 왜군의 칼에 맏딸을 잃은 슬픔, 전란으로 몰락한 양반의 모습 등을 일기 형식으로 적은 것은?",
                                          @"option":@[@"고대일록", @"쇄미록", @"징비록"],
                                          @"answer":@(0),
                                          @"detail":@"해설 : <고대일록>은 이순신의 <난중일기>, 황윤석의 <이재난고>, 오희문의 <쇄미록> 등과 함께 임진왜란 무렵의 상황을 알려주는 일기자료로서 귀중한 사료로 평가되는 작품",
                                          @"level":@(0),
                                          @"imageURL":@""
                                          },
                                      @{
                                          @"problem":@"국문학이나 신소설에서도 커다란 영향을 끼쳤으며 당파를 만드는 버릇, 어린이를 양육하는 방법, 친구를 사귀는 법, 여자를 대접하는 예절 등이 실린 책은?",
                                          @"option":@[@"김인겸의 <일동장유가>", @"박지원의 <열하일기>", @"유길준의 <서유견문>"],
                                          @"answer":@(2),
                                          @"detail":@"",
                                          @"level":@(1),
                                          @"imageURL":@""
                                          },
                                      @{
                                          @"problem":@"뉴턴은 (이 병)으로 인해 학교가 휴교하자 고향에 머물렀다. 어느 날, 나무에서 사과가 떨어지는 것을 보고 만류인력의 법칙을 발견했는데, 당시 유행한 (이 병)은?",
                                          @"option":@[@"흑사병", @"천연두", @"콜레라"],
                                          @"answer":@(0),
                                          @"detail":@"1665년경 유럽 일대에 흑사병이 돌아 뉴턴이 다니던 케임브리지대학교가 휴교하자, 휴양차 고향에서 머물렀다고 한다.",
                                          @"level":@(2),
                                          @"imageURL":@""
                                          },
                                      @{
                                          @"problem":@"케플러미션은?",
                                          @"option":@[@"지구와 비슷한 별 찾기", @"광속우주선 만들기", @"UFO 정체 밝히기"],
                                          @"answer":@(0),
                                          @"detail":@"<케플러 미션>은 NASA의 우주 망원경을 이용해 태양 외의 다른 행성 주위를 공전하는 지구와 비슷한 해성을 찾는 계획을 말한다.",
                                          @"level":@(0),
                                          @"imageURL":@""
                                          },
                                      @{
                                          @"problem":@"중국의 의학서 <황제내경 소문>에 따르면 <오래 누워 있는 것은 기(氣)를 상하게 하고, 오래 앉아 있는 것은 육(肉)을 상하게 하며, (이 행동)은 혈(血)을 상하게 한다>는데, 이 행동은?",
                                          @"option":@[@"오래 보는 것", @"오래 걷는 것", @"오래 말하는 것"],
                                          @"answer":@(0),
                                          @"detail":@"이 외에도 오래 서 있는 것은 골(骨)을 상하게 하고, 오래 걷는 것은 근(筋)을 상하게 한다고 기록되어 있다.",
                                          @"level":@(1),
                                          @"imageURL":@""
                                          },
                                      @{
                                          @"problem":@"가장 먼저 데뷔한 스타는?",
                                          @"option":@[@"미키마우스", @"도널드 덕", @"푸우"],
                                          @"answer":@(2),
                                          @"detail":@"푸우 - 1926년 데뷔, 미키마우스 - 1928년 데뷔, 도널드 덕 - 1934년 데뷔",
                                          @"level":@(2),
                                          @"imageURL":@""
                                          },
                                      @{
                                          @"problem":@"백 번 쏘아 백 번 맞추는 뜻의 <백발백중>은 초나라 양유기의 활솜씨에서 나온 말이라고 하는데, 그는 백 보나 떨어져 있는 곳에서 ( )를 쏘아도 백발백중이었다고 하는데, ( )는?",
                                          @"option":@[@"종이에 찍은 점", @"엽전", @"버드나무 잎"],
                                          @"answer":@(2),
                                          @"detail":@"",
                                          @"level":@(2),
                                          @"imageURL":@""
                                          },
                                      @{
                                          @"problem":@"1887년 미국에서 채소에 세금을 물리는 관세법이 통과되자, 토마토가 과일이나 채소이나 하는 논쟁이 벌어졌다. 미국대연방법원은 토마토가 채소라는 판결을 내렸는데 그 이유는?",
                                          @"option":@[@"뜨거운 불에 익혀 먹을 수 있어서", @"가지목 가지과의 식물이라서", @"식사에 나오지만 후식으로 나오지 않아서"],
                                          @"answer":@(2),
                                          @"detail":@"",
                                          @"level":@(2),
                                          @"imageURL":@""
                                          },
                                      @{
                                          @"problem":@"미국 내에서 가장 많이 팔린 음반의 가수는?",
                                          @"option":@[@"이글스", @"마이클 잭슨", @"엘비스 프레슬리"],
                                          @"answer":@(0),
                                          @"detail":@"<미국 내 역대 최대 음반 판매량> 1위 - 이글스의 <greatest hits> 2900만장 2위 - 마이클 잭슨의 <thriller> 2600만장 엘비스 프레슬리는 순위 내 없음",
                                          @"level":@(0),
                                          @"imageURL":@""
                                          }
                                      ]}];
        
        // quizData.plist 파일로 저장 
        [self saveQuizDataToPlist:self.quizData];
    }
    return self;
}

- (NSInteger)getNumberOfQuizAt:(NSInteger)level withCategory:(NSString *)categoryName {
    NSInteger numberOfQuiz = 0;
    for (NSDictionary *categoryData in self.quizData) {
        if ([categoryData[@"category"] isEqualToString:categoryName]) {
            for (NSDictionary *solution in categoryData[@"quizs"]) {
                if ([[solution objectForKey:@"level"] integerValue] == level)
                    numberOfQuiz++;
            }
        }
    }
    return numberOfQuiz;
}

/// 유저가 선택한 번호와 문제의 정답이 일치하면 YES, 일치하지 않으면 NO 를 출력함
- (BOOL)checkAnswer:(NSInteger)tag at:(NSInteger)selectedQuizIndex categoryName:(NSString *)categoryName {
    BOOL isCorrectAnswer;
    NSInteger answer = 0;
    for (NSDictionary *solution in self.quizData) {
        NSArray *quizs  = [solution objectForKey:@"quizs"];
        NSDictionary *quiz = [quizs objectAtIndex:selectedQuizIndex];
        NSNumber *answerNumber = [quiz objectForKey:@"answer"];
        answer = [answerNumber integerValue];
    }
    
    if (tag == answer) {
        isCorrectAnswer = YES;
    } else {
    
        isCorrectAnswer = NO;
    }
    return isCorrectAnswer;
}

- (NSArray *)getAllCategoryNames {
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    for (NSDictionary *category in self.quizData) {
        NSString *categoryName = [category objectForKey:@"category"];
        [tempArray addObject:categoryName];
    }
    
    return tempArray;
}

- (NSInteger)getNumberOfCategory {
    
    return self.quizData.count;
}

- (void)saveQuizDataToPlist:(NSArray *)quizData {
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [documentPath stringByAppendingString:@"quizData.plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:filePath]) {
        NSString  *bundlePath = [[NSBundle mainBundle] pathForResource:@"quizData" ofType:@"plist"];
        [fileManager copyItemAtPath:bundlePath toPath:filePath error:nil];
    }
    
    // 수정되어야 하기 때문에 mutable 로 만듦
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    [dic setObject:quizData forKey:@"quizData"];
    [dic writeToFile:filePath atomically:NO];
}

- (NSArray *)loadQuizDataFromPlist {
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [documentPath stringByAppendingString:@"quizData.plist"];
    
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSArray *nameList = [dic objectForKey:@"quizData"];
    return nameList;
}

- (NSArray *)getQuizSolution:(NSString *)categoryName {
    NSMutableArray *quizSoluations = [[NSMutableArray alloc] init];
    for (NSDictionary *categoryData in self.quizData) {
        if ([categoryData[@"category"] isEqualToString:categoryName]) {
            for (NSDictionary *solution in categoryData[@"quizs"]) {
                [quizSoluations addObject:solution[@"answer"]];
            }
        }
    }
    return quizSoluations;
}

- (void)resetStageCount {
    self.stageCount = 0;
}

- (NSInteger)getStageCount {
    return self.stageCount;
}

- (void)plusOneStageCount {
    self.stageCount++;
}


-(void)setSelectedCategory:(NSInteger)categoryIndex{


    self.currentSelectedCategoryIndex = categoryIndex;
    
}
-(NSInteger)getSelectedCategoryIndex{

    return self.currentSelectedCategoryIndex;
    
}
/*
- (NSArray *)getQuizData {
    return self.quizData;
} */


@end
