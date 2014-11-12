//
//  Student.m
//  GestorDeClases
//
//  Created by Pablo Formoso Estada on 10/11/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import "Student.h"

@implementation Student

- (id)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.name = [dic objectForKey:@"nombre"];
        self.city = [dic objectForKey:@"ciudad"];
        self.email = [dic objectForKey:@"email"];
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)coder {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    
    self = [[Student alloc] init];
    
    self.name = [coder decodeObjectForKey:@"name"];
    self.lastname = [coder decodeObjectForKey:@"lastname"];
    self.email = [coder decodeObjectForKey:@"email"];
    self.city = [coder decodeObjectForKey:@"city"];
    self.student_id = [coder decodeIntForKey:@"student_id"];
    self.avatar_url = [coder decodeObjectForKey:@"avatar"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    
    [coder encodeInt:_student_id forKey:@"student_id"];
    [coder encodeObject:_name forKey:@"name"];
    [coder encodeObject:_lastname forKey:@"lastname"];
    [coder encodeObject:_email forKey:@"email"];
    [coder encodeObject:_city forKey:@"city"];
    [coder encodeObject:_avatar_url forKey:@"avatar"];
}

@end
