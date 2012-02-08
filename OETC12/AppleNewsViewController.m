//
//  AppleNewsViewController.m
//  OETC12
//
//  Created by Mark Myers on 2/7/12.
//  Copyright (c) 2012 Napoleon Area City Schools. All rights reserved.
//

#import "AppleNewsViewController.h"


@implementation AppleNewsViewController

@synthesize rssParser, appleNews, item, currentElement, currentDate, currentLink, currentTitle, currentSummary;

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

#pragma mark - Parse XML

-(void)parserDidStartDocument:(NSXMLParser *)parser
{
	NSLog(@"found file and started parsing");
}

-(void)parseXMLFileAtURL:(NSString *)URL
{
	appleNews = [[NSMutableArray alloc] init];
	
	NSURL *xmlURL = [NSURL URLWithString:URL];
	
	rssParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
	
	[rssParser setDelegate:self];
	
	[rssParser setShouldProcessNamespaces:NO];
	[rssParser setShouldReportNamespacePrefixes:NO];
	[rssParser setShouldResolveExternalEntities:NO];
	
	[rssParser parse];
}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
	NSString *errorString = [NSString stringWithFormat:@"Unable to download feed from website (Error Code: %i)", [parseError code]];
	NSLog(@"error parsing XML: %@", errorString);
	
	UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error loading content" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	currentElement = [elementName copy];
	if([elementName isEqualToString:@"item"]){
		item = [[NSMutableDictionary alloc] init];
		currentTitle = [[NSMutableString alloc] init];
		currentDate = [[NSMutableString alloc] init];
		currentSummary = [[NSMutableString alloc] init];
		currentLink = [[NSMutableString alloc] init];
	}
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	if([elementName isEqualToString:@"item"] && currentTitle != nil){
		[item setObject:currentTitle forKey:@"title"];
		[item setObject:currentSummary forKey:@"description"];
		[item setObject:currentLink forKey:@"link"];
		[item setObject:currentDate forKey:@"pubDate"];
		//		NSLog(@"Added item to array");
		[appleNews addObject:[item copy]];
	}
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	if([currentElement isEqualToString:@"title"]){
		[currentTitle appendString:string];
	} else if ([currentElement isEqualToString:@"link"]){
		[currentLink appendString:string];
	} else if ([currentElement isEqualToString:@"description"]){
		[currentSummary appendString:string];
	} else if ([currentElement isEqualToString:@"pubDate"]){
		[currentDate appendString:string];
	}
//		NSLog(@"XML data: %@", string);
}

-(void)parserDidEndDocument:(NSXMLParser *)parser{
	[activityIndicator stopAnimating];
	[activityIndicator removeFromSuperview];
	
	UIApplication *app = [UIApplication sharedApplication];
	app.networkActivityIndicatorVisible = NO;
	[rssTable reloadData];
}

-(NSString *) cleanString:(NSString *)string{
	NSString *tmp = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	NSString *clean = [[[[tmp stringByReplacingOccurrencesOfString:@"&#39;" withString:@"'"]
						 stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "]
						stringByReplacingOccurrencesOfString:@"&ndash;" withString:@"-"]
					   stringByReplacingOccurrencesOfString:@"&rsquo;" withString:@"'"];
	return clean;
}



#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	UIApplication *app = [UIApplication sharedApplication];
	app.networkActivityIndicatorVisible = YES;
	
	if ([appleNews count] == 0) {
		NSString *path = @"https://developer.apple.com/news/rss/news.rss";
		[self parseXMLFileAtURL:path];
	}

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [appleNews count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"appleCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
	int storyIndex = [indexPath row];
	
	cell.textLabel.text = [[appleNews objectAtIndex:storyIndex] objectForKey:@"title"];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	int storyIndex = [indexPath row];
	NSLog(@"Size of apppleNew: %d", [appleNews count]);
	NSLog(@"Index: %d",storyIndex);
	DetailViewController *dvController = [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
	[dvController setStrLabel:[[appleNews objectAtIndex:storyIndex] objectForKey:@"title"]];
//	NSLog(@"Set Title: %@", [[appleNews objectAtIndex:storyIndex] objectForKey:@"title"]);
//	dvController.lblText.text = [[appleNews objectAtIndex:storyIndex] objectForKey:@"description"];
	[dvController setStrText:[[appleNews objectAtIndex:storyIndex] objectForKey:@"description"]];
//	NSLog(@"Set Description: %@", dvController.lblText.text);

	[dvController setStrLink:[[appleNews objectAtIndex:storyIndex] objectForKey:@"link"]];
//	NSLog(@"Set Link: %@", [[appleNews objectAtIndex:storyIndex] objectForKey:@"link"]);
	[[self navigationController] pushViewController:dvController animated:YES];
}

@end
