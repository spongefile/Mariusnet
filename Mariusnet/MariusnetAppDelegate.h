//
//  MariusnetAppDelegate.h
//  Mariusnet
//
//  Created by Tina Aspiala on 21/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MariusnetAppDelegate : NSObject <UIApplicationDelegate>
{
    
    UIWindow *window;                               //added by me from documentation
    UINavigationController *navigationController;   //added by me from documentation
    UITabBarController *uiTabBarController;           //added with Atticus
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) IBOutlet UITabBarController *uiTabBarController;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
