//
//  ViewController.m
//  addressbook
//
//  Created by Dev Mountain on 6/2/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "ViewController.h"
#import "ContactController.h"
#import "Contact.h"

static NSString *kContactCell = @"ContactCell";

@interface ViewController () <UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[[[ContactController sharedInstance] indexedContacts] allKeys] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ContactController *contactController = [ContactController sharedInstance];
    NSDictionary *indexedContacts = [contactController indexedContacts];
    NSArray *myKeys = [indexedContacts allKeys];
    NSString *key = myKeys[section];
    
    return [((NSArray *)[[ContactController sharedInstance] indexedContacts][key]) count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[[ContactController sharedInstance] indexedContacts] allKeys][section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kContactCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kContactCell];
    }
    
    NSString *key = [[[ContactController sharedInstance] indexedContacts] allKeys][indexPath.section];
    Contact *contact = ((NSArray *)[[ContactController sharedInstance] indexedContacts][key])[indexPath.row];
    
    cell.textLabel.text = [contact fullName];
    
    return cell;
}

@end
