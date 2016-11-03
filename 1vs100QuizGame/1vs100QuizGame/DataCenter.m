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
        self.quizData = @[
                              @{
                                  @"problem":@"스파게티 까르보나라에서 까르보나라의 어원은?",
                                  @"option":@[@"숯", @"크림", @"달걀 노른자"],
                                  @"answer":@(0),
                                  @"detail":@"이탈리아어 '카르보네(숯, Carbone)' 에서 유래, 이탈리아에서 숯을 굽던 사람들이 만들어 먹기 시작했다고 함",
                                  @"category":@"common",
                                  @"level":@(2),
                                  @"imageURL":@""
                                  },
                              @{
                                  @"problem":@"가장 많은 층수의 건물은?",
                                  @"option":@[@"타이베이-타이베이금융센터", @"시카고-시어스타워", @"뉴욕-엠파이어스테이트빌딩"],
                                  @"answer":@(1),
                                  @"detail":@"순서대로 101층,108층,102층",
                                  @"category":@"common",
                                  @"level":@(2),
                                  @"imageURL":@""
                                  },
                              @{
                                  @"problem":@"'도미솔 도미솔 라라라솔 파파파 미미미 레레레도'에 나오지 않는 것은?",
                                  @"option":@[@"숟가락", @"젓가락", @"윷가락"],
                                  @"answer":@(0),
                                  @"detail":@"동요 <똑같아요>의 계이름. 무엇이 무엇이 똑같은가 / 젓가락 두 짝이 똑같아요. 무엇이 무엇이 똑같은가 / 윷가락 네 짝이 똑같아요",
                                  @"category":@"common",
                                  @"level":@(0),
                                  @"imageURL":@""
                                  },
                              @{
                                  @"problem":@"나는 알프스 산맥을 넘지 않았다. 나는?",
                                  @"option":@[@"한니발", @"칭기즈칸", @"나폴레옹"],
                                  @"answer":@(1),
                                  @"detail":@"",
                                  @"category":@"common",
                                  @"level":@(0),
                                  @"imageURL":@""
                                  },
                              @{
                                  @"problem":@"청소년보호법에서는 청소년을 만 19세 미만으로 규정한다. 그렇다면, 소년법에서 소년은?",
                                  @"option":@[@"13세 미만", @"15세 미만", @"19세 미만"],
                                  @"answer":@(2),
                                  @"detail":@"소년법 제1장 제2조 中 <이 법에서 ""소년""이란 19세 미만인 자를 말하며, ""보호자""란 법률상 감호교육을 할 의무가 있는 자 또는 현재 감호하는 자를 말한다>",
                                  @"category":@"common",
                                  @"level":@(1),
                                  @"imageURL":@""
                                  },
                              @{
                                  @"problem":@"적으로부터 자신을 보호하기 위해 몸 색깔을 바꾸는 동물이 아닌 것은?",
                                  @"option":@[@"불가사리", @"문어", @"개구리"],
                                  @"answer":@(0),
                                  @"detail":@"불가사리는 생태학적으로는 천적이 없어서, 생물학적으로는 색깔을 바꿀 수 없는 색소포가 없기 때문에 몸 색깔을 바꾸지 않는다.",
                                  @"category":@"common",
                                  @"level":@(1),
                                  @"imageURL":@""
                                  },
                              @{
                                  @"problem":@"카이사르가 <주사위는 던져졌다>라는 말을 하고 건넌 루비콘 강은 어디에 위치해 있는가?",
                                  @"option":@[@"터키", @"그리스", @"이탈리아"],
                                  @"answer":@(2),
                                  @"detail":@"<루비콘 강> - 이탈리아 북부 리미니 부근에서 아드리아 해로 흘러드는 강.",
                                  @"category":@"common",
                                  @"level":@(1),
                                  @"imageURL":@""
                                  }];
    }
    return self;
}

- (NSDictionary *)getProblemInfo {
    // NSUserDefaults
    
    return nil;
}

// - ()

@end
