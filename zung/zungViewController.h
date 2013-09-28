//
//  zungViewController.h
//  zung
//
//  Created by Pedro Paulo Oliveira Jr on 25/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "warning.h"
#import "ResultadoViewController.h"

@interface zungViewController : UIViewController<WarningDelegate,ResultadoViewControllerDelegate> {
    UILabel *question;
    UIProgressView *progressbar;
    UILabel *questionNumber;
    NSArray * lista;
    NSInteger questIdx;
    NSInteger score;
}

- (IBAction)answer:(id)sender;
@property (nonatomic, strong) IBOutlet UILabel *question;
@property (nonatomic, strong) IBOutlet UIProgressView *progressbar;
@property (nonatomic, strong) IBOutlet UILabel *questionNumber;

@end
