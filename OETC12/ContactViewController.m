//
//  ContactViewController.m
//  OETC12
//
//  Created by Mark Myers on 2/7/12.
//  Copyright (c) 2012 Napoleon Area City Schools. All rights reserved.
//

#import "ContactViewController.h"


@implementation ContactViewController

@synthesize cTitles, cPhone;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
	NSArray *array = [[NSArray alloc] initWithObjects:@"Customer Service", 
					  @"Executive Director's Office", 
					  @"Communications & Media Relations",
					  @"Educational Technology Conference",
					  @"Fiscal",
					  @"Human Resources",
					  @"Grants & Instructional Resources and Materials",
					  @"Procurement",
					  @"Professional Development",
					  nil];
	NSArray *phone = [[NSArray alloc] initWithObjects:@"6144856650", 
					  @"6144856032", 
					  @"6144856000",
					  @"6144856016",
					  @"6144856000",
					  @"6144856046",
					  @"6144856000",
					  @"6144856000",
					  @"6144856048",
					  nil];
    [super viewDidLoad];

	self.cTitles = array;
	self.cPhone = phone;
	
	// OETC Blue Color #83c1f2
	self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.51f green:0.76f blue:0.95f alpha:1.0f];
	
	// OETC Yellow Color #ffe25d
    self.tableView.separatorColor = [UIColor colorWithRed:1.0f green:0.89f blue:0.36f alpha:1.0f];
    
	
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections. We define it as 1
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the array we defined.
	// We statically define this since we know the size
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ContactCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Grab the current index in the array
    NSUInteger row = [indexPath row];
	
	// Set the cell's label from the Titles array based on current index
	cell.textLabel.text = [cTitles objectAtIndex:row];
	
	// OETCH Green Color #a6e36b
	cell.detailTextLabel.textColor = [UIColor colorWithRed:0.65f green:0.89f blue:0.42f alpha:1.0f];
	
	// Set the cell's detail label from the phone array based on current index
	cell.detailTextLabel.text = [cPhone objectAtIndex:row];
	
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tel://" stringByAppendingString:[cPhone objectAtIndex:[indexPath row]]]]];
}

@end
