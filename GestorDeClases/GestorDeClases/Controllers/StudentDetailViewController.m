//
//  StudentDetailViewController.m
//  GestorDeClases
//
//  Created by Pablo Formoso Estada on 12/11/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import "Student.h"
#import "SQLiteAccess+Student.h"
#import "StudentDetailViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface StudentDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

@property (nonatomic, strong) Student *student;

@end

@implementation StudentDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _student = [SQLiteAccess selectByEmail:_email];
    
    [_nameLabel setText:_student.name];
    [_cityLabel setText:_student.city];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSURL *url = [NSURL URLWithString:@"http://imagenes.publico-estaticos.es/resources/archivos/2013/2/6/1360159127489curiosity.jpg"];
    
    /* No hacer nunca una petición sincrona en la UI
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    [_avatarImageView setImage:image]; */
    
    [_avatarImageView setImageWithURL:url];
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
