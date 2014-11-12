//
//  Student.h
//  GestorDeClases
//
//  Created by Pablo Formoso Estada on 10/11/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

- (id)initWithDictionary:(NSDictionary *)dic;

@property (assign) int student_id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *lastname;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *avatar_url;

@end
