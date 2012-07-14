//
//  WebViewController.h
//  MythXML
//
//  Created by Tina Aspiala on 28/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WebViewController : UIViewController {
    
    IBOutlet UIWebView *webView;
    
}

@property (nonatomic, retain) UIWebView *webView;

@end
