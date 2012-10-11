//
//  MasterViewController.m
//  FontShow
//
//  Created by HEYMES Lucas on 11/10/12.
//  Copyright (c) 2012 Heymès Lucas. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"


@implementation MasterViewController
@synthesize families;

- (void)dealloc
{
    [_detailViewController release];
    [families release];
    [super dealloc];
}

// Callback chargement de la vue
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"Polices";
    self.families = [[UIFont familyNames] sortedArrayUsingSelector:@selector(compare:)];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [families count];
}

// Affiche le titre de la section
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [families objectAtIndex:section];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *familyName = [families objectAtIndex:section];
    NSArray *fontsArray = [UIFont fontNamesForFamilyName:familyName];
    return [fontsArray count]; // retourne le total de fonts dans une famille
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSString *familyName = [families objectAtIndex:indexPath.section];
    NSArray *fontsArray = [UIFont fontNamesForFamilyName:familyName];
    NSString *fontName = [fontsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = fontName;
    cell.textLabel.font = [UIFont fontWithName:fontName size:16];

    return cell;
}

// Selection d'une row
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.detailViewController) {
        self.detailViewController = [[[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil] autorelease];
    }
    NSString *familyName = [families objectAtIndex:indexPath.section];
    NSArray *fontsArray = [UIFont fontNamesForFamilyName:familyName];
    NSString *fontName = [fontsArray objectAtIndex:indexPath.row];
    self.detailViewController.detailItem = fontName;
    
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

@end
