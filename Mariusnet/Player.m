//
//  Player.m
//  MythXML
//
//  Created by Tina Aspiala on 21/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Player.h"
#import "UIColor+i7HexColor.h"


@implementation Player

@synthesize clienttype, roomname, playername, login, primarycolors, rankicon, icon, afk, ingame, hasdarkbg, isbuddy, isrecommended, iswanked, isnoobok, notes;

- (BOOL)checkDkBg {    
    NSScanner* scanner = [NSScanner scannerWithString:primarycolors];
    unsigned hex;
    if ([scanner scanHexInt:&hex]) {
        // Parsing successful. We have a big int representing the 0xBD8F60 value
        int r = (hex >> 16) & 0xFF; // get the first byte
        int g = (hex >>  8) & 0xFF; // get the middle byte
        int b = (hex      ) & 0xFF; // get the last byte
        
        int brightness = ((r*299)+(g*587)+(b*114))/1000;
        
        if (brightness < 127) {
            return YES;
        }
    }    
    return NO;
}

@end
