//
//  ChatViewController.m
//  chat
//
//  Created by Chris Guzman on 11/5/15.
//  Copyright © 2015 Chris Guzman. All rights reserved.
//

#import "ChatViewController.h"
#import <Parse/Parse.h>

@interface ChatViewController ()

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (IBAction)sendBtnPressed:(id)sender {
    PFObject *gameScore = [PFObject objectWithClassName:@"Message"];
    gameScore[@"text"] = self.chatField.text;
    [gameScore saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"success!");
        } else {
            NSLog(@"failure :(");
        }
    }];
}

@end
