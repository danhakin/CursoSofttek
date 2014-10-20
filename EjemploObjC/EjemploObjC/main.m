//
//  main.m
//  EjemploObjC
//
//  Created by Pablo Formoso Estada on 20/10/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//
#import "NSString+Curso.h"
#import "Alumno.h"
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
#ifndef NDEBUG
        NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
        Alumno *al = [[Alumno alloc] initConNombre:@"Pablo"
                                         yApellido:@"Formoso"];
        
        NSLog(@"%@, %@", [al nombre], al.apellidos);
        
        [al confirmarAsistencia];
        [al nombreEnElCurso];

        if ([al respondsToSelector:@selector(esteNoLoHacemos)]) {
            [al performSelector:@selector(esteNoLoHacemos)];
        } else {
            NSLog(@"Método no implementado");
        }
        
        // Categorias
        NSLog([al.nombre explamacionesAlFinal]);
        NSLog([@"Viva el marisco" explamacionesAlFinal]);
        
        [al implementaUnBloque:^{
#ifndef NDEBUG
            NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
            NSLog(@"Soy el bloque de codigo");
        }];
    }
    
    return 0;
}
