//
//  ProfileViewController.h
//  ContactsApp
//
//  Created by JETS on 5/5/17.
//  Copyright © 2017 MAD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *profileGender;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UITextField *profileFirstName;
@property (weak, nonatomic) IBOutlet UITextField *profileLastName;
@property (weak, nonatomic) IBOutlet UITextField *profileEmail;
@property (weak, nonatomic) IBOutlet UITextField *profilePassword;
@property (weak, nonatomic) IBOutlet UITextField *profilePhone;

- (IBAction)editProfileAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *editProfileBtnOutlet;

- (IBAction)enableEditAction:(id)sender;

@end
