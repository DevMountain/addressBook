//
//  Contact.m
//  addressbook
//
//  Created by Dev Mountain on 6/2/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (NSString *)fullName
{
    return [[self.firstName stringByAppendingString:@" "] stringByAppendingString:self.lastName];
}

@end
