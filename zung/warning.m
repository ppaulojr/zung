//
//  warning.m
//  zung
//
//  Created by Pedro Paulo Oliveira Jr on 25/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "warning.h"


@implementation warning
@synthesize delegate;


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)closeit:(id)sender {
    [self.delegate warningExit:self];
}
@end
