//
//  CSSMControl.m
//  Keychain
//
//  Created by Wade Tregaskis on Sat Mar 15 2003.
//
//  Copyright (c) 2003, Wade Tregaskis.  All rights reserved.
//  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
//    * Neither the name of Wade Tregaskis nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#include "CSSMControl.h"

#import "CSSMDefaults.h"
#import "CSSMUtils.h"
#import "CSSMErrors.h"
#import "Logging.h"


const CSSM_VERSION version = {2, 0};
CSSM_PVC_MODE policy = CSSM_PVC_NONE;
CSSM_ACCESS_CREDENTIALS creds;
CSSM_GUID myGUID, cspGUID, tpGUID, clGUID;
CSSM_CSP_HANDLE cspHandle;
CSSM_TP_HANDLE tpHandle;
CSSM_CL_HANDLE clHandle;
bool clReady = false, tpReady = false, cspReady = false, cssmReady = false;


CSSM_VERSION keychainFrameworkCSSMVersion(void) {
    return version;
}

CSSM_GUID keychainFrameworkGUID(void) {
    return myGUID;
}

CSSM_GUID keychainFrameworkCSPGUID(void) {
    return cspGUID;
}

bool setKeychainFrameworkCSPGUID(CSSM_GUID newGUID) {
    if (0 != memcmp(&cspGUID, &newGUID, sizeof(CSSM_GUID))) {
        PDEBUG(@"Changing CSP GUID from %@ to %@.\n", GUIDAsString(cspGUID), GUIDAsString(newGUID));

        cspEnd();
        
    	cspGUID = newGUID;
        
        return cspInit();
    } else {
        return true;
    }
}

CSSM_GUID keychainFrameworkTPGUID(void) {
    return tpGUID;
}

bool setKeychainFrameworkTPGUID(CSSM_GUID newGUID) {
    if (0 != memcmp(&tpGUID, &newGUID, sizeof(CSSM_GUID))) {
        PDEBUG(@"Changing TP GUID from %@ to %@.\n", GUIDAsString(tpGUID), GUIDAsString(newGUID));
        
        tpEnd();
        
    	tpGUID = newGUID;
        
        return tpInit();
    } else {
        return true;
    }
}

CSSM_GUID keychainFrameworkCLGUID(void) {
    return clGUID;
}

bool setKeychainFrameworkCLGUID(CSSM_GUID newGUID) {
    if (0 != memcmp(&clGUID, &newGUID, sizeof(CSSM_GUID))) {
        PDEBUG(@"Changing CL GUID from %@ to %@.\n", GUIDAsString(clGUID), GUIDAsString(newGUID));
        
        clEnd();
        
    	clGUID = newGUID;
        
        return clInit();
    } else {
        return true;
    }
}

CSSM_CSP_HANDLE keychainFrameworkCSPHandle(void) {
    if (cspInit()) {
        return cspHandle;
    } else {
        return (CSSM_CSP_HANDLE)NULL;
    }
}

CSSM_TP_HANDLE keychainFrameworkTPHandle(void) {
    if (tpInit()) {
        return tpHandle;
    } else {
        return (CSSM_TP_HANDLE)NULL;
    }
}

CSSM_TP_HANDLE keychainFrameworkCLHandle(void) {
    if (clInit()) {
        return clHandle;
    } else {
        return (CSSM_TP_HANDLE)NULL;
    }
}

CSSM_ACCESS_CREDENTIALS* keychainFrameworkCredentials(void) {
    return &creds;
}

void* genericCSSMMalloc(uint32 size, void *ref) {
    return malloc(size);
}

void* genericCSSMRealloc(void *ptr, uint32 newSize, void *ref) {
    return realloc(ptr, newSize);
}

void* genericCSSMCalloc(uint32 num, uint32 size, void *ref) {
    return calloc(num, size);
}

void genericCSSMFree(void *ptr, void *ref) {
    return free(ptr);
}

const CSSM_MEMORY_FUNCS appAllocators = {genericCSSMMalloc, genericCSSMFree, genericCSSMRealloc, genericCSSMCalloc, NULL};

