//
//  ImageViewController.m
//  Stanford_Lecture_10_Demo_Imaginarium
//
//  Created by Dhaval Barot on 19/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImage *image;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;


@end

@implementation ImageViewController

-(void) setImageURL:(NSURL *)imageURL
{
    _imageURL = imageURL;
    //self.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.imageURL]];
    
    //Following code will use to download image before loading in background
    [self startDownloadingImage];
    
    //Image From Local File
    //self.image = [UIImage imageNamed:@"photo_1.jpg"];
}

-(void) startDownloadingImage
{
    [self.spinner startAnimating];
    self.image = nil;
    if(self.imageURL)
    {
        NSURLRequest *request = [NSURLRequest requestWithURL:self.imageURL];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
        NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *localfile, NSURLResponse *response, NSError *error) {
            if(!error)
            {
                if([request.URL isEqual:self.imageURL])
                {
                    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:localfile]];
                    dispatch_async(dispatch_get_main_queue(),^{self.image = image;});
                }
            }
        }];
        [task resume];
    }
}

-(void) setScrollView:(UIScrollView *)scrollView
{
    _scrollView = scrollView;
    _scrollView.minimumZoomScale = 0.2;
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.delegate = self;
    self.scrollView.contentSize = self.image ? self.image.size : CGSizeZero;
}

-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return  self.imageView;
}

-(UIImageView *)imageView
{
    if(!_imageView)
    {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

-(UIImage *)image
{
    return self.imageView.image;
}

-(void) setImage:(UIImage *)image
{
    self.imageView.image = image;
    [self.imageView sizeToFit];
    self.scrollView.contentSize = self.image?self.image.size : CGSizeZero;
    [self.spinner stopAnimating];

}

-(void) viewDidLoad
{
    [super viewDidLoad];
    [self.scrollView addSubview:self.imageView];
    
}

@end
