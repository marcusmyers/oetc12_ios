//
//  eTechViewController.h
//  OETC12
//
//  Created by Mark Myers on 2/7/12.
//  Copyright (c) 2012 Napoleon Area City Schools. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface eTechViewController : UIViewController<UIWebViewDelegate> {
	
	IBOutlet UIWebView *webView;
	IBOutlet UIActivityIndicatorView *activityIndicator;
}

@property(nonatomic,retain) UIWebView *webView;
@property(nonatomic,retain) UIActivityIndicatorView *activityIndicator;

@end
