//
//  SQLiteAccess+Student.m
//  GestorDeClases
//
//  Created by Pablo Formoso Estada on 10/11/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//
#import "Student.h"
#import "SQLiteAccess+Student.h"

@implementation SQLiteAccess (Student)

+ (Student *)selectByEmail:(NSString *)aEmail {
    // Implementar para el miercoles en la vista de detalle del
    // alumno buscar por email pablo@pabloformoso.com o juan@gmail.com
    NSString *query = [NSString stringWithFormat:@"SELECT * FROM alumnos WHERE email = '%@'", aEmail];
    NSDictionary *dic = [SQLiteAccess selectOneRowWithSQL:query];
    
    Student *student = [Student.alloc initWithDictionary:dic];
    return student;
}

+ (NSArray *)selectAll {
    NSString *query = @"SELECT * FROM alumnos";
    NSArray *tmp = [SQLiteAccess selectManyRowsWithSQL:query];
    
    NSMutableArray *students = [NSMutableArray.alloc init];
    
    for (NSDictionary *dic in tmp) {
        Student *student = [Student.alloc initWithDictionary:dic];
        [students addObject:student];
    }
    
    return students;
}

@end
