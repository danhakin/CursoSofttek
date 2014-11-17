//
//  StudentXmlClient.h
//  GestorDeClases
//
//  Created by Pablo Formoso Estada on 17/11/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import "BaseXmlParser.h"

@interface StudentXmlClient : BaseXmlParser <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

- (void)getStudentsWithController:(id)aController;

@end
