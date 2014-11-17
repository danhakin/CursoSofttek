//
//  SWNetworkDelegate.h
//  GestorDeClases
//
//  Created by Pablo Formoso Estada on 17/11/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SWNetworkDelegate <NSObject>

- (void)receiveData:(NSMutableArray *)anArray;
- (void)dataFailure:(NSString *)anErrorMessage;

@end
