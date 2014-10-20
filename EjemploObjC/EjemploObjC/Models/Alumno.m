//
//  Alumno.m
//  EjemploObjC
//
//  Created by Pablo Formoso Estada on 20/10/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import "Alumno.h"

@implementation Alumno

- (id)initConNombre:(NSString *)nombre {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    self = [super init];
    if (self) {
        _nombre = nombre;
    }
    return self;
}

- (id)initConNombre:(NSString *)nombre yApellido:(NSString *)apellido {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    self = [super init];
    if (self) {
        _nombre = nombre;
        _apellidos = apellido;
    }
    return self;
}
#pragma mark - DelgadoCurso
- (BOOL)confirmarAsistencia {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    return YES;
}

- (void)nombreEnElCurso {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    NSLog(@"Este es mi nombre");
}


- (void)implementaUnBloque:(void (^)(void))bloqueDeCodigo {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    NSLog(@"Antes del bloque.....");
    bloqueDeCodigo();
    NSLog(@"Después del bloque.....");
}















@end
