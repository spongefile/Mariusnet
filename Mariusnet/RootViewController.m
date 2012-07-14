//
//  RootViewController.m
//  MythXML
//
//  Created by Tina Aspiala on 21/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "Player.h"
#import "UIColor+i7HexColor.h"
#import "MyCustomTableViewCell.h"

@implementation RootViewController

@synthesize customImage, casteImages, noobImages; //Moved to MyCustomTableCell

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (!xmlParser) {
        xmlParser = [[XMLParser alloc]init];
        [xmlParser loadXMLByURL:@"http://www.mariusnet.com/mnetdata/ServerStatus.xml"];
    }
    
    if (!noobListXmlParser) {
        noobListXmlParser = [[XMLNoobListParser alloc]init];
        [noobListXmlParser loadXMLByURL:@"http://www.catmindr.com/Myth/MythNoobList.xml"];
    }  
    
    UIImage *caste0 = [UIImage imageNamed:@"caste0.png"];
    UIImage *caste1 = [UIImage imageNamed:@"caste1.png"];
    UIImage *caste2 = [UIImage imageNamed:@"caste2.png"];
    UIImage *caste3 = [UIImage imageNamed:@"caste3.png"];
    UIImage *caste4 = [UIImage imageNamed:@"caste4.png"];
    UIImage *caste5 = [UIImage imageNamed:@"caste5.png"];
    UIImage *caste6 = [UIImage imageNamed:@"caste6.png"];
    UIImage *caste7 = [UIImage imageNamed:@"caste7.png"];
    UIImage *caste8 = [UIImage imageNamed:@"caste8.png"];
    UIImage *caste9 = [UIImage imageNamed:@"caste9.png"];
    UIImage *caste10 = [UIImage imageNamed:@"caste10.png"];
    UIImage *caste11 = [UIImage imageNamed:@"caste11.png"];
    UIImage *caste12 = [UIImage imageNamed:@"caste12.png"];
    UIImage *caste13 = [UIImage imageNamed:@"caste13.png"];
    UIImage *caste14 = [UIImage imageNamed:@"caste14.png"];
    UIImage *caste15 = [UIImage imageNamed:@"caste15.png"];
    UIImage *caste16 = [UIImage imageNamed:@"caste16.png"];
    
    
    casteImages = [[NSMutableArray alloc] init];
    [casteImages addObject:caste0];
    [casteImages addObject:caste1];
    [casteImages addObject:caste2];
    [casteImages addObject:caste3];
    [casteImages addObject:caste4];
    [casteImages addObject:caste5];
    [casteImages addObject:caste6];
    [casteImages addObject:caste7];
    [casteImages addObject:caste8];
    [casteImages addObject:caste9];
    [casteImages addObject:caste10];
    [casteImages addObject:caste11];
    [casteImages addObject:caste12];
    [casteImages addObject:caste13];
    [casteImages addObject:caste14];
    [casteImages addObject:caste15];
    [casteImages addObject:caste16];
    
    UIImage *noobNo = [UIImage imageNamed:@"NoobNo.png"];
    UIImage *noobOk = [UIImage imageNamed:@"NoobOk.png"];
    
    noobImages = [[NSMutableArray alloc] init];
    
    [noobImages addObject:noobOk];
    [noobImages addObject:noobNo];
    
    self.title = @"Players on now";
    
}

- (void)refresh{            //refresh table by dragging list down
    [super refresh];
    [xmlParser loadXMLByURL:@"http://www.mariusnet.com/mnetdata/ServerStatus.xml"];
    [noobListXmlParser loadXMLByURL:@"http://www.catmindr.com/Myth/MythNoobList.xml"];  
    [self.tableView reloadData]; 
    [self performSelector:@selector(stopLoading) withObject:nil afterDelay:2.0];
}

