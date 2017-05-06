//
//  ProfileViewController.m
//  ContactsApp
//
//  Created by JETS on 5/5/17.
//  Copyright © 2017 MAD. All rights reserved.
//

#import "ProfileViewController.h"
#import "Contact.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _editProfileBtnOutlet.hidden = YES;
    
    NSData *userDate=[[NSUserDefaults standardUserDefaults] objectForKey:@"contact"];
    Contact *contact=[NSKeyedUnarchiver unarchiveObjectWithData:userDate];
    
    _profileFirstName.text=contact.firstname;
    _profileLastName.text=contact.lastname;
    _profilePhone.text=contact.phone;
    _profileEmail.text=contact.email;
    _profilePassword.text=contact.pass;
    NSLog(@"%@+++++",contact.gender);
    
    if([contact.gender isEqualToString:@"Male"]){
        _profileGender.selectedSegmentIndex=0;
        //_profileImageView.image=[UIImage imageNamed:@"male"];
    
    }
    else {
        
        _profileGender.selectedSegmentIndex=1;
        //_profileImageView.image=[UIImage imageNamed:@"female"];

    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)editProfileAction:(id)sender {
    
    Contact *con = [Contact new];
    con.firstname = _profileFirstName.text;
    con.lastname = _profileLastName.text;
    con.email =_profileEmail.text;
    con.phone =_profilePhone.text;
    con.pass =_profilePassword.text;
    con.gender = [_profileGender titleForSegmentAtIndex:_profileGender.selectedSegmentIndex];
    NSString *jsonString = [NSString stringWithFormat:@"{\"email\":\"%@\",\"firstname\":\"%@\", \"lastname\":\"%@\", \"pass\":\"%@\", \"phone\":\"%@\", \"gender\":\"%@\"}", con.email, con.firstname, con.lastname, con.pass, con.phone, con.gender];
    
    NSString *EncoadedJson = [jsonString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    
    NSString *urlString = [[NSString alloc] initWithFormat:@"http://10.142.0.183:8084/ContactsBackEnd/rest/ContactService/updateContact/%@", EncoadedJson];
    
    NSLog(@"URL: %@", EncoadedJson);
    
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [conn start];
    
    _editProfileBtnOutlet.hidden = YES;
    _profileFirstName.enabled = NO;
    _profileLastName.enabled = YES;
    _profilePhone.enabled = NO;
    _profileEmail.enabled = NO;
    _profilePassword.enabled = NO;
    _profileGender.enabled = NO;
    
    Contact *contact = [[Contact alloc]init];
    
    
    contact.firstname = _profileFirstName.text;
    contact.lastname = _profileLastName.text;
    contact.email = _profileEmail.text;
    contact.pass = _profilePassword.text;
    contact.gender = [_profileGender titleForSegmentAtIndex:_profileGender.selectedSegmentIndex];
    contact.phone = _profilePhone.text;
    
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:contact];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:data forKey:@"contact"];
    
    [_profileFirstName resignFirstResponder];
    [_profileLastName resignFirstResponder];
    [_profilePassword resignFirstResponder];
    [_profileGender resignFirstResponder];
    [_profilePhone resignFirstResponder];
    [_profileEmail resignFirstResponder];
}

- (IBAction)enableEditAction:(id)sender {
    
    if (_editProfileBtnOutlet.isHidden) {
        _editProfileBtnOutlet.hidden = NO;
        _profileFirstName.enabled = YES;
        _profileLastName.enabled = YES;
        _profilePhone.enabled = YES;
        _profileEmail.enabled = YES;
        _profilePassword.enabled = YES;
        _profileGender.enabled = YES;
    }
    else{
        _editProfileBtnOutlet.hidden = YES;
        _profileFirstName.enabled = NO;
        _profileLastName.enabled = YES;
        _profilePhone.enabled = NO;
        _profileEmail.enabled = NO;
        _profilePassword.enabled = NO;
        _profileGender.enabled = NO;
    }
}
@end
