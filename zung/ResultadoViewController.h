//
//  ResultadoViewController.h
//  zung
//
//  Created by Pedro Paulo Oliveira Jr on 25/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADBannerView.h"
#import "GADInterstitial.h"

@protocol ResultadoViewControllerDelegate;

@interface ResultadoViewController : UIViewController <GADInterstitialDelegate> {
    id <ResultadoViewControllerDelegate> __weak delegate;
    NSInteger pontuacao;
    UILabel *interpretation;
    UILabel *points;
    GADBannerView *bannerView_;
    GADInterstitial *interstitial_;
}

@property (nonatomic, weak) id<ResultadoViewControllerDelegate> delegate;
@property (nonatomic, assign) NSInteger pontuacao;
@property (nonatomic, strong) IBOutlet UILabel *interpretation;
@property (nonatomic, strong) IBOutlet UILabel *points;
- (IBAction)closeForm:(id)sender;

@end

@protocol ResultadoViewControllerDelegate <NSObject>

- (void) enddisplay:(UIViewController*)control;

@end