#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [[xmlParser players] count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView        
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    MyCustomTableViewCell *cell = (MyCustomTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[MyCustomTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle       /* custom cell */
                                             reuseIdentifier:CellIdentifier] autorelease];
    }
    
   	
	Player *currentPlayer = [[xmlParser players] objectAtIndex:indexPath.row];
   
    
    if ([[currentPlayer clienttype] isEqualToString:@"Myth: TFL"])
    {cell.imageView.image = [UIImage imageNamed:@"FallenLords.png"];}
    
    else if ([[currentPlayer clienttype] isEqualToString:@"Myth: SB"])
    {cell.imageView.image = [UIImage imageNamed:@"soulblighter.png"];}
    
    else if ([[currentPlayer clienttype] isEqualToString:@"Myth: TWA"])
    {cell.imageView.image = [UIImage imageNamed:@"WolfAge.png"];}
    
    else if ([[currentPlayer clienttype] isEqualToString:@"Marathon"])
    {cell.imageView.image = [UIImage imageNamed:@"marathon.png"];}
    
    else cell.imageView.image = nil;
	
    //player name
    
    cell.playernameLabel.text = [currentPlayer playername];
    
    
    if ([[currentPlayer afk] isEqualToString:@"1"]){   
        cell.playernameLabel.textColor = [UIColor grayColor];    
    } else if ([currentPlayer hasdarkbg])
    {     
        cell.playernameLabel.textColor = [UIColor whiteColor];
    }
    else cell.playernameLabel.textColor = [UIColor blackColor];
    
    
    cell.playernameLabel.backgroundColor = [UIColor colorWithHexString:[currentPlayer primarycolors]];
    cell.contentView.backgroundColor = [UIColor colorWithHexString:[currentPlayer primarycolors]];
    
	
    
    //login
    
	CGRect loginFrame = CGRectMake(45, 26, 100, 12);
	UILabel *loginLabel = [[[UILabel alloc] initWithFrame:loginFrame] autorelease];
	loginLabel.font = [UIFont systemFontOfSize:11];
	loginLabel.text = [currentPlayer login];
    
    if ([[currentPlayer afk] isEqualToString:@"1"]) //set afk text to gray
    {loginLabel.textColor = [UIColor grayColor];}
    //set text color by bg color lightness
    else if ([currentPlayer hasdarkbg])
    {
        loginLabel.textColor = [UIColor whiteColor];
    }
    else loginLabel.textColor = [UIColor blackColor];
    
    loginLabel.backgroundColor = [UIColor colorWithHexString:[currentPlayer primarycolors]];
    cell.contentView.backgroundColor = [UIColor colorWithHexString:[currentPlayer primarycolors]];
    [cell.contentView addSubview:loginLabel];
    
    //caste
    
    NSInteger i = [[currentPlayer rankicon] integerValue];
    cell.casteImage.image = [casteImages objectAtIndex:i];
    
    //noob friendly
    
     //NSInteger x = [[currentPlayer afk] integerValue];        //from XML
     //cell.noobImage.image = [noobImages objectAtIndex:x];
    
   /* 
    if ([[currentPlayer login] isEqualToString:@"darthrevan555"]||     //by login name
        [[currentPlayer login] isEqualToString:@"spongefile"]||
        [[currentPlayer login] isEqualToString:@"frumius"]||
        [[currentPlayer login] isEqualToString:@"stoopid"]||
        [[currentPlayer login] isEqualToString:@"vinylrake"]||
        [[currentPlayer login] isEqualToString:@"flick42"]||
        [[currentPlayer login] isEqualToString:@"hojou"]||
        [[currentPlayer login] isEqualToString:@"professionalkiller"]||
        [[currentPlayer login] isEqualToString:@"toecutter"]){ 
        cell.noobImage.image = [noobImages objectAtIndex:0];
    }
    else if ([[currentPlayer login] isEqualToString:@"mrsreaper"]){
        cell.noobImage.image = [noobImages objectAtIndex:1];
    }
    else cell.noobImage.image = nil;
    */
    
    
    if ([[noobListXmlParser noobokppl] containsObject:[currentPlayer login]]) {
        cell.noobImages = [noobImages objectAtIndex:0];
    } 
    if ([[noobListXmlParser noobnoppl] containsObject:[currentPlayer login]]) {
        cell.noobImages = [noobImages objectAtIndex:1];
    }
    else cell.noobImages = nil;
    
    
    //room
    
    CGRect roomFrame = CGRectMake(194, 26, 120, 12);
	UILabel *roomLabel = [[[UILabel alloc] initWithFrame:roomFrame] autorelease];
	roomLabel.font = [UIFont systemFontOfSize:11];
	roomLabel.text = [currentPlayer roomname];
    roomLabel.textAlignment = UITextAlignmentRight;
    
    if ([[currentPlayer afk] isEqualToString:@"1"])
    {roomLabel.textColor = [UIColor grayColor];}    //set afk text to gray
    else if ([currentPlayer hasdarkbg]){
        roomLabel.textColor = [UIColor whiteColor];//set text color by bg color lightness
    }
    else roomLabel.textColor = [UIColor blackColor];
    
    roomLabel.backgroundColor = [UIColor colorWithHexString:[currentPlayer primarycolors]];
    cell.contentView.backgroundColor = [UIColor colorWithHexString:[currentPlayer primarycolors]];
    [cell.contentView addSubview:roomLabel];
    
    
    
    
    
    // Configure the cell.
    return cell;
    
}

//=========XCode's own code=================================

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

//=========================================================

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{

    [super dealloc];
}

@end
