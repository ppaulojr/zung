//
//  zungAppDelegate.h
//  zung
//
//  Created by Pedro Paulo Oliveira Jr on 25/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class zungViewController;

@interface zungAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet zungViewController *viewController;

@end
