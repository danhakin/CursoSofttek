//
//  SWShowBundleTextViewController.m
//  GestionDeFicheros
//
//  Created by Pablo Formoso Estada on 27/10/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import "SWShowBundleTextViewController.h"

@interface SWShowBundleTextViewController ()

@end

@implementation SWShowBundleTextViewController

- (void)viewDidLoad {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
}

- (void)viewDidAppear:(BOOL)animated {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
}

-(void)viewWillDisappear:(BOOL)animated {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
}

- (void)viewDidDisappear:(BOOL)animated {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
