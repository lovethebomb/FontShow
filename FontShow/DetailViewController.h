//
//  DetailViewController.h
//  FontShow
//
//  Created by HEYMES Lucas on 11/10/12.
//  Copyright (c) 2012 Heymès Lucas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (retain, nonatomic) IBOutlet UITextView *textView;
@property (retain, nonatomic) IBOutlet UISlider *fontSizeSlider;
- (IBAction)changeFontSize:(id)sender;

@end
