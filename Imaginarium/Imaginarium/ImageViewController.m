//
//  ImageViewController.m
//  Imaginarium
//
//  Created by Dhaval Barot on 20/01/16.
//  Copyright (c) 2016 Chirag Sanghvi. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController () <UIScrollViewDelegate>
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIImage *image;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageController;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@end

@implementation ImageViewController

-(void)setScrollView:(UIScrollView *)scrollView
{
    _scrollView = scrollView;
    _scrollView.minimumZoomScale = 0.1;
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.delegate = self;
_scrollView.contentSize = _imageView.image?_imageView.image.size:CGSizeZero;
}

//Delegates
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}


//Displays image on storyboard
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.scrollView addSubview:_imageView];
    
    
}

//setter method of imagerURL variable
-(void)setImageURL:(NSURL *)imageURL
{
    _imageURL = imageURL;
    //self.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.imageURL]];
    [self downloadImage];
}

-(void)downloadImage{
    self.image = nil;
    if(self.imageURL)
    {
        [self.spinner startAnimating];
        NSURLRequest *request = [NSURLRequest requestWithURL:self.imageURL];
        NSURLSessionConfiguration *configure = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configure];
        NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *localfile, NSURLResponse *response, NSError *error) {
            if(!error){
                if([request.URL isEqual:self.imageURL])
                {
                    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.imageURL]];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.image = image;
                        
                        
                    });
                }
            }
        }];
        [task resume];
    
    }

}

//getter method of imageView instance variable
-(UIImageView *)imageView{
    if(!_imageView){
        _imageView = [[UIImageView alloc] init];
        
    }
    return _imageView;
}

//getter method of image instance variable
-(UIImage *)image
{
    return _imageView.image;
}


//setter method of image instance variable
-(void)setImage:(UIImage *)image
{
    self.imageView.image = image;
   [self.imageView sizeToFit];
    _scrollView.contentSize = _imageView.image?_imageView.image.size:CGSizeZero;
    //[self.spinner hidesWhenStopped];
    [self.spinner stopAnimating];
    self.pageController.numberOfPages = (self.imageView.image.size.width/UIScreen.mainScreen.bounds.size.width);
    NSLog(@"%li",(long)self.pageController.numberOfPages);
    

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // Load the pages that are now on screen
   // self.pageController.currentPage = self.scrollView.contentOffset.x/UIScreen.mainScreen.bounds.size.width;
//    CGFloat width = UIScreen.mainScreen.bounds.size.width;
    CGFloat pageWidth = self.scrollView.frame.size.width;
    NSInteger page = (NSInteger)floor((self.scrollView.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
    self.pageController.currentPage = page;
    NSLog(@"%li",self.pageController.currentPage);
}






@end
