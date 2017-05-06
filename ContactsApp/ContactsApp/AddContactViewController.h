//
//  AddContactViewController.h
//  ContactsApp
//
//  Created by Rana on 4/29/17.
//  Copyright © 2017 MAD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddContactViewController : UIViewController <NSURLConnectionDataDelegate, NSURLConnectionDelegate>
@property (weak, nonatomic) IBOutlet UITextField *friendEmailTxt;
- (IBAction)addFriend:(id)sender;

@end
