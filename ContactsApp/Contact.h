//
//  Contact.h
//  ContactsApp
//
//  Created by Rana on 4/30/17.
//  Copyright © 2017 MAD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject <NSCoding>

@property NSString *email;
@property NSString *firstname;
@property NSString *lastname;
@property NSString *pass;
@property NSString *phone;
@property NSString *gender;

@end