bool cssmInit(void) {
    CSSM_RETURN err;
    
    if (!cssmReady) {
        int i;
        
        /* These have to be set here (or at least, not statically at define-time, because Apple's constants are not actually constants, so the compiler can't handle the static assignment. */
        cspGUID = gGuidAppleCSP;
        tpGUID = gGuidAppleX509TP;
        clGUID = gGuidAppleX509CL;

        memset(&creds, 0, sizeof(CSSM_ACCESS_CREDENTIALS));

        srandom(time(0));
        myGUID.Data1 = random();
        myGUID.Data2 = random();
        myGUID.Data3 = random();
        
        for (i = 0; i < 16; i += 4) {
            *((uint32_t*)(&(keychainFrameworkInitVector[i]))) = random();
        }

        if ((err = CSSM_Init(&version, CSSM_PRIVILEGE_SCOPE_PROCESS, &myGUID, CSSM_KEY_HIERARCHY_NONE, &policy, NULL)) == CSSM_OK) {
            cssmReady = true;
        } else {
            PDEBUG(@"Unable to initialize CSSM because of error #%u - %@.\n", err, CSSMErrorAsString(err));
        }
    }
    
    return cssmReady;
}

void cssmEnd(void) {
    if (cssmReady) {
        cssmReady = false;

        cspEnd();

        CSSM_Terminate();
    }
}

bool clInit(void) {
    CSSM_RETURN err;
    
    if (!clReady && cssmInit()) {
        if ((err = CSSM_ModuleLoad(&clGUID, CSSM_KEY_HIERARCHY_NONE, NULL, NULL)) == CSSM_OK) {
            if ((err = CSSM_ModuleAttach(&clGUID, &version, &appAllocators, 0, CSSM_SERVICE_CL, 0, CSSM_KEY_HIERARCHY_NONE, NULL, 0, NULL, &clHandle)) == CSSM_OK) {
                clReady = true;
            } else {
                PCONSOLE(@"Unable to attach CL module (%@) because of error #%u - %@.\n", GUIDAsString(clGUID), err, CSSMErrorAsString(err));
                PDEBUG(@"CSSM_ModuleAttach(%p [%@], %p, %p, NULL, CSSM_SERVICE_CL, NULL, CSSM_KEY_HIERARCHY_NONE, NULL, NULL, NULL, %p [%d]) returned error #%u (%@).\n", &clGUID, GUIDAsString(clGUID), &version, &appAllocators, &clHandle, clHandle, err, CSSMErrorAsString(err));
            }
        } else {
            PCONSOLE(@"Unable to load CL module (%@) because of error #%u - %@.\n", GUIDAsString(clGUID), err, CSSMErrorAsString(err));
            PDEBUG(@"CSSM_ModuleLoad(%p [%@], CSSM_KEY_HIERARCHY_NONE, NULL, NULL) returned error #%u (%@).\n", &clGUID, GUIDAsString(clGUID), err, CSSMErrorAsString(err));
        }
    }

    return clReady;
}

void clEnd(void) {
    CSSM_RETURN err;
    
    if (clReady) {
        clReady = false;

        if ((err = CSSM_ModuleDetach(clHandle)) == CSSM_OK) {
            if ((err = CSSM_ModuleUnload(&clGUID, NULL, NULL)) == CSSM_OK) {
                // all good
            } else {
                PCONSOLE(@"Unable to unload CL module (%@) because of error #%u - %@.\n", GUIDAsString(clGUID), err, CSSMErrorAsString(err));
                PDEBUG(@"CSSM_ModuleUnload(%p [%@], NULL, NULL) returned error #%u (%@).\n", &clGUID, GUIDAsString(clGUID), err, CSSMErrorAsString(err));
            }
        } else {
            PCONSOLE(@"Unable to detach CL module (%@) because of error #%u - %@.\n", GUIDAsString(clGUID), err, CSSMErrorAsString(err));
            PDEBUG(@"CSSM_ModuleDetach(%d) returned error #%u (%@), using CL %@.\n", clHandle, err, CSSMErrorAsString(err), GUIDAsString(clGUID));
        }
    }
}

bool tpInit(void) {
    CSSM_RETURN err;
    
    if (!tpReady && cssmInit()) {
        if ((err = CSSM_ModuleLoad(&tpGUID, CSSM_KEY_HIERARCHY_NONE, NULL, NULL)) == CSSM_OK) {
            if ((err = CSSM_ModuleAttach(&tpGUID, &version, &appAllocators, 0, CSSM_SERVICE_TP, 0, CSSM_KEY_HIERARCHY_NONE, NULL, 0, NULL, &tpHandle)) == CSSM_OK) {
                tpReady = true;
            } else {
                PCONSOLE(@"Unable to attach TP module (%@) because of error #%u - %@.\n", GUIDAsString(tpGUID), err, CSSMErrorAsString(err));
                PDEBUG(@"CSSM_ModuleAttach(%p [%@], %p, %p, NULL, CSSM_SERVICE_TP, NULL, CSSM_KEY_HIERARCHY_NONE, NULL, NULL, NULL, %p [%d]) returned error #%u (%@).\n", &tpGUID, GUIDAsString(tpGUID), &version, &appAllocators, &tpHandle, tpHandle, err, CSSMErrorAsString(err));
            }
        } else {
            PCONSOLE(@"Unable to load TP module (%@) because of error #%u - %@.\n", GUIDAsString(tpGUID), err, CSSMErrorAsString(err));
            PDEBUG(@"CSSM_ModuleLoad(%p [%@], CSSM_KEY_HIERARCHY_NONE, NULL, NULL) returned error #%u (%@).\n", &tpGUID, GUIDAsString(tpGUID), err, CSSMErrorAsString(err));
        }
    }

    return tpReady;
}

