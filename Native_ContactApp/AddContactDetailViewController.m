//
//  AddContactDetailViewController.m
//  Native_ContactApp
//
//  Created by Dhaval Barot on 29/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "AddContactDetailViewController.h"
#import "contact.h"
#import "ContactDatabase.h"
#import "ContactListTableViewController.h"

@interface AddContactDetailViewController () <UIImagePickerControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate, UITextFieldDelegate>{
    
    UITextField *activeTextField;
    
}

@end


@implementation AddContactDetailViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    //Register keyboards for notifications
    [self registerForKeyboardNotifications];
    
    //View the contact details of selected contact
    if (_contactDetail && ![self.btnAddEditSaveContact.titleLabel.text isEqualToString:@"Save"])
    {
        [self.btnAddEditSaveContact setTitle:@"Edit" forState:UIControlStateNormal];
        self.title = @"Contact Detail";
        
        //code to find document directory
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
        NSString *filePath = [documentsPath stringByAppendingPathComponent:_contactDetail.imageURL];
        
        //Setting contact image for display
        UIImage *displaypic = [UIImage imageWithContentsOfFile:filePath];
        [_contactImage setTitle:@"" forState:UIControlStateNormal];
        [_contactImage setBackgroundImage:displaypic forState:UIControlStateNormal];
        
        //Setting contact details for display
        _txtFirstName.text =_contactDetail.first_name;
        _txtLastName.text = _contactDetail.last_name;
        _txtCompany.text = _contactDetail.company;
        _txtPhone.text = _contactDetail.phone;
        _txtEmail.text = _contactDetail.email;
        _txtURL.text = _contactDetail.url;
        _txtBirthDate.text = _contactDetail.birth_date;
        
        //Setting contact address for display
        NSArray *addressParts = [_contactDetail.add componentsSeparatedByString:@","];
        _txtStreet1.text = [addressParts objectAtIndex:0];
        _txtStreet2.text = [addressParts objectAtIndex:1];
        _txtCity.text = [addressParts objectAtIndex:2];
        _txtState.text = [addressParts objectAtIndex:3];
        _txtCountry.text = [addressParts objectAtIndex:4];
        _txtZip.text = [addressParts objectAtIndex:5];
        
        
        
        //Disabling fields Way 1
        //[_txtFirstName setUserInteractionEnabled:NO];     //This will also work
        
        //Disabling fields Way 2
        [_contactImage setEnabled:NO];
        [_txtFirstName setEnabled:NO];
        [_txtLastName setEnabled:NO];
        [_txtCompany setEnabled:NO];
        [_txtPhone setEnabled:NO];
        [_txtEmail setEnabled:NO];
        [_txtURL setEnabled:NO];
        [_txtStreet1 setEnabled:NO];
        [_txtStreet2 setEnabled:NO];
        [_txtCity setEnabled:NO];
        [_txtState setEnabled:NO];
        [_txtCountry setEnabled:NO];
        [_txtZip setEnabled:NO];
        [_txtBirthDate setEnabled:NO];
        
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)addImage:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle: nil delegate: self cancelButtonTitle: @"Cancel" destructiveButtonTitle: nil otherButtonTitles: @"Take a new photo", @"Choose from existing", nil];
    
    [actionSheet showInView:self.view];
}


//Add or Edit Contact
- (IBAction)addContact:(id)sender
{
    //Adding NewContact
    if ([_btnAddEditSaveContact.titleLabel.text isEqualToString:@"Done"])
    {
        //Validation
        if([_txtFirstName.text isEqualToString:@""] && [_txtLastName.text isEqualToString:@""] )
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Validation" message:@"Enter Any Detail." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        // If valid details then adding new contact
        else
        {
            _contactDetail = [[contact alloc] init];
            
            _contactDetail.imageURL = _contactImageURL;
            _contactDetail.first_name = _txtFirstName.text;
            _contactDetail.last_name = _txtLastName.text;
            _contactDetail.company = _txtCompany.text;
            _contactDetail.email = _txtEmail.text;
            _contactDetail.phone = _txtPhone.text;
            _contactDetail.url = _txtURL.text;
            _contactDetail.add = [NSString stringWithFormat:@"%@, %@, %@, %@, %@, %@", _txtStreet1.text, _txtStreet2.text, _txtCity.text, _txtState.text, _txtCountry.text, _txtZip.text];
            _contactDetail.birth_date = _txtBirthDate.text;
            
            //adding contact to database using addContact Method
            [[ContactDatabase database] addContact:_contactDetail];
            
            //
            NSInteger latestId = [[ContactDatabase database] getLatestId];
            NSFileManager *fileManager = [[NSFileManager alloc] init];
            NSString *imgName = [NSString stringWithFormat:@"img_%d.png", latestId];
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
            NSString *filePath = [documentsPath stringByAppendingPathComponent:imgName];
            
            //[fileManager removeItemAtPath:_contactImageURL error:nil];
            if (_contactImageURL) {
                [fileManager moveItemAtPath:_contactImageURL toPath:filePath error:nil];
                _contactDetail.imageURL = imgName;

            }
            
            
            _contactDetail.contactId = latestId;
            [[ContactDatabase database] addContact:_contactDetail];
            
            [[ContactListTableViewController getContactListInstance] addObject:_contactDetail];
            [self.delegate insertNewRow:_contactDetail];
            [self dismissViewControllerAnimated:YES completion:nil];
            
            
        }
    }
    //Making fields editable for edit on click of edit
    else if([_btnAddEditSaveContact.titleLabel.text isEqualToString:@"Edit"])
    {
        [_contactImage setEnabled:YES];
        [_txtFirstName setEnabled:YES];
        [_txtLastName setEnabled:YES];
        [_txtCompany setEnabled:YES];
        [_txtPhone setEnabled:YES];
        [_txtEmail setEnabled:YES];
        [_txtStreet1 setEnabled:YES];
        [_txtStreet2 setEnabled:YES];
        [_txtCity setEnabled:YES];
        [_txtState setEnabled:YES];
        [_txtCountry setEnabled:YES];
        [_txtZip setEnabled:YES];
        
        [_btnAddEditSaveContact setTitle:@"Save" forState:UIControlStateNormal];
    }
    //Update contact with new information
    else
    {
        [_contactImage setEnabled:NO];
        [_txtFirstName setEnabled:NO];
        [_txtLastName setEnabled:NO];
        [_txtCompany setEnabled:NO];
        [_txtPhone setEnabled:NO];
        [_txtEmail setEnabled:NO];
        [_txtStreet1 setEnabled:NO];
        [_txtStreet2 setEnabled:NO];
        [_txtCity setEnabled:NO];
        [_txtState setEnabled:NO];
        [_txtCountry setEnabled:NO];
        [_txtZip setEnabled:NO];
        [_txtBirthDate setEnabled:NO];
        
        
        _contactDetail.imageURL = (_contactImageURL)?_contactImageURL:_contactDetail.imageURL;
        _contactDetail.first_name = _txtFirstName.text;
        _contactDetail.last_name = _txtLastName.text;
        _contactDetail.company = _txtCompany.text;
        _contactDetail.email = _txtEmail.text;
        _contactDetail.phone = _txtPhone.text;
        _contactDetail.url = _txtURL.text;
        _contactDetail.add = [NSString stringWithFormat:@"%@,%@,%@,%@,%@,%@", _txtStreet1.text, _txtStreet2.text, _txtCity.text, _txtState.text, _txtCountry.text, _txtZip.text];
        _contactDetail.birth_date = _txtBirthDate.text;
        
        [[ContactDatabase database] addContact:_contactDetail];
        
        [[ContactListTableViewController getContactListInstance] setObject:_contactDetail atIndexedSubscript:_row];
        [_btnAddEditSaveContact setTitle:@"Edit" forState:UIControlStateNormal];
        [self.delegate sendSelectedRow:_row andSection:_section];
        
    }
    
    
}

