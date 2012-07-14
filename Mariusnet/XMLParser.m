//
//  XMLParser.m
//  MythXML
//
//  Created by Tina Aspiala on 21/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "XMLParser.h"
#import "Player.h"

@implementation XMLParser
@synthesize players;

//- (id)init {
//	self = [super init];
//	if (self) {
//		
//	}
//	return self;
//}

- (id) loadXMLByURL: (NSString *)urlString
{
    [players release];
//    [noobnoppl release];
//    [noobokppl release];
    parser.delegate = nil;          //release old stuff before making new
    [parser release];

//    noobokppl       = [[NSMutableArray alloc] init];
//    noobnoppl       = [[NSMutableArray alloc] init];    //release somewhere!
    players         = [[NSMutableArray alloc] init];
    NSURL *url      = [NSURL URLWithString:urlString];
    NSData  *data   = [[NSData alloc] initWithContentsOfURL:url];

    parser          = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
    
    [parser parse];
    [data release];
    return  self;
}

- (void) parser:(NSXMLParser *)parser 
didStartElement:(NSString *)elementname 
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName
     attributes:(NSDictionary *)attributeDict
{
    if ([elementname isEqualToString:@"player"])
    {
        currentPlayer = [[Player alloc]init];
    }
}

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementname
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName
{
    if ([elementname isEqualToString:@"clienttype"])
    {
        currentPlayer.clienttype = currentNodeContent;          //else nothing?
    }
    
    if ([elementname isEqualToString:@"roomname"])
    {
        currentPlayer.roomname = currentNodeContent;
    }
    
    if ([elementname isEqualToString:@"playername"])
    {
        currentPlayer.playername = currentNodeContent;
    }
    
    if ([elementname isEqualToString:@"login"])
    {    
        currentPlayer.login = currentNodeContent;
    }
    
    if ([elementname isEqualToString:@"primarycolors"])
    {
        currentPlayer.primarycolors = currentNodeContent;
        currentPlayer.hasdarkbg = [currentPlayer checkDkBg];            //background check
    }
    
    if ([elementname isEqualToString:@"rankicon"])
    {
        currentPlayer.rankicon = currentNodeContent;
    }
    
    if ([elementname isEqualToString:@"icon"])
    {
        currentPlayer.icon = currentNodeContent;
    }
    
    if ([elementname isEqualToString:@"afk"])
    {
        currentPlayer.afk = currentNodeContent;
    }
    
    if ([elementname isEqualToString:@"ingame"])
    {
        currentPlayer.ingame = currentNodeContent;
    }

/*
    if ([elementname isEqualToString:@"noobok"]){      //put noobok logins in one array
        [noobokppl addObject: currentNodeContent];
        //       [currentNodeContent release];
        //       currentNodeContent = nil;
    }
    
    if ([elementname isEqualToString:@"noobno"]){     //put noobno logins in other array   
        [noobnoppl addObject: currentNodeContent];
        //       [currentNodeContent release];
        //       currentNodeContent = nil;    
    }
*/    
    if ([elementname isEqualToString:@"player"])
    {
        [players addObject:currentPlayer];
        [currentPlayer release];
        currentPlayer = nil;
        
        [currentNodeContent release];
        currentNodeContent = nil;
    }

}

- (void) parser:(NSXMLParser *)parser       //WTF?!?
foundCharacters:(NSString *)string
{
    currentNodeContent = (NSMutableString *) [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
                                            // end WTF?!?
- (void) dealloc

{
    [parser release];
    [super dealloc];
}

@end