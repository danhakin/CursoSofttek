//
//  DetailViewController.h
//  MasterDetail
//
//  Created by Pablo Formoso Estada on 22/10/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

