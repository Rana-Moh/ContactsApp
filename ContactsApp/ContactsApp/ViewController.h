//
//  ViewController.h
//  ContactsApp
//
//  Created by Rana on 4/29/17.
//  Copyright © 2017 MAD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLConnectionDataDelegate, NSURLConnectionDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailTxt;

@property (weak, nonatomic) IBOutlet UITextField *passTxt;

- (IBAction)loginBtnAction:(id)sender;

- (IBAction)registerBtnAction:(id)sender;

@end

