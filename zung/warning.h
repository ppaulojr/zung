//
//  warning.h
//  zung
//
//  Created by Pedro Paulo Oliveira Jr on 25/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WarningDelegate;

@interface warning : UIViewController {
    id<WarningDelegate> delegate;
    UIButton *close;
}
- (IBAction)closeit:(id)sender;
@property (nonatomic,assign) id<WarningDelegate> delegate;
@end

@protocol WarningDelegate <NSObject>

- (void) warningExit:(UIViewController*)dialog;

@end