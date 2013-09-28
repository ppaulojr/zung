//
//  zungViewController.m
//  zung
//
//  Created by Pedro Paulo Oliveira Jr on 25/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "zungViewController.h"

@implementation zungViewController
@synthesize question;
@synthesize progressbar;
@synthesize questionNumber;
static bool warn = NO;

bool arr[] = {YES,NO,YES,YES,NO,NO,YES,YES,YES,YES,NO,NO,YES,NO,YES,NO,NO,NO,YES,NO};


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString* dataFilename = [[NSBundle mainBundle]
                              pathForResource:NSLocalizedString(@"zungquest",@"") ofType:@"plist"];
    lista = [[NSArray alloc] initWithContentsOfFile:dataFilename];
    questIdx = 0;
    score = 0;
    self.question.text = [@"" stringByAppendingFormat:@"%@",lista[questIdx]];
    self.questionNumber.text = @"1";

}

- (void) viewDidAppear:(BOOL)animated {
    if (warn) {
        return;
    }
    warning * vc = [[warning alloc] initWithNibName:@"warning" bundle:nil];
    vc.delegate = self;
    [self presentModalViewController:vc animated:YES];
    warn = YES;
}

- (void)viewDidUnload
{
    [self setQuestion:nil];
    [self setProgressbar:nil];
    [self setQuestionNumber:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - View Actions

- (IBAction)answer:(id)sender {
    NSInteger tg = [(UIButton*)sender tag] - 1000;
    if (arr[questIdx]) {
        score += tg+1;
    } else {
        score += 4-tg;
    }
    ++questIdx;
    self.progressbar.progress = questIdx / 20.0;
    if (questIdx == 20) {
        ResultadoViewController * vc = [[ResultadoViewController alloc] initWithNibName:@"ResultadoViewController" bundle:nil];
        vc.delegate = self;
        vc.pontuacao = score;
        [self presentModalViewController:vc animated:YES];
        return;
    }
    self.question.text = [@"" stringByAppendingFormat:@"%@",lista[questIdx]];
    self.questionNumber.text = [NSString stringWithFormat:@"%d",questIdx+1];
}

- (void) warningExit:(UIViewController *)dialog {
    [self dismissModalViewControllerAnimated:YES];
}

- (void) enddisplay:(UIViewController *)control {
    [self dismissModalViewControllerAnimated:YES];
    self.question.text = lista[0];
    self.questionNumber.text = @"1";
    questIdx = 0;
    score = 0;
    self.progressbar.progress = 0.0;
}

@end
