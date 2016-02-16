//
//  ViewController.m
//  Stanford_Lec_5_Attributor
//
//  Created by Dhaval Barot on 21/01/16.
//  Copyright (c) 2016 Chirag Sanghvi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:self.btnOutline.currentTitle];
    [title setAttributes:@{NSStrokeColorAttributeName:self.btnOutline.tintColor,
                           NSStrokeWidthAttributeName:@3
                           } range:NSMakeRange(0,[title length])];
    [self.btnOutline setAttributedTitle:title forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)changeColorOfSeletedText:(UIButton *)sender {
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName value:sender.backgroundColor range:self.body.selectedRange];
}

- (IBAction)setOutlineonSelectedText:(id)sender {
    [self.body.textStorage addAttributes:@{ NSStrokeColorAttributeName:[UIColor blackColor],
                                            NSStrokeWidthAttributeName:@-3
                                            } range:self.body.selectedRange];
    
}

- (IBAction)unoutlineSelectedText:(id)sender {
    [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName range:self.body.selectedRange];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preferredFontsChanged:) name:UIContentSizeCategoryDidChangeNotification object:nil];
    
}

-(void)preferredFontsChanged:(NSNotification *)notification
{
    self.body.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

@end
