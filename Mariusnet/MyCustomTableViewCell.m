//
//  MyCustomTableViewCell.m
//  Mariusnet
//
//  Created by Tina Aspiala on 28/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyCustomTableViewCell.h"

@implementation MyCustomTableViewCell

@synthesize customImage, casteImages, casteImage, noobImages, noobImage, playernameLabel;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        //customImage = [[UIImageView alloc] init];
        //[self setUserInteractionEnabled:NO];
        
        //playername
        CGRect playernameFrame = CGRectMake(45, 2, 265, 30);
        playernameLabel = [[UILabel alloc] initWithFrame:playernameFrame];
        self.playernameLabel.numberOfLines = 1;
        self.playernameLabel.font = [UIFont fontWithName:@"Georgia-Bold" size:15];
        [self.contentView addSubview:self.playernameLabel];
        
        //casteimage
        
        CGRect casteFrame = CGRectMake(290, 8, 22, 17);
        self.casteImage = [[[UIImageView alloc] initWithFrame:casteFrame] autorelease];
        [self.contentView addSubview:self.casteImage];
        
        //noobimage
        
        CGRect noobFrame = CGRectMake(262, 0, 13, 22);
        self.noobImage = [[[UIImageView alloc] initWithFrame:noobFrame] autorelease];
        [self.contentView addSubview:self.noobImage];
        
    }
    return self;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)dealloc
{
    //[casteImage release];
    [super dealloc];
}

@end
