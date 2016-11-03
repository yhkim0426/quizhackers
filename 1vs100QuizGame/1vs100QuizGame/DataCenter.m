//
//  DataCenter.m
//  1vs100QuizGame
//
//  Created by Nexus_MYT on 2016. 11. 3..
//  Copyright © 2016년 진호놀이터. All rights reserved.
//

#import "DataCenter.h"

@interface DataCenter ()

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

// - ()

@end
