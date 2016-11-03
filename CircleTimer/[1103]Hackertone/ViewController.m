//
//  ViewController.m
//  [1103]Hackertone
//
//  Created by celeste on 2016. 11. 3..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"
#import "BIZCircularProgressView.h"

@interface ViewController () <ProgressViewHandlerDelegate>

@property (nonatomic, strong) BIZCircularProgressView *circularProgressViewForCode;
@property (nonatomic, strong) BIZProgressViewHandler *progressViewHandlerForCode;

@property (weak, nonatomic) IBOutlet BIZCircularProgressView *circularProgressViewForStoryboard;
@property (nonatomic, strong) BIZProgressViewHandler *progressViewHandlerForStoryboard;



@end

@implementation ViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [super viewDidLoad];
    
    //Create with Code
    self.circularProgressViewForCode = [[BIZCircularProgressView alloc] initWithFrame:CGRectMake(100, 100, 150, 150)];
    [self.view addSubview:self.circularProgressViewForCode];
    //Customize
    self.circularProgressViewForCode.progressLineColor = [UIColor blackColor];
    self.circularProgressViewForCode.circleBackgroundColor = [UIColor yellowColor];
    self.circularProgressViewForCode.progressLineWidth = 5;
    self.circularProgressViewForCode.textLabel.textColor = [UIColor blackColor];
    self.circularProgressViewForCode.textLabel.font = [UIFont boldSystemFontOfSize:25];
    self.progressViewHandlerForCode = [[BIZProgressViewHandler alloc] initWithProgressView:self.circularProgressViewForCode minValue:0 maxValue:5];
    
    //Create with Storyboard
    //Customize
    self.circularProgressViewForStoryboard.progressLineWidth = 16;
    self.circularProgressViewForStoryboard.textLabel.font = [UIFont boldSystemFontOfSize:25];
    self.progressViewHandlerForStoryboard = [[BIZProgressViewHandler alloc] initWithProgressView:self.circularProgressViewForStoryboard minValue:0 maxValue:10];
    self.progressViewHandlerForStoryboard.liveProgress = YES;
    self.progressViewHandlerForStoryboard.delegate = self;
    
}


- (IBAction)runButtonAction:(UIButton *)sender {
    [self.progressViewHandlerForCode start];
    [self.progressViewHandlerForStoryboard start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)progressViewHandler:(BIZProgressViewHandler *)progressViewHandler didFinishProgressForProgressView:(BIZCircularProgressView *)progressView
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Green progress is completed" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:alertAction];
    [self presentViewController:alertController animated:YES completion:nil];
}



@end
