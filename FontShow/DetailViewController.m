//
//  DetailViewController.m
//  FontShow
//
//  Created by HEYMES Lucas on 11/10/12.
//  Copyright (c) 2012 Heymès Lucas. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController
@synthesize textView;

- (void)dealloc
{
    [_detailItem release];
    [textView release];
    [super dealloc];
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        [_detailItem release];
        _detailItem = [newDetailItem retain];

        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        textView.font = [UIFont fontWithName:self.detailItem size: 24];
        self.navigationItem.title = self.detailItem;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
							
- (void)viewDidUnload {
    [self setTextView:nil];
    [super viewDidUnload];
}
@end
