//
//  ScoreViewController.m
//  Score Keeper
//
//  Created by Justin Huntington on 4/28/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ScoreViewController.h"

static CGFloat margin = 20;
static CGFloat scoreViewHeight = 90;

@interface ScoreViewController () <UITextFieldDelegate>
@property UIScrollView *scrollView;
@property NSMutableArray *scoreLabels;




@end

@implementation ScoreViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Score Keeper";
    
    self.scoreLabels = [NSMutableArray new];
    
    UIScrollView *scrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    for (NSInteger i = 0; i < 5; i++) {
        [self addScoreView:i];
    }
    
    
    
}

-(void)addScoreView:(NSInteger)index {
    
    CGFloat nameWidth = 90;
    CGFloat width = self.view.frame.size.width;
    CGFloat scoreFieldWidth = 60;
    CGFloat stepperButtonWidth = 90;
    
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, index * scoreViewHeight, width, scoreViewHeight)];
    [self.view addSubview:view];
    

    
    UITextField *nameField = [[UITextField alloc] initWithFrame:CGRectMake(margin, margin, nameWidth, 44)];
    nameField.tag = -1000;
    nameField.placeholder = @"Name";
    nameField.delegate = self;
    [view addSubview:nameField];
    
    UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin + nameWidth, margin, scoreFieldWidth, 44)];
    scoreLabel.text = @"0";
    [self.scoreLabels addObject:scoreLabel];
    [view addSubview:scoreLabel];
    
    UIStepper *stepper = [[UIStepper alloc] initWithFrame:CGRectMake(60+nameWidth + scoreFieldWidth, 30, stepperButtonWidth,44)];
    stepper.minimumValue = -100;
    stepper.maximumValue = 100;
    stepper.tag = index;
    [stepper addTarget:self action:@selector(stepperChanged:) forControlEvents:UIControlEventValueChanged];
    [view addSubview:stepper];
    
    
                      
}


-(void)stepperChanged:(id)sender {
    
    UIStepper *stepper = sender;
    NSInteger index = stepper.tag;
    int value = [stepper value];

    UILabel *scoreLabel = self.scoreLabels[index];
    scoreLabel.text = [NSString stringWithFormat:@"%d",value];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
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
