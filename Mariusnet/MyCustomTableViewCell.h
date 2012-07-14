//
//  MyCustomTableViewCell.h
//  Mariusnet
//
//  Created by Tina Aspiala on 28/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLParser.h"
#import "RootViewController.h"

@interface MyCustomTableViewCell : UITableViewCell {
    
    NSMutableArray *casteImages;
    NSMutableArray *noobImages;
    
    UIImageView *customImage;
    UIImageView *casteImage;
    UIImageView *noobImage;
    
    UILabel *playernameLabel;
    
}


@property (nonatomic, retain) NSMutableArray *casteImages;
@property (nonatomic, retain) NSMutableArray *noobImages;
@property (nonatomic, retain) UIImageView *customImage;
@property (nonatomic, retain) UIImageView *casteImage;
@property (nonatomic, retain) UIImageView *noobImage;
@property (nonatomic, retain) UILabel *playernameLabel;

@end
