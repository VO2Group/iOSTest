//
//  Animal+CoreDataProperties.m
//  vo2_animals
//
//  Created by pierre-marie de jaureguiberry on 10/22/16.
//  Copyright © 2016 vo2. All rights reserved.
//

#import "Animal+CoreDataProperties.h"

@implementation Animal (CoreDataProperties)

+ (NSFetchRequest<Animal *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Animal"];
}

@dynamic birthdate;
@dynamic name;
@dynamic picture_url;
@dynamic category;

@end
