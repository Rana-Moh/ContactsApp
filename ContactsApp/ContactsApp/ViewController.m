//
//  ViewController.m
//  ContactsApp
//
//  Created by Rana on 4/29/17.
//  Copyright © 2017 MAD. All rights reserved.
//

#import "ViewController.h"
#import "AllContactsTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSMutableData *jsonData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginBtnAction:(id)sender {
    
    NSString *urlString = [[NSString alloc] initWithFormat:@"http://192.168.1.13:8084/ContactsBackEnd/rest/ContactService/login/%@/%@", _emailTxt.text, _passTxt.text];
    
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    [conn start];
    
    [_emailTxt resignFirstResponder];
    [_passTxt resignFirstResponder];
}

- (IBAction)registerBtnAction:(id)sender {
    [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"registerView"] animated:YES];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [jsonData appendData:data];
}

-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    jsonData = [NSMutableData new];
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"RESPONSE FROM SERVICE");
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
    
    NSString *result = [dict objectForKey:@"result"];
    UIAlertView *myAlert;
    
    if ([result  isEqual: @"fail"]) {
        myAlert = [[UIAlertView alloc] initWithTitle:@"Login Failed" message:result delegate:self cancelButtonTitle:@"Retry" otherButtonTitles: nil];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        NSString *userJson = result;
        //store user details from json in ns defaults
        
        //redirect to list
        AllContactsTableViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"allContactsView"];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    [myAlert show];

}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
}

@end
