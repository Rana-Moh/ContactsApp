//
//  Contact.m
//  ContactsApp
//
//  Created by Rana on 4/30/17.
//  Copyright © 2017 MAD. All rights reserved.
//

#import "Contact.h"

@implementation Contact
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self.firstname=[coder decodeObjectForKey:@"firstname"];
    self.lastname=[coder decodeObjectForKey:@"lastname"];
    self.pass=[coder decodeObjectForKey:@"pass"];
    self.gender=[coder decodeObjectForKey:@"gender"];
    self.phone=[coder decodeObjectForKey:@"phone"];
    self.email=[coder decodeObjectForKey:@"email"];
    
    return self;
    
}
- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:_firstname forKey:@"firstname"];
    [coder encodeObject:_lastname forKey:@"lastname"];
    [coder encodeObject:_pass forKey:@"pass"];
    [coder encodeObject:_gender forKey:@"gender"];
    [coder encodeObject:_phone forKey:@"phone"];
    [coder encodeObject:_email forKey:@"email"];
}


@end
