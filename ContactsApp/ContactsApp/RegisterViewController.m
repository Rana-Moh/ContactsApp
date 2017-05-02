//
//  RegisterViewController.m
//  ContactsApp
//
//  Created by Rana on 4/29/17.
//  Copyright © 2017 MAD. All rights reserved.
//

#import "RegisterViewController.h"
#import "Contact.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController{
    NSMutableData *jsonDataRes;
    Contact *con;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.storyboard instantiateViewControllerWithIdentifier:@"registerView"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registerBtnAction:(id)sender {
    con = [Contact new];
    con.firstname = [_fnameTxt text];
    con.lastname = [_lnameTxt text];
    con.email = [_emailTxt text];
    con.phone = [_phoneTxt text];
    con.pass = [_passTxt text];
    con.gender = [_genderSegment titleForSegmentAtIndex:_genderSegment.selectedSegmentIndex];
    NSString *jsonString = [NSString stringWithFormat:@"{\"email\":\"%@\",\"firstname\":\"%@\", \"lastname\":\"%@\", \"pass\":\"%@\", \"phone\":\"%@\", \"gender\":\"%@\"}", con.email, con.firstname, con.lastname, con.pass, con.phone, con.gender];
    
    NSString *EncoadedJson = [jsonString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    
    NSString *urlString = [[NSString alloc] initWithFormat:@"http://192.168.1.13:8084/ContactsBackEnd/rest/ContactService/register/%@", EncoadedJson];
    
    NSLog(@"URL: %@", EncoadedJson);
    
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [conn start];
    
    [_fnameTxt resignFirstResponder];
    [_lnameTxt resignFirstResponder];
    [_emailTxt resignFirstResponder];
    [_phoneTxt resignFirstResponder];
    [_passTxt resignFirstResponder];
    [_confPassTxt resignFirstResponder];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [jsonDataRes appendData:data];
}

-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    jsonDataRes = [NSMutableData new];
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSLog(@"RESPONSE FROM SERVICE IS: %@", jsonDataRes);
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonDataRes options:0 error:nil];
    
    NSString *status = [dict objectForKey:@"status"];
    UIAlertView *myAlert;
    
    if ([status  isEqual: @"success"]) {
        myAlert = [[UIAlertView alloc] initWithTitle:@"Register Success" message:status delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        myAlert = [[UIAlertView alloc] initWithTitle:@"Register Failure" message:status delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles: nil];
    }
    
    [myAlert show];
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
