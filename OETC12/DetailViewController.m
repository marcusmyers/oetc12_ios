//
//  DetailViewController.m
//  OETC12
//
//  Created by Mark Myers on 2/7/12.
//  Copyright (c) 2012 Napoleon Area City Schools. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController

@synthesize lblTitle, lblText, btnLink, strLink, strText, strLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/
-(IBAction)btnLinkPressed:(id)sender
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[strLink stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]]];
}

-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[btnLink setTitle:@"More Info" forState: UIControlStateNormal];
	[btnLink setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	
	lblText.text = strText;
	lblTitle.text = strLabel;
	
	
	// OETCH Green Color #a6e36b
	[btnLink setBackgroundColor:[UIColor colorWithRed:0.65f green:0.89f blue:0.42f alpha:1.0f]];
	[btnLink setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
	
	[btnLink addTarget:self
				action:@selector(btnLinkPressed:)
	  forControlEvents:UIControlEventTouchUpInside];
	
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
