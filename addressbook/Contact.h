//
//  Contact.h
//  addressbook
//
//  Created by Dev Mountain on 6/2/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;

- (NSString *)fullName;

@end
