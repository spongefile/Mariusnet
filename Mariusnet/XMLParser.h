//
//  XMLParser.h
//  MythXML
//
//  Created by Tina Aspiala on 21/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface XMLParser : NSObject <NSXMLParserDelegate> {
    
    NSMutableString *currentNodeContent;
    NSMutableArray  *players;
    NSXMLParser     *parser;
    Player          *currentPlayer;
    
//    NSMutableArray  *noobokppl;
//    NSMutableArray  *noobnoppl;
}

@property (readonly, retain) NSMutableArray *players;
// @property (readonly, retain) NSMutableArray *noobokppl;
// @property (readonly, retain) NSMutableArray *noobnoppl;

- (id) loadXMLByURL:(NSString *)urlString;


@end
