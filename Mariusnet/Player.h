//
//  Player.h
//  MythXML
//
//  Created by Tina Aspiala on 21/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIColor+i7HexColor.h"


@interface Player : NSObject {
    
    NSString    *clienttype;
    NSString    *roomname;      
    NSString    *playername;
    NSString    *login;
    NSString    *primarycolors;
//    NSString    *secondarycolors;
    NSString    *rankicon;    
    NSString    *icon;        //unimplemented
    NSString    *afk;        
    NSString    *ingame;      //unimplemented
    
    BOOL        hasdarkbg;             //not from XML
    BOOL        isbuddy;               //unimplemented, not from XML
    BOOL        isrecommended;         //unimplemented, not from XML
    BOOL        iswanked;              //unimplemented, not from XML
    BOOL        isnoobok;               //needed or no? unused.
    NSString    *notes;                 //unimplemented, not from XML
    
}

@property (nonatomic, retain) NSString *clienttype;
@property (nonatomic, retain) NSString *roomname;
@property (nonatomic, retain) NSString *playername;
@property (nonatomic, retain) NSString *login;
@property (nonatomic, retain) NSString *primarycolors;
@property (nonatomic, retain) NSString *rankicon;
@property (nonatomic, retain) NSString *icon;
@property (nonatomic, retain) NSString *afk;
@property (nonatomic, retain) NSString *ingame;

@property (nonatomic) BOOL hasdarkbg;
@property (nonatomic) BOOL isbuddy;
@property (nonatomic) BOOL isrecommended;
@property (nonatomic) BOOL iswanked;
@property (nonatomic) BOOL isnoobok;
@property (nonatomic, retain) NSString *notes;

- (BOOL)checkDkBg;


@end
