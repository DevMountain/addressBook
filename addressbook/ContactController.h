//
//  ContactController.h
//  addressbook
//
//  Created by Dev Mountain on 6/2/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactController : NSObject

@property (strong, nonatomic, readonly) NSArray *contacts;

+ (ContactController *)sharedInstance;

- (NSDictionary *)indexedContacts;

@end
