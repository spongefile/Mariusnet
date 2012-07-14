//
//  RootViewController.h
//  MythXML
//
//  Created by Tina Aspiala on 21/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLParser.h"
#import "XMLNoobListParser.h"
#import "PullRefreshTableViewController.h"
#import "MyCustomTableViewCell.h"

@interface RootViewController : PullRefreshTableViewController {
    
    XMLParser *xmlParser;
    XMLNoobListParser *noobListXmlParser;
    
    NSMutableArray *casteImages;        //moved to MyCustomViewCell
    NSMutableArray *noobImages;
    
    UIImageView *customImage;        //moved to MyCustomViewCell
    UIImageView *casteImage;        //moved to MyCustomViewCell
    UIImageView *noobImage;
}

// Moved to MyCustomViewCell

@property (nonatomic, retain) NSMutableArray *casteImages;
@property (nonatomic, retain) NSMutableArray *noobImages; 
@property (nonatomic, retain) UIImageView *customImage;
//@property (nonatomic, retain) UIImageView *casteImage;
//@property (nonatomic, retain) UIImageView *noobImage;






@end
