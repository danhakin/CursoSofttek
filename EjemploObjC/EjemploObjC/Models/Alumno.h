//
//  Alumno.h
//  EjemploObjC
//
//  Created by Pablo Formoso Estada on 20/10/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import "DelegadoCurso.h"
#import <Foundation/Foundation.h>

@interface Alumno : NSObject <DelegadoCurso>

@property(nonatomic, strong) NSString *nombre;
@property(nonatomic, strong) NSString *apellidos;
@property(assign) BOOL asiste;

- (id)initConNombre:(NSString *)nombre;
- (id)initConNombre:(NSString *)nombre yApellido:(NSString *)apellido;

- (void)implementaUnBloque:(void (^)(void))bloqueDeCodigo;

@end
