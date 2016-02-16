//
//  ViewController.m
//  ApiCallAFNetworking
//
//  Created by Dhaval Barot on 12/02/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"


@interface ViewController ()

@end

@implementation ViewController
#pragma mark - UIViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //UINavigationBar *myBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self];
    
    //[self.view addSubview:navigationController.navigationBar];
    
    
    //[self.view addSubview:navigationController.navigationBar];
    
    navigationController.navigationItem.title = @"Movies";
     //setting tableview
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 50.0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://itunes.apple.com/search?term=ironman&country=us&entity=movie"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"%@", JSON);
        self.movies = [JSON objectForKey:@"results"];
        [self.tableView setHidden:NO];
        [self.tableView reloadData];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"Request Failed with Error: %@, %@", error, error.userInfo);
    }];
    
    [operation start];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movies.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"Cell Identifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    NSDictionary *movie = [self.movies objectAtIndex:indexPath.row];
    cell.textLabel.text = [movie objectForKey:@"trackName"];
    cell.detailTextLabel.text = [movie objectForKey:@"artistName"];
    
    return cell;
}

@end
