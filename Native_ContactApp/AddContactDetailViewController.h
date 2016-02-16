//
//  AddContactDetailViewController.h
//  Native_ContactApp
//
//  Created by Dhaval Barot on 29/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "contact.h"

@protocol AddContactDetailViewControllerDelegate <NSObject>

//Deligates
-(void)sendSelectedRow:(NSInteger)row andSection:(NSInteger)section;
-(void)removeContactFromContactList:(NSInteger)row andSection:(NSInteger)section andContactDetail:(contact *)deletedContact;
-(void)insertNewRow:(contact *)contactDetail;

@end



@interface AddContactDetailViewController : UIViewController <UINavigationControllerDelegate>

//Data Properties
@property (strong,nonatomic) contact *contactDetail;
@property (nonatomic) NSInteger row;
@property (nonatomic) NSInteger section;
@property (strong, nonatomic) NSString *contactImageURL;

//Delegates
@property id<AddContactDetailViewControllerDelegate> delegate;

//UIView Outlets
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UIButton *contactImage;
@property (strong, nonatomic) IBOutlet UITextField *txtFirstName;
@property (strong, nonatomic) IBOutlet UITextField *txtLastName;
@property (strong, nonatomic) IBOutlet UITextField *txtCompany;
@property (strong, nonatomic) IBOutlet UITextField *txtPhone;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtURL;
@property (strong, nonatomic) IBOutlet UITextField *txtStreet1;
@property (strong, nonatomic) IBOutlet UITextField *txtStreet2;
@property (strong, nonatomic) IBOutlet UITextField *txtCity;
@property (strong, nonatomic) IBOutlet UITextField *txtState;
@property (strong, nonatomic) IBOutlet UITextField *txtZip;
@property (strong, nonatomic) IBOutlet UITextField *txtCountry;
@property (strong, nonatomic) IBOutlet UITextField *txtBirthDate;

//@property (strong, nonatomic) IBOutlet UIButton *btnAddSaveContact;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnAddSaveContact;
@property (strong, nonatomic) IBOutlet UIButton *btnAddEditSaveContact;

//Methods
- (IBAction)addImage:(id)sender;
- (IBAction)addContact:(id)sender;
- (IBAction)pushBackToPreviousController:(id)sender;




@end
