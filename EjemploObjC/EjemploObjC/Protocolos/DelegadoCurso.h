//
//  DelegadoCurso.h
//  EjemploObjC
//
//  Created by Pablo Formoso Estada on 20/10/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DelegadoCurso <NSObject>

- (BOOL)confirmarAsistencia;
- (void)nombreEnElCurso;

@optional

- (void)esteNoLoHacemos;

@end
