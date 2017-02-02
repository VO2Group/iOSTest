//
//  Category+CoreDataClass.m
//  vo2_animals
//
//  Created by pierre-marie de jaureguiberry on 10/22/16.
//  Copyright © 2016 vo2. All rights reserved.
//

#import "Category+CoreDataClass.h"
#import "AppDelegate.h"

@implementation Category

- (BOOL)createSaveWithDic:(NSDictionary*)dic {
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObject *newCategory = [NSEntityDescription
                                    insertNewObjectForEntityForName:@"Category"
                                    inManagedObjectContext:appDelegate.managedObjectContext];
    
    if ([dic valueForKey:@"name"]) {
        [newCategory setValue:[dic valueForKey:@"name"] forKey:@"name"];
    }
    
    NSError *error;
    if (![appDelegate.managedObjectContext save:&error]) {
        NSLog(@"Save Category failed -> %@", [error localizedDescription]);
        return NO;
    }
    return YES;
}

+ (Category*)getCategoryWithName:(NSString*)n {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Category" inManagedObjectContext:appDelegate.managedObjectContext];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@", n];
    [request setPredicate:predicate];
    [request setEntity:entity];
    
    NSError *error;
    return [[appDelegate.managedObjectContext executeFetchRequest:request error:&error] firstObject];
}

+ (NSArray*)getAll {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Category" inManagedObjectContext:appDelegate.managedObjectContext];
    [request setEntity:entity];
    NSError *error;
    NSArray *array = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    return array;
}


@end
