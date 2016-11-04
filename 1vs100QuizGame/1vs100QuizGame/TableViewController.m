//
//  TableViewController.m
//  1vs100QuizGame
//
//  Created by 진호놀이터 on 2016. 11. 4..
//  Copyright © 2016년 진호놀이터. All rights reserved.
//

#import "TableViewController.h"
#import "CustomNavigationBar.h"
#import "ViewController.h"
@interface TableViewController ()<UICustomNavigationBarDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property NSInteger cellRowNumber;
@property NSString *selectedCategoryName;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainTableView.delegate=self;
    self.mainTableView.dataSource=self;
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.hidden= YES;
    CustomNavigationBar *navigationBar = [[CustomNavigationBar alloc]initWithStyle:UICustomNavigationBarNomalStyle barColor:UICustomNavigationBarRedColor mainLogo:@"1대100" delegate:self];
    
    [self.view addSubview:navigationBar];
    
    DataCenter *dataCenter = [DataCenter sharedManager];
    self.cellRowNumber = [dataCenter getNumberOfCategory];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DataCenter *dataCenter = [DataCenter sharedManager];
    NSInteger selectedRow = indexPath.row;
    NSLog(@"%ld",selectedRow);
    [dataCenter setSelectedCategory:selectedRow];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%ld",self.cellRowNumber);
    return self.cellRowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSLog(@"%ld",indexPath.row);
    DataCenter *dataCenter = [DataCenter sharedManager];
    NSArray *categoryName = [dataCenter getAllCategoryNames];
    cell.textLabel.text = [categoryName objectAtIndex:indexPath.row];
    NSLog(@"%@",cell.textLabel.text);
    return  cell;
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
