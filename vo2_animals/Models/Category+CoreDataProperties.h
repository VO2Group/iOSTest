//
//  Category+CoreDataProperties.h
//  vo2_animals
//
//  Created by pierre-marie de jaureguiberry on 10/22/16.
//  Copyright © 2016 vo2. All rights reserved.
//

#import "Category+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Category (CoreDataProperties)

+ (NSFetchRequest<Category *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString              *name;
@property (nullable, nonatomic, retain) NSSet<Animal *>     *animals;

@end

@interface Category (CoreDataGeneratedAccessors)

- (void)addAnimalsObject:(Animal *)value;
- (void)removeAnimalsObject:(Animal *)value;
- (void)addAnimals:(NSSet<Animal *> *)values;
- (void)removeAnimals:(NSSet<Animal *> *)values;

@end

NS_ASSUME_NONNULL_END
