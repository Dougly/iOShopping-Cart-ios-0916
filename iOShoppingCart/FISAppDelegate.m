//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISItem.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    FISItem *item1 = [[FISItem alloc] initWithName:@"hot pockets" priceInCents:499];
    FISItem *item2 = [[FISItem alloc] initWithName:@"diet coke, 2l" priceInCents:249];
    FISItem *item3 = [[FISItem alloc] initWithName:@"lean pockets" priceInCents:549];
    FISItem *item4 = [[FISItem alloc] initWithName:@"digiorno pizza" priceInCents:899];
    FISItem *item5 = [[FISItem alloc] initWithName:@"eggs, one dozen" priceInCents:189];
    FISItem *item6 = [[FISItem alloc] initWithName:@"milk, half gallon" priceInCents:289];
    FISItem *item7 = [[FISItem alloc] initWithName:@"whey protein powder" priceInCents:1499];
    FISItem *item8 = [[FISItem alloc] initWithName:@"hot pockets" priceInCents:499];
    
    NSMutableArray *items = [[NSMutableArray alloc] initWithObjects:item1, item2, item3, item4, item5, item6, item7, item8, nil];
    
    NSPredicate *maxPricePredicate = [NSPredicate predicateWithFormat:@"priceInCents >= %li", 500];
    NSArray *filteredMaxPrice = [items filteredArrayUsingPredicate:maxPricePredicate];

    for (FISItem *item in filteredMaxPrice) {
        NSLog(@"%@", item.name);
    }
    
    return YES;
}

@end
