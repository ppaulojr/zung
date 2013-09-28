//
//  ResultadoViewController.m
//  zung
//
//  Created by Pedro Paulo Oliveira Jr on 25/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ResultadoViewController.h"


@implementation ResultadoViewController
@synthesize interpretation;
@synthesize points;
@synthesize delegate,pontuacao;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    interstitial_ = [[GADInterstitial alloc] init];
    interstitial_.delegate = self;
    interstitial_.adUnitID = @"a14ddd62e202658";
    [interstitial_ loadRequest:[GADRequest request]];
    
    NSString * resultado;
    if (pontuacao <= 49) {
        resultado = NSLocalizedString(@"Normal Range", @"");
    } else {
        if (pontuacao > 49 && pontuacao < 59) {
            resultado = NSLocalizedString(@"Mild depression", @"");
        } else {
            if (pontuacao > 59 && pontuacao <69) {
                resultado = NSLocalizedString(@"Moderate depression", @"");
            } else {
                resultado = NSLocalizedString(@"Severe depression", @"");
            }
        }
    }
    self.points.text = [NSLocalizedString(@"Points: ", @"") stringByAppendingFormat:@"%d",pontuacao];
    self.interpretation.text = resultado;
}

- (void) interstitialDidReceiveAd:(GADInterstitial *)ad {
    [interstitial_ presentFromRootViewController:self];
}

- (void) interstitial:(GADInterstitial *)ad didFailToReceiveAdWithError:(GADRequestError *)error {
    // Create a view of the standard size at the bottom of the screen.
    bannerView_ = [[GADBannerView alloc]
                   initWithFrame:CGRectMake(0.0,
                                            44,
                                            GAD_SIZE_320x50.width,
                                            GAD_SIZE_320x50.height)];
    
    // Specify the ad's "unit identifier." This is your AdMob Publisher ID.
    bannerView_.adUnitID = @"a14ddd62e202658";
    
    // Let the runtime know which UIViewController to restore after taking
    // the user wherever the ad goes and add it to the view hierarchy.
    bannerView_.rootViewController = self;
    [self.view addSubview:bannerView_];
    
    // Initiate a generic request to load it with an ad.
    [bannerView_ loadRequest:[GADRequest request]];
}

- (void)viewDidUnload
{
    [self setInterpretation:nil];
    [self setPoints:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)closeForm:(id)sender {
    [self.delegate enddisplay:self];
}

@end
