//
//  DataCenter.h
//  1vs100QuizGame
//
//  Created by Nexus_MYT on 2016. 11. 3..
//  Copyright © 2016년 진호놀이터. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

+ (id)sharedManager;

- (NSArray *)getQuizSolution:(NSString *)categoryName;
- (NSArray *)loadQuizDataFromPlist;

- (void)resetStageCount;
- (NSInteger)getStageCount;
- (void)plusOneStageCount;
- (NSArray *)getAllCategoryNames;
- (BOOL)checkAnswer:(NSInteger)tag at:(NSInteger)selectedQuizIndex categoryName:(NSString *)categoryName;
- (NSInteger)getNumberOfCategory;

- (void)setSelectedCategory:(NSInteger)categoryIndex;
- (NSInteger)getSelectedCategoryIndex;

- (NSInteger)getNumberOfQuizAt:(NSInteger)level withCategory:(NSString *)categoryName;

// - (NSArray *)getQuizData;


@end
