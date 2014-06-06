//
//  RootViewController.m
//  IR Procedure
//
//  Created by Yasuyuki Pham on 6/4/14.
//  Copyright (c) 2014 butt. All rights reserved.
//

#import "RootViewController.h"
#import "ProcedureListTableViewController.h"

@interface RootViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *bodyArray;
@property (strong, nonatomic) NSArray *neurologyArray;

@property (strong, nonatomic) NSArray *searchResults;
//@property (strong, nonatomic) UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation RootViewController

-(NSArray *)searchResults
{
    if (!_searchResults) _searchResults = [[NSArray alloc] init];
    return _searchResults;
}

//-(UITableView *)tableView
//{
//    if (!_tableView) {
//        CGRect navigationSize = self.navigationController.navigationBar.bounds;
//        CGFloat y = navigationSize.size.height;
//        CGFloat height = self.view.bounds.size.height - y;
//        CGRectMake(0, y, self.view.bounds.size.width, height);
//    }
//    return _tableView;
//}

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
    self.title = @"IR Procedure Guide";
    self.tableView.hidden = YES;
    //search bar setup
    //    self.searchDisplayController.displaysSearchBarInNavigationBar = YES;
    
    
    [self populatePropertyList];
//    self.searchDisplayController
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
            UIButton *btn = sender;
            if (btn.tag == 1) {
                procedureListTVC.procedureList = self.bodyArray;
            }
            if (btn.tag == 2) {
                procedureListTVC.procedureList = self.neurologyArray;
            }
        }
    }
}

#pragma mark - UISearchDisplayController Delegate Methods


-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    return  YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    return YES;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = @"butt";
    cell.detailTextLabel.text = @"dickbutt";
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}


#pragma mark - Helper Methods

//populate property list into dictionary
-(void)populatePropertyList
{
    NSString *bodyPlist = [[NSBundle mainBundle] pathForResource:@"Body" ofType:@"plist"];
    NSString *neurologyPlist = [[NSBundle mainBundle] pathForResource:@"Neurology" ofType:@"plist"];
    
    self.bodyArray = [[NSArray alloc] initWithContentsOfFile:bodyPlist];
    self.neurologyArray = [[NSArray alloc] initWithContentsOfFile:neurologyPlist];
}

#pragma mark - IBAction
//[self performSegueWithIdentifier:@"toProcedureList" sender:sender];

- (IBAction)bodyButtonPressed:(UIButton *)sender
{
    sender.tag = 1; //tag 1 == body list
    [self performSegueWithIdentifier:@"toProcedureList" sender:sender];
}

- (IBAction)neurologyButtonPressed:(UIButton *)sender
{
    sender.tag = 2; //tag 2 == neurology list
    [self performSegueWithIdentifier:@"toProcedureList" sender:sender];
}

- (IBAction)suggestionButtonPressed:(UIButton *)sender
{
    
}




@end
