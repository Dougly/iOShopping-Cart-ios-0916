//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Douglas Galante on 3/9/17.
//  Copyright © 2017 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISShoppingCart.h"

@implementation FISShoppingCart

-(NSUInteger)calculateTotalPriceInCents {
    NSInteger total = 0;
    for (NSUInteger i = 0; i < self.items.count; i++) {
        FISItem *item = self.items[i];
        total += item.priceInCents;
    }
    return total;
}



-(void)addItem:(FISItem *)item {
    [self.items addObject:item];
}



-(void)removeItem:(FISItem *)item {
    for (NSUInteger i = 0; i < self.items.count; i++) {
        FISItem *itemInArray = self.items[i];
        if ([itemInArray.name isEqualToString:item.name]) {
            [self.items removeObjectAtIndex:i];
            break;

        }
    }
    
}


-(void)removeAllItemsLikeItem:(FISItem *)item {
    for (NSUInteger i = 0; i < self.items.count; i++) {
        FISItem *itemInArray = self.items[i];
        if ([itemInArray.name isEqualToString:item.name]) {
            [self.items removeObjectAtIndex:i];
        }
    }
}


-(void)sortItemsByNameAsc {
    NSSortDescriptor *asc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [self.items sortUsingDescriptors:@[asc]];
    
}

-(void)sortItemsByNameDesc {
    NSSortDescriptor *decs = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
    [self.items sortUsingDescriptors:@[decs]];
    
}

-(void)sortItemsByPriceInCentsAsc {
    NSSortDescriptor *asc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:YES];
    [self.items sortUsingDescriptors:@[asc]];
}

-(void)sortItemsByPriceInCentsDesc {
    NSSortDescriptor *decs = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:NO];
    [self.items sortUsingDescriptors:@[decs]];
}

-(NSArray *)allItemsWithName:(NSString *)name {
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"name LIKE %@", name];
    return [self.items filteredArrayUsingPredicate:namePredicate];
}

-(NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)price {
    NSPredicate *maxPricePredicate = [NSPredicate predicateWithFormat:@"priceInCents <= %d", price];
    NSArray *filteredArray = [self.items filteredArrayUsingPredicate:maxPricePredicate];
    return filteredArray;
}

-(NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)price {
    NSPredicate *minPricePredicate = [NSPredicate predicateWithFormat:@"priceInCents >= %d", price];
    return [self.items filteredArrayUsingPredicate:minPricePredicate];
}


@end
