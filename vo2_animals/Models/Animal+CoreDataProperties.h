//
//  Animal+CoreDataProperties.h
//  vo2_animals
//
//  Created by pierre-marie de jaureguiberry on 10/22/16.
//  Copyright © 2016 vo2. All rights reserved.
//

#import "Animal+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Animal (CoreDataProperties)

+ (NSFetchRequest<Animal *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSNumber      *birthdate;
@property (nullable, nonatomic, copy) NSString      *name;
@property (nullable, nonatomic, copy) NSString      *picture_url;
@property (nullable, nonatomic, retain) Category    *category;

@end

NS_ASSUME_NONNULL_END
