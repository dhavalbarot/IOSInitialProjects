//
//  ViewController.m
//  MyFirstApp
//
//  Created by Dhaval Barot on 06/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    lbl_name.text=@"1324";
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setLabelName:(id)sender {
    
    
    NSString *name = [NSString stringWithFormat:@"%@",[self.txt_name text]];
    NSLog(@"%@",name);
    //[[self lbl_name] setText:name];
    
    //UIImage *img = [[UIImage alloc]initWithCGImage:@"../person.jpeg"];
    //[self.imgView setImage:img];
    
    //[[self imgView] setImage:[UIImage imageNamed:@"persong.jpeg"]];
  //  UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,10,10)];
//    [imgView setImage:[UIImage imageNamed:@"person.jpeg"]];
 //   [imgView setUserInteractionEnabled:YES];
    
    UIImage *img = [UIImage imageNamed:@"person.jpeg"];
    [[self img1] setImage:img];
   // [[self btnName] setValue:@"Well done." forKey:@"ok"];
    [self.btnName setTitle:@"Welldone" forState:UIControlStateNormal];
    
}
@end
