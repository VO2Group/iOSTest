//
//  Category+CoreDataClass.h
//  vo2_animals
//
//  Created by pierre-marie de jaureguiberry on 10/22/16.
//  Copyright © 2016 vo2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Animal;

NS_ASSUME_NONNULL_BEGIN

@interface Category : NSManagedObject

- (BOOL)createSaveWithDic:(NSDictionary*)dic;
+ (Category*)getCategoryWithName:(NSString*)n;
+ (NSArray*)getAll;

@end

NS_ASSUME_NONNULL_END

#import "Category+CoreDataProperties.h"
