//
//  RootViewController.m
//  IR Procedure
//
//  Created by Yasuyuki Pham on 6/4/14.
//  Copyright (c) 2014 butt. All rights reserved.
//

#import "RootViewController.h"
#import "ProcedureListTableViewController.h"

@interface RootViewController ()

@property (strong, nonatomic) NSArray *bodyArray;

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.searchDisplayController.displaysSearchBarInNavigationBar = YES;
    [self populatePropertyList];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toProcedureList"]) {
        if ([segue.destinationViewController isKindOfClass:[ProcedureListTableViewController class]]) {
            ProcedureListTableViewController *procedureListTVC = segue.destinationViewController;
            procedureListTVC.procedureList = self.bodyArray;
//            NSLog(@"%@", self.bodyArray);
        }
    }
}

#pragma mark - SearchBar Delegate



#pragma mark - Helper Methods

//populate property list into dictionary
-(void)populatePropertyList
{
    NSString *bodyPlist = [[NSBundle mainBundle] pathForResource:@"Body" ofType:@"plist"];
//    NSString *neurologyPlist = [[NSBundle mainBundle] pathForResource:@" ofType:
    
    self.bodyArray = [[NSArray alloc] initWithContentsOfFile:bodyPlist];
}

#pragma mark - IBAction

- (IBAction)bodyButtonPressed:(UIButton *)sender
{
    UIButton *button = sender;
    [self performSegueWithIdentifier:@"toProcedureList" sender:button];
}

- (IBAction)neurologyButtonPressed:(UIButton *)sender
{
    
}

- (IBAction)suggestionButtonPressed:(UIButton *)sender
{
    
}
@end
