//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Anthony Ma on 2016-07-11.
//  Copyright © 2016 Anthony Ma. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIView *imageContainer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //create scroll view
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 10, CGRectGetWidth(self.view.frame) - 20, CGRectGetHeight(self.view.frame) - 20)];
    scrollView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:scrollView];
    
    //container
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(scrollView.frame), CGRectGetHeight(scrollView.frame))];
    [scrollView addSubview:containerView];
    self.imageContainer = containerView;
    
    
    // create image views
    UIImage *lighthouse = [UIImage imageNamed:@"Lighthouse.jpg"];
    UIImage *lighthouseInField = [UIImage imageNamed:@"Lighthouse-in-Field.jpg"];
    UIImage *lighthouseNight = [UIImage imageNamed:@"Lighthouse-night.jpg"];
    
    //array of images
    NSArray *images = @[lighthouse, lighthouseInField, lighthouseNight];
    
    //keeping track of xOffset
    CGFloat xOffset = 0;
    
    //each image's frame created as the same size as scroll view
    for (UIImage *eachImage in images)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(xOffset, 0, CGRectGetWidth(scrollView.frame), CGRectGetHeight(scrollView.frame))];
        imageView.image = eachImage;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [containerView addSubview:imageView];
        
        xOffset += CGRectGetWidth(imageView.frame);
    }
    
    //scrollview boundaries
    scrollView.contentSize = CGSizeMake(xOffset, CGRectGetHeight(scrollView.frame));
    
    scrollView.pagingEnabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
