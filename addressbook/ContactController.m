//
//  ContactController.m
//  addressbook
//
//  Created by Dev Mountain on 6/2/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "ContactController.h"
#import "Contact.h"

@implementation ContactController

+ (ContactController *)sharedInstance {
    static ContactController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ContactController new];
    });
    
    return sharedInstance;
}

- (NSArray *)contacts
{
    NSMutableArray *array = [NSMutableArray new];
    
    Contact *contact1 = [Contact new];
    contact1.firstName = @"Jordan";
    contact1.lastName = @"Nelson";
    [array addObject:contact1];
    
    Contact *contact2 = [Contact new];
    contact2.firstName = @"Jake";
    contact2.lastName = @"Herrmann";
    [array addObject:contact2];
    
    Contact *contact5 = [Contact new];
    contact5.firstName = @"Danny";
    contact5.lastName = @"Curvelo";
    [array addObject:contact5];
    
    Contact *contact3 = [Contact new];
    contact3.firstName = @"Taylor";
    contact3.lastName = @"Mott";
    [array addObject:contact3];
    
    Contact *contact4 = [Contact new];
    contact4.firstName = @"Caleb";
    contact4.lastName = @"Hicks";
    [array addObject:contact4];

    return [array copy];
}

- (NSDictionary *)indexedContacts
{
    NSMutableDictionary *indexedContacts = [NSMutableDictionary new];
    for (Contact *contact in self.contacts)
    {
        NSString *sortString = contact.firstName;
        
        NSString *sortLetter = [sortString substringToIndex:1];
        
        /* see if that letter already exists as an index */
        
        BOOL foundKey = NO;
        
        for (NSString *key in [indexedContacts allKeys])
        {
            if ([key isEqualToString:sortLetter])
            {
                foundKey = YES;
            }
        }
        
        NSMutableArray *valueArray;
        if (foundKey)
        {
            valueArray = [((NSArray *)indexedContacts[sortLetter]) mutableCopy];
        }
        else
        {
            valueArray = [NSMutableArray new];
        }
        
        [valueArray addObject:contact];
        indexedContacts[sortLetter] = [valueArray copy];
    }
    
    return [indexedContacts copy];
}


@end