void tpEnd(void) {
    CSSM_RETURN err;
    
    if (tpReady) {
        tpReady = false;

        if ((err = CSSM_ModuleDetach(tpHandle)) == CSSM_OK) {
            if ((err = CSSM_ModuleUnload(&tpGUID, NULL, NULL)) == CSSM_OK) {
                // all good
            } else {
                PCONSOLE(@"Unable to unload TP module (%@) because of error #%u - %@.\n", GUIDAsString(tpGUID), err, CSSMErrorAsString(err));
                PDEBUG(@"CSSM_ModuleUnload(%p [%@], NULL, NULL) returned error #%u (%@).\n", &tpGUID, GUIDAsString(tpGUID), err, CSSMErrorAsString(err));
            }
        } else {
            PCONSOLE(@"Unable to detach TP module (%@) because of error #%u - %@.\n", GUIDAsString(tpGUID), err, CSSMErrorAsString(err));
            PDEBUG(@"CSSM_ModuleDetach(%d) returned error #%u (%@), for TP %@.\n", tpHandle, err, CSSMErrorAsString(err), GUIDAsString(tpGUID));
        }
    }
}

bool cspInit(void) {
    CSSM_RETURN err;
    
    if (!cspReady && cssmInit()) {
        if ((err = CSSM_ModuleLoad(&cspGUID, CSSM_KEY_HIERARCHY_NONE, NULL, NULL)) == CSSM_OK) {
            if ((err = CSSM_ModuleAttach(&cspGUID, &version, &appAllocators, 0, CSSM_SERVICE_CSP, 0, CSSM_KEY_HIERARCHY_NONE, NULL, 0, NULL, &cspHandle)) == CSSM_OK) {
                cspReady = true;
            } else {
                PCONSOLE(@"Unable to attach CSP module (%@) because of error #%u - %@.\n", GUIDAsString(cspGUID), err, CSSMErrorAsString(err));
                PDEBUG(@"CSSM_ModuleAttach(%p [%@], %p, %p, NULL, CSSM_SERVICE_CSP, NULL, CSSM_KEY_HIERARCHY_NONE, NULL, NULL, NULL, %p [%d]) returned error #%u (%@).\n", &cspGUID, GUIDAsString(cspGUID), &version, &appAllocators, &cspHandle, cspHandle, err, CSSMErrorAsString(err));
            }
        } else {
            PCONSOLE(@"Unable to load CSP module (%@) because of error #%u - %@.\n", GUIDAsString(cspGUID), err, CSSMErrorAsString(err));
            PDEBUG(@"CSSM_ModuleLoad(%p [%@], CSSM_KEY_HIERARCHY_NONE, NULL, NULL) returned error #%u (%@).\n", &cspGUID, GUIDAsString(cspGUID), err, CSSMErrorAsString(err));
        }
    }
    
    return cspReady;
}

void cspEnd(void) {
    CSSM_RETURN err;
    
    if (cspReady) {
        cspReady = false;

        if ((err = CSSM_ModuleDetach(cspHandle)) == CSSM_OK) {
            if ((err = CSSM_ModuleUnload(&cspGUID, NULL, NULL)) == CSSM_OK) {
                // all good
            } else {
                PCONSOLE(@"Unable to unload CSP module (%@) because of error #%u - %@.\n", GUIDAsString(cspGUID), err, CSSMErrorAsString(err));
                PDEBUG(@"CSSM_ModuleUnload(%p [%@], NULL, NULL) returned error #%u (%@).\n", &cspGUID, GUIDAsString(cspGUID), err, CSSMErrorAsString(err));
            }
        } else {
            PCONSOLE(@"Unable to detach CSP module (%@) because of error #%u - %@.\n", GUIDAsString(cspGUID), err, CSSMErrorAsString(err));
            PDEBUG(@"CSSM_ModuleDetach(%d) returned error #%u (%@), for CSP %@.\n", cspHandle, err, CSSMErrorAsString(err), GUIDAsString(cspGUID));
        }
    }
}