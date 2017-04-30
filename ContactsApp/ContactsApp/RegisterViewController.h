//
//  RegisterViewController.h
//  ContactsApp
//
//  Created by Rana on 4/29/17.
//  Copyright © 2017 MAD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController <NSURLConnectionDataDelegate, NSURLConnectionDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *fnameTxt;
@property (weak, nonatomic) IBOutlet UITextField *lnameTxt;
@property (weak, nonatomic) IBOutlet UITextField *emailTxt;
@property (weak, nonatomic) IBOutlet UITextField *phoneTxt;
@property (weak, nonatomic) IBOutlet UITextField *passTxt;
@property (weak, nonatomic) IBOutlet UITextField *confPassTxt;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSegment;
- (IBAction)registerBtnAction:(id)sender;
@end
