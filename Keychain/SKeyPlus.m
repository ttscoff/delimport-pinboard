//
//  SKeyPlus.m
//  Keychain
//
//  Created by Wade Tregaskis on 26/01/05.
//  Copyright 2005 Wade Tregaskis. All rights reserved.
//

#import "SKeyPlus.h"

#import "CSSMDefaults.h"
#import "CSSMControl.h"
#import "CSSMErrors.h"
#import "UtilitySupport.h"
#import "Logging.h"


@implementation SKeyPlusGenerator

+ (SKeyPlusGenerator*)generatorWithPassword:(NSString*)password uses:(unsigned int)uses {
    return [[[[self class] alloc] initWithPassword:password uses:uses] autorelease];
}

- (int)generateCurrent {
    if (0 == usesRemaining) {
        return 0;
    } else {
        CSSM_RETURN err;
        CSSM_CC_HANDLE ccHandle;
        CSSM_DATA result, original, *input = &original, *output = &result, *temp;
        NSData *finalResult = nil;
        unsigned int iterationsRemaining = usesRemaining;
        
        if ((err = CSSM_CSP_CreateDigestContext(keychainFrameworkCSPHandle(), CSSM_ALGID_SHA1, &ccHandle)) == CSSM_OK) {
            err = copyDataToData(&base, &original);
            
            if (0 == err) {
                
                err = CSSM_OK;
                
                while ((CSSM_OK == err) && (0 < iterationsRemaining)) {
                    clearCSSMData(output);

                    err = CSSM_DigestData(ccHandle, &original, 1, &result);
                    
                    if (err == CSSM_OK) {
                        temp = input;
                        input = output;
                        output = temp;
                        
                        clearCSSMData(output);
                        
                        finalResult = NSDataFromDataNoCopy(&result, YES);
                    } else {
                        PCONSOLE(@"Unable to generate digest because of error #%u - %@.\n", err, CSSMErrorAsString(err));
                        PDEBUG(@"CSSM_DigestData(%d, %p, 1, %p) returned error #%u (%@).\n", ccHandle, &original, &result, err, CSSMErrorAsString(err));
                    }
                }
            } else {
                PDEBUG(@"Unable to copy data to data, error #%d (%s).\n", err, strerror(err));
            }
            
            err = CSSM_DeleteContext(ccHandle);
            
            if (err != CSSM_OK) {
                PCONSOLE(@"Warning: Failed to destroy digest context because of error #%u - %@.\n", err, CSSMErrorAsString(err));
                PDEBUG(@"CSSM_DeleteContext(%d) returned error #%u (%@).\n", ccHandle, err, CSSMErrorAsString(err));
            }
        } else {
            PCONSOLE(@"Unable to create digest context because of error #%u - %@.\n", err, CSSMErrorAsString(err));
            PDEBUG(@"CSSM_CSP_CreateDigestContext(X, CSSM_ALGID_SHA1, %p [%d]) returned error #%u (%@).\n", &ccHandle, ccHandle, err, CSSMErrorAsString(err));
        }
        
        //return finalResult;
        return 0;
    }
}

- (SKeyPlusGenerator*)initWithPassword:(NSString*)password uses:(unsigned int)uses {
    if (password && (0 < uses)) {
        if (self = [super init]) {
            int err;
            
            err = copyNSStringToData(password, &base);
            
            if (0 != err) {
                PDEBUG(@"Unable to copy 'password' to 'base', error #%d (%d).\n", err, strerror(err));
                [self release];
                self = nil;
            } else {
                usesRemaining = uses;
                
                err = [self generateCurrent];
                
                if (0 != err) {
                    [self release];
                    self = nil;
                }
            }
        }
    } else {
        PDEBUG(@"Invalid parameters (password = %p, uses = %u).\n", password, uses);
        
        [self release];
        self = nil;
    }
    
    return self;
}

- (unsigned int)usesRemaining {
    return usesRemaining;
}

- (NSData*)currentPassword {
    if (0 == usesRemaining) {
        return nil;
    } else {
        return NSDataFromData(&current);
    }
}

- (NSData*)nextPassword {
    if (0 == usesRemaining) {
        return nil;
    } else {
        --usesRemaining;
        
        if (0 == usesRemaining) {
            clearCSSMData(&current);
            
            return nil;
        } else {
            int err = [self generateCurrent];
            
            if (0 != err) {
                PDEBUG(@"Unable to generate current password, error #%d (%s).\n", err, strerror(err));
                return nil;
            } else {
                return NSDataFromData(&current);
            }
        }
    }
}

@end


@implementation SKeyPlusVerifier

+ (SKeyPlusVerifier*)verifierWithCurrentPassword:(NSData*)currentPassword usesRemaining:(unsigned int)currentUsesRemaining {
    return [[[[self class] alloc] initWithCurrentPassword:currentPassword usesRemaining:currentUsesRemaining] autorelease];
}

- (SKeyPlusVerifier*)initWithCurrentPassword:(NSData*)currentPassword usesRemaining:(unsigned int)currentUsesRemaining {
    if (currentPassword && (0 < currentUsesRemaining)) {
        if (self = [super init]) {
            copyNSDataToData(currentPassword, &current);
            usesRemaining = currentUsesRemaining;
            
            allowSkips = NO;
        }
    } else {
        PDEBUG(@"Invalid parameters (currentPassword:%p currentUsesRemaining:%u).\n", currentPassword, currentUsesRemaining);
        
        [self release];
        self = nil;
    }
    
    return self;
}

- (void)setAllowsSkips:(BOOL)shouldAllowSkips {
    allowSkips = shouldAllowSkips;
}

- (BOOL)allowsSkips {
    return allowSkips;
}

- (BOOL)verifyAgainst:(NSData*)password usesRemaining:(unsigned int)uses {
    /* TODO */
    
    return NO;
}

- (BOOL)verifyAndUpdateAgainst:(NSData*)password usesRemaining:(unsigned int)uses {
    /* TODO */
    
    return NO;
}

- (unsigned int)usesRemaining {
    return usesRemaining;
}

@end
