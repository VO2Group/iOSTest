//
//  Animal+CoreDataClass.m
//  vo2_animals
//
//  Created by pierre-marie de jaureguiberry on 10/22/16.
//  Copyright © 2016 vo2. All rights reserved.
//

#import "Animal+CoreDataClass.h"
#import "Category+CoreDataProperties.h"
#import "AppDelegate.h"

@implementation Animal

- (BOOL)createSaveWithDic:(NSDictionary*)dic {
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObject *newAnimal = [NSEntityDescription
                                  insertNewObjectForEntityForName:@"Animal"
                                  inManagedObjectContext:appDelegate.managedObjectContext];
    
    if ([dic valueForKey:@"name"]) {
        [newAnimal setValue:[dic valueForKey:@"name"] forKey:@"name"];
    }
    if ([dic valueForKey:@"birthdate"]) {
        [newAnimal setValue:[dic valueForKey:@"birthdate"] forKey:@"birthdate"];
    }
    if ([dic valueForKey:@"picture_url"]) {
        [newAnimal setValue:[dic valueForKey:@"picture_url"] forKey:@"picture_url"];
    }
    if ([dic valueForKey:@"category"]) {
        Category *c = [Category getCategoryWithName:[dic valueForKey:@"category"]];
        [newAnimal setValue:c forKey:@"category"];
    }
    
    NSError *error;
    if (![appDelegate.managedObjectContext save:&error]) {
        NSLog(@"Save Animal failed -> %@", [error localizedDescription]);
        return NO;
    }
    return YES;
}

+ (NSArray*)getAll {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Animal" inManagedObjectContext:appDelegate.managedObjectContext];
    [request setEntity:entity];
    NSError *error;
    NSArray *array = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    return array;
}

@end
