//
//  StudentTableViewCell.h
//  GestorDeClases
//
//  Created by Pablo Formoso Estada on 3/11/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

@end
