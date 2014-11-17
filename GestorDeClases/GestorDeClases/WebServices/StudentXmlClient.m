//
//  StudentXmlClient.m
//  GestorDeClases
//
//  Created by Pablo Formoso Estada on 17/11/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//
#import "Student.h"
#import "StudentXmlClient.h"
#import "SWNetworkDelegate.h"
@interface StudentXmlClient ()

@property (nonatomic, strong) id<SWNetworkDelegate> controller;
@property (nonatomic, strong) NSMutableData *wip;
@property (nonatomic, strong) NSMutableArray *students;
@property (nonatomic, strong) Student *tmpStudent;

@end

@implementation StudentXmlClient

- (void)getStudentsWithController:(id)aController {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    
    _controller = aController;
    
    NSString *urlString = @"http://curso.softwhisper.es/stundents.xml";
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url
                                              cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:300];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:req
                                                                  delegate:self];
    
    [connection start];
}

#pragma mark - NSURLConnectionDelegate
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    [_controller dataFailure:error.localizedFailureReason];
}

#pragma mark - NSURLConnectionDataDelegate
- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    
    if ((httpResponse.statusCode >= 200 ) && (httpResponse.statusCode < 300)) {
        _wip = NSMutableData.new;
    } else {
        [_controller dataFailure:@"Error en la conexión"];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Agregamos los chunks al _wip
    [_wip appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    
    [self parseDocument:_wip];
    [_controller receiveData:_students];
}


#pragma mark - NSXMLParser
- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
    attributes:(NSDictionary *)attributeDict {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    [self clearContentsOfElement];
    
    if ([elementName isEqualToString:@"stundents"]) {
        _students = NSMutableArray.new;
    }
    if ([elementName isEqualToString:@"stundent"]) {
        if (_tmpStudent != nil) _tmpStudent = nil;
        _tmpStudent = Student.new;
    }
    
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    
    if ([elementName isEqualToString:@"name"]) {
        _tmpStudent.name = _contentsOfElement;
    }
    if ([elementName isEqualToString:@"lastname"]) {
        _tmpStudent.lastname = _contentsOfElement;
    }
    if ([elementName isEqualToString:@"city"]) {
        _tmpStudent.city = _contentsOfElement;
    }
    if ([elementName isEqualToString:@"email"]) {
        _tmpStudent.email = _contentsOfElement;
    }
    if ([elementName isEqualToString:@"image-url"]) {
        _tmpStudent.avatar_url = _contentsOfElement;
    }
    if ([elementName isEqualToString:@"stundent"]) {
        [_students addObject:_tmpStudent];
    }
    
    [self clearContentsOfElement];
}

@end












