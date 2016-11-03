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


- (void)plusOneStageCount;
- (NSArray *)getQuizData;


@end
