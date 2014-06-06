//
//  DetailViewController.m
//  IR Procedure
//
//  Created by Yasuyuki Pham on 6/4/14.
//  Copyright (c) 2014 butt. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextView *detailTextField;

@end

@implementation DetailViewController

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
    NSLog(@"%@", self.detailItem);
    self.detailTextField.text = [self createText];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Helper Methods

/*
#define CATEGORY @"Category"
#define PROCEDURE @"Procedure"
#define DESCRIPTION @"Description"
#define INDICATION @"Indication"
#define PLANNING @"Planning"
#define POSTPROCEDURE @"Postprocedure"
#define COMPLICATION @"Complication"
#define ALTERNATE @"Alternate"
*/

-(NSString *)createText
{
    NSString *category = self.detailItem[CATEGORY];
    NSString *procedure = self.detailItem[PROCEDURE];
    NSString *description = self.detailItem[DESCRIPTION];
    NSString *indication = self.detailItem[INDICATION];
    NSString *planning = self.detailItem[PLANNING];
    NSString *postprocedure = self.detailItem[POSTPROCEDURE];
    NSString *complication = self.detailItem[COMPLICATION];
    NSString *alternate = self.detailItem[ALTERNATE];
    
    NSString *completeText = [NSString stringWithFormat:
        @"Category: %@\n\nProcedure: %@\n\nDescription: %@\n\nIndication: %@\n\nPreoperative Planning: %@\n\nPostprocedure Expectations: %@\n\nComplication: %@\n\nOther options: %@\n\n", category, procedure, description, indication, planning, postprocedure, complication, alternate];
    return completeText;
}


@end
