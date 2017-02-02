//
//  AppDelegate.m
//  vo2_animals
//
//  Created by pierre-marie de jaureguiberry on 4/19/16.
//  Copyright © 2016 vo2. All rights reserved.
//

#import "AppDelegate.h"
#import "Category+CoreDataProperties.h"
#import "Animal+CoreDataProperties.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Put some data in the db
    if ([[Category getAll] count] == 0) {
        
        [[Category alloc] createSaveWithDic:@{@"name":@"cat"}];
        [[Category alloc] createSaveWithDic:@{@"name":@"dog"}];
        [[Category alloc] createSaveWithDic:@{@"name":@"fish"}];
        [[Category alloc] createSaveWithDic:@{@"name":@"bird"}];
        
        [[Animal alloc] createSaveWithDic:@{@"name":@"Minette", @"birthdate":@1460279778, @"picture_url":@"http://jolabistouille.j.o.pic.centerblog.net/45777f7a.png", @"category":@"cat"}];
        [[Animal alloc] createSaveWithDic:@{@"name":@"Miaou", @"birthdate":@1360318578, @"picture_url":@"https://www.collier-petit-chien.com/medias/images/collier-pour-chat.png", @"category":@"cat"}];
        [[Animal alloc] createSaveWithDic:@{@"name":@"Mimi", @"birthdate":@1454926578   , @"picture_url":@"http://4.bp.blogspot.com/-OhD1MyiPLzo/VfW7AaJGB8I/AAAAAAAAFH0/To2nfW9Vgv8/s1600/adopter-chat-noir.jpg", @"category":@"cat"}];
        [[Animal alloc] createSaveWithDic:@{@"name":@"Baboo", @"birthdate":@1370682978, @"picture_url":@"http://www.chiens-online.com/_upload/ressources/global/vignettes/presentations/chiot_jack_russell_432_323_filled.jpg", @"category":@"dog"}];
        [[Animal alloc] createSaveWithDic:@{@"name":@"Cannelle", @"birthdate":@1376212578, @"picture_url":@"http://www.royalcanin.fr/wp-content/uploads/chien-grand.png", @"category":@"dog"}];
        [[Animal alloc] createSaveWithDic:@{@"name":@"Fluflu", @"birthdate":@1439280978, @"picture_url":@"http://img0.mxstatic.com/wallpapers/d31c836af508d9d378ef9b237a1bee8b_large.jpeg", @"category":@"bird"}];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.vo2.animals.vo2_animals" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"vo2_animals" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"vo2_animals.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
