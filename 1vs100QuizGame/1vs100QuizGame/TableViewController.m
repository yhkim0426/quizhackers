//
//  TableViewController.m
//  1vs100QuizGame
//
//  Created by 진호놀이터 on 2016. 11. 4..
//  Copyright © 2016년 진호놀이터. All rights reserved.
//

#import "TableViewController.h"
#import "CustomNavigationBar.h"
@interface TableViewController ()<UICustomNavigationBarDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    CustomNavigationBar *navigationBar = [[CustomNavigationBar alloc]initWithStyle:UICustomNavigationBarNomalStyle barColor:UICustomNavigationBarRedColor mainLogo:@"1대100" delegate:self];
    
    [self.view addSubview:navigationBar];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{



    return 1;


}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

        
    DataCenter *dataCenter = [DataCenter sharedManager];
    
    NSInteger categoryNumber= [dataCenter getNumberOfCategory];
    
    return categoryNumber;
    

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    DataCenter *dataCenter = [DataCenter sharedManager];
    
        cell.textLabel.text = 



}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
