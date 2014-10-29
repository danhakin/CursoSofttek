//
//  SWImageViewController.m
//  GestionDeFicheros
//
//  Created by Pablo Formoso Estada on 29/10/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import "SWImageViewController.h"

@interface SWImageViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIImage *tmpImage;

@end

@implementation SWImageViewController

- (void)viewDidLoad {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    [super viewDidLoad];
    [_imageView setImage:_tmpImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)setData:(id)data {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    
    _tmpImage = [(UIImage *)data copy];
}



- (IBAction)ocultar:(id)sender {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    
    [self dismissViewControllerAnimated:YES
                             completion:^{
#ifndef NDEBUG
NSLog(@"%s (line:%d) Vista Oculta", __PRETTY_FUNCTION__, __LINE__);
#endif
    }];
}



@end
