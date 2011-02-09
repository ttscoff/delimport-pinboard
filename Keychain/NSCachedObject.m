//
//  NSCachedObject.m
//  Keychain
//
//  Created by Wade Tregaskis on Sun Feb 16 2003.
//
//  Copyright (c) 2003, Wade Tregaskis.  All rights reserved.
//  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
//    * Neither the name of Wade Tregaskis nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import "NSCachedObject.h"

#import <Keychain/MultiThreading.h>


@implementation NSCachedObject


static NSMutableDictionary *objectDictionary;


// As you can see, the methods below are designed to be thread safe, if keychainCachedObjectLock exists.  In this particular implementation, keychainCachedObjectLock is defined in MultiThreading.h.  If you wish to maintain thread safe code while using this class in your own project, simply copy the keychainCachedObjectLock definition from MultiThreading.h into this file.  Remember if you do this that you will have to initialize this lock prior to your application becoming multi-threaded (e.g. prior to executing any run loops, or when you receive a NSWillBecomeMultiThreadedNotification notification, etc).

+ (id)instanceWithKey:(id)key from:(SEL)selector simpleKey:(BOOL)simpleKey {
    NSEnumerator *enumerator;
    id current, finalResult = nil;
    NSMutableArray *objectArray;

    if (objectDictionary) {
        [keychainCachedObjectLock lock];

        objectArray = [objectDictionary objectForKey:[self class]];

        if (objectArray) {
            enumerator = [objectArray objectEnumerator];

            // Note that the following does duplicate a lot of code, having two near-identical loops side by side.  But the point is to make sure only one branch is done on simpleKey, rather than once for each entry in the object cache, of which there may be many.

            if (simpleKey) {
                while (current = [enumerator nextObject]) {
                    if ([current respondsToSelector:selector]) {
                        if ([current performSelector:selector] == key) {
                            finalResult = current;
                            break;
                        }
                    }
                }
            } else {
                while (current = [enumerator nextObject]) {
                    if ([current respondsToSelector:selector]) {
                        if ([key isEqual:[current performSelector:selector]]) {
                            finalResult = current;
                            break;
                        }
                    }
                }
            }
        }

        [keychainCachedObjectLock unlock];
    }

    return finalResult;
}

+ (id)instanceForSelector:(SEL)selector with:(id)key {
    NSEnumerator *enumerator;
    id current, finalResult = nil;
    NSMutableArray *objectArray;

    if (objectDictionary) {
        [keychainCachedObjectLock lock];

        objectArray = [objectDictionary objectForKey:[self class]];

        if (objectArray) {
            enumerator = [objectArray objectEnumerator];

            while (current = [enumerator nextObject]) {
                if ([current respondsToSelector:selector]) {
                    if ([current performSelector:selector withObject:key]) {
                        finalResult = current;
                        break;
                    }
                }
            }
        }
        
        [keychainCachedObjectLock unlock];
    }
    
    return finalResult;
}

- (id)init {
    NSMutableArray *objectArray;
    
    if (self = [super init]) {
        [keychainCachedObjectLock lock];

        if (!objectDictionary) {
            objectDictionary = [[NSMutableDictionary dictionaryWithCapacity:5] retain];
        }

        objectArray = [objectDictionary objectForKey:[self class]];
        
        if (!objectArray) {
            objectArray = [NSMutableArray arrayWithCapacity:10];
            [objectDictionary setObject:objectArray forKey:[self class]];
        }

        [objectArray addObject:self];
        
        [keychainCachedObjectLock unlock];
    }

    return self;
}

- (void)dealloc {
    NSMutableArray *objectArray = [objectDictionary objectForKey:[self class]];
    
    [keychainCachedObjectLock lock];
    [objectArray removeObject:self];
    [keychainCachedObjectLock unlock];
    
    [super dealloc];
}

@end
