//
//  SleipnirLoader.m
//  Sleipnir
//
//  Created by AlexDenisov on 6/15/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

__attribute__((constructor))
void initialize_spec_table()
{
    Class specClass = objc_getClass("_TtC8Sleipnir12SleipnirSpec");
    int numClasses = objc_getClassList(NULL, 0);
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wvla-extension"
    Class classes[sizeof(Class) * numClasses];
#pragma clang diagnostic pop
    
    numClasses = objc_getClassList(classes, numClasses);
    for (NSInteger i = 0; i < numClasses; i++) {
        Class klass = classes[i];
        Class superclass = class_getSuperclass(klass);
        
        if (superclass == nil) {
            continue;
        }
        
        if (superclass != specClass) {
            continue;
        }
        
        __unused id obj = [[[klass alloc] init] autorelease];
    }
}
