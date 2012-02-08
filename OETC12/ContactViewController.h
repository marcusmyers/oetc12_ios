//
//  ContactViewController.h
//  OETC12
//
//  Created by Mark Myers on 2/7/12.
//  Copyright (c) 2012 Napoleon Area City Schools. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactViewController : UITableViewController {
	// Array to hold titles for Contact rows
	NSArray *cTitles;
	// Array to hold phone numbers
	NSArray *cPhone;
}

@property (nonatomic,retain) NSArray *cTitles;
@property (nonatomic,retain) NSArray *cPhone;

@end
