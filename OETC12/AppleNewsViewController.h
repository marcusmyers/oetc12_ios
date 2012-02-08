//
//  AppleNewsViewController.h
//  OETC12
//
//  Created by Mark Myers on 2/7/12.
//  Copyright (c) 2012 Napoleon Area City Schools. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface AppleNewsViewController : UITableViewController <NSXMLParserDelegate> {
	IBOutlet UITableView *rssTable;
	UIActivityIndicatorView *activityIndicator;
	NSXMLParser *rssParser;
	NSMutableArray *appleNews;
	NSMutableDictionary *item;
	NSString *currentElement;
	NSMutableString *currentTitle, *currentDate, *currentSummary, *currentLink;
}

@property (nonatomic, retain) NSXMLParser *rssParser;
@property (nonatomic, retain) NSMutableArray *appleNews;
@property (nonatomic, retain) NSMutableDictionary *item;
@property (nonatomic, retain) NSString *currentElement;
@property (nonatomic, retain) NSMutableString *currentTitle;
@property (nonatomic, retain) NSMutableString *currentDate;
@property (nonatomic, retain) NSMutableString *currentSummary;
@property (nonatomic, retain) NSMutableString *currentLink;

@end
