//
//  AddContactViewController.m
//  ContactsApp
//
//  Created by Rana on 4/29/17.
//  Copyright © 2017 MAD. All rights reserved.
//

#import "AddContactViewController.h"
#import "Contact.h"

@interface AddContactViewController (){

    NSMutableArray *myFriends;
}

@end

@implementation AddContactViewController{
    
    NSMutableData *jsonDataRes;


}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    myFriends=[[NSMutableArray alloc]init];
    [self.storyboard instantiateViewControllerWithIdentifier:@"addContactView"];
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

- (IBAction)addFriend:(id)sender {
    NSData *userDate=[[NSUserDefaults standardUserDefaults] objectForKey:@"contact"];
    Contact *contact=[NSKeyedUnarchiver unarchiveObjectWithData:userDate];
    
    NSString *contactEmail=contact.email;
    NSString *urlString = [[NSString alloc] initWithFormat:@"http://192.168.137.150:8080/ContactsBackEnd/rest/ContactService/addContact/%@/%@", contactEmail, _friendEmailTxt.text];
    
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    [conn start];
    [_friendEmailTxt resignFirstResponder];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [jsonDataRes appendData:data];
}

-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    jsonDataRes = [NSMutableData new];
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection{
    
    //NSLog(@"RESPONSE FROM SERVICE IS: %@", jsonDataRes);
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonDataRes options:0 error:nil];
    
    NSString *result = [dict objectForKey:@"result"];
    UIAlertView *myAlert;
    
    if ([result  isEqual: @"AlreadyFriends"]) {
        myAlert = [[UIAlertView alloc] initWithTitle:@"You're Already Friends !" message:result delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles: nil];
    }
    
    else if ([result  isEqual: @"WrongFriendEmail"]) {
        myAlert = [[UIAlertView alloc] initWithTitle:@"No such email is registered!" message:result delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles: nil];
    }
    
    else {
        myAlert = [[UIAlertView alloc] initWithTitle:@"Succeeded" message:result delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        
        Contact *friend = [[Contact alloc]init];
        
        
        friend.firstname = [dict objectForKey:@"firstname"];
        friend.lastname = [dict objectForKey:@"lastname"];
        friend.email = [dict objectForKey:@"email"];
        friend.pass = [dict objectForKey:@"pass"];
        friend.gender = [dict objectForKey:@"gender"];
        friend.phone = [dict objectForKey:@"phone"];
        
        [myFriends addObject:friend];
        NSLog(@"%@",friend.firstname);
 
        
        [self.navigationController popViewControllerAnimated:YES];
        
        

    }
    
    [myAlert show];
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
}



@end
