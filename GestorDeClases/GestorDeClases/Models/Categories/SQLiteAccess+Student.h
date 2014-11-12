//
//  SQLiteAccess+Student.h
//  GestorDeClases
//
//  Created by Pablo Formoso Estada on 10/11/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

@class Student;
#import "SQLiteAccess.h"

@interface SQLiteAccess (Student)

+ (Student *)selectByEmail:(NSString *)aEmail;
+ (NSArray *)selectAll;

@end
