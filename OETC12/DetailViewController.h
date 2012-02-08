//
//  DetailViewController.h
//  OETC12
//
//  Created by Mark Myers on 2/7/12.
//  Copyright (c) 2012 Napoleon Area City Schools. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController {
	
	IBOutlet UILabel *lblTitle;
	IBOutlet UITextView *lblText;

	
}

@property (nonatomic, retain) UILabel *lblTitle;
@property (nonatomic, retain) UITextView *lblText;
@property (nonatomic, retain) UIButton *btnLink;
@property (nonatomic, retain) NSString *strLink;
@property (nonatomic, retain) NSString *strLabel;
@property (nonatomic, retain) NSString *strText;


-(IBAction)btnLinkPressed:(id)sender;

@end
