//
//  eTechViewController.m
//  OETC12
//
//  Created by Mark Myers on 2/7/12.
//  Copyright (c) 2012 Napoleon Area City Schools. All rights reserved.
//

#import "eTechViewController.h"

@implementation eTechViewController

@synthesize webView, activityIndicator;

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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
	// OETC Blue Color #83c1f2
	self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.51f green:0.76f blue:0.95f alpha:1.0f];
	NSString *urlAddress = @"http://m.guidebook.com/660";
	NSURL *url = [NSURL URLWithString:urlAddress];
	
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
	[webView loadRequest:requestObj];
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

-(void)webViewDidStartLoad:(UIWebView *)webView{
	UIApplication *app = [UIApplication sharedApplication];
	app.networkActivityIndicatorVisible = YES;
	[activityIndicator startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
	UIApplication *app = [UIApplication sharedApplication];
	app.networkActivityIndicatorVisible = NO;
	[activityIndicator stopAnimating];
}

@end