- (IBAction)deleteContact:(id)sender
{
    
    [[ContactDatabase database] deleteContactById:_contactDetail.contactId];
    //[[ContactListTableViewController getContactListInstance] removeObjectAtIndex:_row];
    [self.delegate removeContactFromContactList:_row andSection:_section andContactDetail:_contactDetail];
    [[ContactListTableViewController getContactListInstance] removeObject:_contactDetail];
    [self dismissController];
    
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self takeNewPhotoFromCamera];
            break;
        case 1:
            [self choosePhotoFromExistingImages];
        default:
            break;
    }
}

- (void)takeNewPhotoFromCamera
{
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        controller.sourceType = UIImagePickerControllerSourceTypeCamera;
        controller.allowsEditing = NO;
        controller.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypeCamera];
        controller.delegate = self;
        [self.navigationController presentViewController: controller animated: YES completion: nil];
    }
    else
    {
        NSLog(@"Camera not avilable.");
    }
}

-(void)choosePhotoFromExistingImages
{
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary])
    {
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        controller.allowsEditing = NO;
        controller.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypePhotoLibrary];
        controller.delegate = self;
        [self.navigationController presentViewController: controller animated: YES completion: nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self.navigationController dismissViewControllerAnimated: YES completion: nil];
    UIImage *image = [info valueForKey: UIImagePickerControllerOriginalImage];
    NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
     //Add the file name
   
    
    NSString *filePath;
    
    if(_contactDetail.contactId)
    {
        
        NSString *imgURL = [NSString stringWithFormat:@"img_%ld.jpg",_contactDetail.contactId];
        filePath = [documentsPath stringByAppendingPathComponent:imgURL];
        _contactImageURL = filePath;
        //assigning image name to image url
        _contactImageURL = imgURL;
        
    }
    else
    {
        filePath = [documentsPath stringByAppendingPathComponent:@"imageUpload.jpg"];
        _contactImageURL = filePath;
    }
    
    
    
    
    [imageData writeToFile:filePath options:NSDataWritingAtomic error:nil];
    
    [_contactImage setTitle:@"" forState:UIControlStateNormal];
    
    [_contactImage setBackgroundImage:image forState:UIControlStateNormal];
    
    //ImageViewController *imageController = [[ImageViewController alloc]initWithNibName:@"ImageViewController" bundle:nil];
    //imageController.selectedImageView.image = image;
    //[self.navigationController pushViewController:imageController animated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;
{
    [self.navigationController dismissViewControllerAnimated: YES completion: nil];
}

- (IBAction)pushBackToPreviousController:(id)sender
{
    self.dismissController;
}

-(void)dismissController
{
    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

//- (void)textFieldDidBeginEditing:(UITextField *)textField
//{
//    
//    activeTextField = textField;
//    //self.scrollView.contentOffset = CGPointMake(0, textField.frame.origin.y-60);
//}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height+40.0, 0.0);
    
    _scrollView.contentInset = contentInsets;
    _scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your application might not need or want this behavior.
    
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    
    
    if (!CGRectContainsPoint(aRect, activeTextField.frame.origin) )
    {
        CGPoint scrollPoint = CGPointMake(0.0, activeTextField.frame.origin.y-kbSize.height);
        [_scrollView setContentOffset:scrollPoint animated:YES];
    }
    
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    _scrollView.contentInset = contentInsets;
    _scrollView.scrollIndicatorInsets = contentInsets;
}



@end
