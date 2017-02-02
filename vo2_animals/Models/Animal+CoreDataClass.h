//
//  Animal+CoreDataClass.h
//  vo2_animals
//
//  Created by pierre-marie de jaureguiberry on 10/22/16.
//  Copyright © 2016 vo2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Category;

NS_ASSUME_NONNULL_BEGIN

@interface Animal : NSManagedObject

- (BOOL)createSaveWithDic:(NSDictionary*)dic;
+ (NSArray*)getAll;

@end

NS_ASSUME_NONNULL_END

#import "Animal+CoreDataProperties.h"
