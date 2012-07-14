//
//  XMLNoobParser.m
//  Mariusnet
//
//  Created by Tina Aspiala on 06/10/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

//
//  XMLParser.m
//  MythXML
//
//  Created by Tina Aspiala on 21/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "XMLNoobListParser.h"
//#import "Player.h"

@implementation XMLNoobListParser
@synthesize noobnoppl, noobokppl;

//- (id)init {
//	self = [super init];
//	if (self) {
//		
//	}
//	return self;
//}

- (id) loadXMLByURL: (NSString *)urlString
{
    [noobnoppl release];
    [noobokppl release];
    noobparser.delegate = nil;          //release old stuff before making new
    [noobparser release];
    
    noobokppl       = [[NSMutableArray alloc] init];
    noobnoppl       = [[NSMutableArray alloc] init];    //release somewhere!
    
    NSURL *url      = [NSURL URLWithString:urlString];
    NSData  *data   = [[NSData alloc] initWithContentsOfURL:url];
    
    noobparser          = [[NSXMLParser alloc] initWithData:data];
    noobparser.delegate = self;
    
    [noobparser parse];
    [data release];
    return  self;
}

/*
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
*/

- (void) noobparser:(NSXMLParser *)noobparser
  didEndElement:(NSString *)elementname
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName
{
    if ([elementname isEqualToString:@"noobok"]){      //put noobok logins in one array
        [noobokppl addObject: currentNodeContent];
        //       [currentNodeContent release];
        //       currentNodeContent = nil;
    }
    
    if ([elementname isEqualToString:@"noobno"]){     //put noobno logins in other array   
        [noobnoppl addObject: currentNodeContent];
        //       [currentNodeContent release];
        //       currentNodeContent = nil; 
        
        NSLog(@"%@",noobnoppl);

        
    }

    
}

- (void) noobparser:(NSXMLParser *)noobparser       //WTF?!?
foundCharacters:(NSString *)string
{
    currentNodeContent = (NSMutableString *) [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
// end WTF?!?
- (void) dealloc

{
    [noobparser release];
    [super dealloc];
}

@end
