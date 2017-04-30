//
//  ViewController.m
//  ContactsApp
//
//  Created by Rana on 4/29/17.
//  Copyright © 2017 MAD. All rights reserved.
//

#import "ViewController.h"

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
    
    NSString *urlString = [[NSString alloc] initWithFormat:@"http://192.168.1.3:8084/ContactsBackEnd/rest/Calculator/add/2/3"];
    
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
    
    NSLog(@"RESPONSE FROM SERVICE IS: %@", jsonData);
    
//    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
//    
//    NSString *status = [dict objectForKey:@"status"];
//    UIAlertView *myAlert;
//    
//    if ([status  isEqual: @"SUCCESS"]) {
//        //redirect to all contacts
//    }
//    else{
//        myAlert = [[UIAlertView alloc] initWithTitle:@"Login Failure" message:status delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles: nil];
//    }
//    
//    [myAlert show];
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
}

@end
