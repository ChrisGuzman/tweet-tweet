//
//  ViewController.m
//  chat
//
//  Created by Chris Guzman on 11/5/15.
//  Copyright © 2015 Chris Guzman. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>
#import "ChatViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"loaded");
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonPressed:(id)sender {
    NSLog(@"I'm pressed");
    PFUser *user = [PFUser user];
    user.username = self.emailField.text;
    user.password = self.passwordField.text;
    user.email = self.emailField.text;
    
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {   // Hooray! Let them use the app now.
            NSLog(@"Logged in!");
        } else {
            NSString *errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
            NSLog(@"%@", errorString);
        }
    }];
    

    
}
- (IBAction)onLoginPressed:(id)sender {
    PFUser *user = [PFUser user];
    user.username = self.emailField.text;
    user.password = self.passwordField.text;
    user.email = self.emailField.text;
    [PFUser logInWithUsernameInBackground:self.emailField.text password:self.passwordField.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                NSLog(@"Logged in!");
                                                ChatViewController *vc = [[ChatViewController alloc] init];
                                                UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
                                                [self presentViewController:nvc animated:YES completion:nil];
                                            });
                                            // Do stuff after successful login.
                                            [self onLoggedin:user];
                                        } else {
                                            // The login failed. Check error to see why.
                                            NSLog(@"error logging in");
                                        }
                                    }];
    


}

-(void)onLoggedin:(PFUser *)user{
    
}

@end
