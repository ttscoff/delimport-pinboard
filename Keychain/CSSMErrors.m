//
//  CSSMErrors.m
//  Keychain
//
//  Created by Wade Tregaskis on Thu May 29 2003.
//
//  Copyright (c) 2003, Wade Tregaskis.  All rights reserved.
//  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
//    * Neither the name of Wade Tregaskis nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import "CSSMErrors.h"

#import <Security/Security.h>


extern NSString* KEYCHAIN_BUNDLE_IDENTIFIER;


NSString* CSSMErrorAsString(CSSM_RETURN error) {
    switch (error) {
        case CSSM_BASE_ERROR: // == CSSM_CSSM_BASE_ERROR
            return NSLocalizedStringFromTableInBundle(@"CSSM_BASE_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_CSSM_PRIVATE_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSM_CSSM_PRIVATE_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_CSP_BASE_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSM_CSP_BASE_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_CSP_PRIVATE_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSM_CSP_PRIVATE_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_DL_BASE_ERROR: // == CSSM_MDS_BASE_ERROR
            return NSLocalizedStringFromTableInBundle(@"CSSM_DL_BASE_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_DL_PRIVATE_ERROR: // == CSSM_MDS_PRIVATE_ERROR
            return NSLocalizedStringFromTableInBundle(@"CSSM_DL_PRIVATE_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_CL_BASE_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSM_CL_BASE_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_CL_PRIVATE_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSM_CL_PRIVATE_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_TP_BASE_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSM_TP_BASE_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_TP_PRIVATE_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSM_TP_PRIVATE_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_KR_BASE_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSM_KR_BASE_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_KR_PRIVATE_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSM_KR_PRIVATE_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_AC_BASE_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSM_AC_BASE_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_AC_PRIVATE_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSM_AC_PRIVATE_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_INVALID_ADDIN_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_INVALID_ADDIN_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_NOT_INITIALIZED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_NOT_INITIALIZED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_INVALID_HANDLE_USAGE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_INVALID_HANDLE_USAGE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_PVC_REFERENT_NOT_FOUND:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_PVC_REFERENT_NOT_FOUND", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_FUNCTION_INTEGRITY_FAIL:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_FUNCTION_INTEGRITY_FAIL", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INTERNAL_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INTERNAL_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_MEMORY_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_MEMORY_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_MDS_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_MDS_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_INPUT_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_INPUT_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_OUTPUT_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_OUTPUT_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_FUNCTION_NOT_IMPLEMENTED:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_FUNCTION_NOT_IMPLEMENTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_SELF_CHECK_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_SELF_CHECK_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_OS_ACCESS_DENIED:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_OS_ACCESS_DENIED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_FUNCTION_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_FUNCTION_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_MODULE_MANIFEST_VERIFY_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_MODULE_MANIFEST_VERIFY_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_GUID:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_GUID", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_OPERATION_AUTH_DENIED:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_OPERATION_AUTH_DENIED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_OBJECT_USE_AUTH_DENIED:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_OBJECT_USE_AUTH_DENIED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_OBJECT_MANIP_AUTH_DENIED:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_OBJECT_MANIP_AUTH_DENIED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_OBJECT_ACL_NOT_SUPPORTED:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_OBJECT_ACL_NOT_SUPPORTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_OBJECT_ACL_REQUIRED:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_OBJECT_ACL_REQUIRED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_ACCESS_CREDENTIALS:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_ACCESS_CREDENTIALS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_ACL_BASE_CERTS:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_ACL_BASE_CERTS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_ACL_BASE_CERTS_NOT_SUPPORTED:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_ACL_BASE_CERTS_NOT_SUPPORTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_SAMPLE_VALUE:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_SAMPLE_VALUE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_SAMPLE_VALUE_NOT_SUPPORTED:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_SAMPLE_VALUE_NOT_SUPPORTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_ACL_SUBJECT_VALUE:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_ACL_SUBJECT_VALUE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_ACL_SUBJECT_TYPE_NOT_SUPPORTED:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_ACL_SUBJECT_TYPE_NOT_SUPPORTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_ACL_CHALLENGE_CALLBACK:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_ACL_CHALLENGE_CALLBACK", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_ACL_CHALLENGE_CALLBACK_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_ACL_CHALLENGE_CALLBACK_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_ACL_ENTRY_TAG:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_ACL_ENTRY_TAG", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_ACL_ENTRY_TAG_NOT_FOUND:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_ACL_ENTRY_TAG_NOT_FOUND", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_ACL_EDIT_MODE:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_ACL_EDIT_MODE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_ACL_CHANGE_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_ACL_CHANGE_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_NEW_ACL_ENTRY:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_NEW_ACL_ENTRY", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_NEW_ACL_OWNER:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_NEW_ACL_OWNER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_ACL_DELETE_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_ACL_DELETE_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_ACL_REPLACE_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_ACL_REPLACE_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_ACL_ADD_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_ACL_ADD_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_CONTEXT_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_CONTEXT_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INCOMPATIBLE_VERSION:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INCOMPATIBLE_VERSION", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_CERTGROUP_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_CERTGROUP_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_CERT_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_CERT_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_CRL_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_CRL_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_FIELD_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_FIELD_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_DATA:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_DATA", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_CRL_ALREADY_SIGNED:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_CRL_ALREADY_SIGNED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_NUMBER_OF_FIELDS:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_NUMBER_OF_FIELDS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_VERIFICATION_FAILURE:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_VERIFICATION_FAILURE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_DB_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_DB_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_PRIVILEGE_NOT_GRANTED:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_PRIVILEGE_NOT_GRANTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_DB_LIST:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_DB_LIST", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_DB_LIST_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_DB_LIST_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_UNKNOWN_FORMAT:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_UNKNOWN_FORMAT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_UNKNOWN_TAG:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_UNKNOWN_TAG", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_CSP_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_CSP_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_DL_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_DL_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_CL_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_CL_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_TP_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_TP_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_KR_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_KR_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_AC_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_AC_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_PASSTHROUGH_ID:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_PASSTHROUGH_ID", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_NETWORK_ADDR:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_NETWORK_ADDR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_ERRCODE_INVALID_CRYPTO_DATA:
            return NSLocalizedStringFromTableInBundle(@"CSSM_ERRCODE_INVALID_CRYPTO_DATA", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_INTERNAL_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_INTERNAL_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_MEMORY_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_MEMORY_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_MDS_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_MDS_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_INVALID_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_INVALID_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_INVALID_INPUT_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_INVALID_INPUT_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_INVALID_OUTPUT_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_INVALID_OUTPUT_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_FUNCTION_NOT_IMPLEMENTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_FUNCTION_NOT_IMPLEMENTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_SELF_CHECK_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_SELF_CHECK_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_OS_ACCESS_DENIED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_OS_ACCESS_DENIED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_FUNCTION_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_FUNCTION_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_MODULE_MANIFEST_VERIFY_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_MODULE_MANIFEST_VERIFY_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_INVALID_GUID:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_INVALID_GUID", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_INVALID_CONTEXT_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_INVALID_CONTEXT_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_INCOMPATIBLE_VERSION:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_INCOMPATIBLE_VERSION", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_PRIVILEGE_NOT_GRANTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_PRIVILEGE_NOT_GRANTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_CSSM_BASE_CSSM_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSM_CSSM_BASE_CSSM_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_SCOPE_NOT_SUPPORTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_SCOPE_NOT_SUPPORTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_PVC_ALREADY_CONFIGURED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_PVC_ALREADY_CONFIGURED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_INVALID_PVC:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_INVALID_PVC", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_EMM_LOAD_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_EMM_LOAD_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_EMM_UNLOAD_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_EMM_UNLOAD_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_ADDIN_LOAD_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_ADDIN_LOAD_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_INVALID_KEY_HIERARCHY:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_INVALID_KEY_HIERARCHY", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_ADDIN_UNLOAD_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_ADDIN_UNLOAD_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_LIB_REF_NOT_FOUND:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_LIB_REF_NOT_FOUND", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_INVALID_ADDIN_FUNCTION_TABLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_INVALID_ADDIN_FUNCTION_TABLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_EMM_AUTHENTICATE_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_EMM_AUTHENTICATE_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_ADDIN_AUTHENTICATE_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_ADDIN_AUTHENTICATE_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_INVALID_SERVICE_MASK:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_INVALID_SERVICE_MASK", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_MODULE_NOT_LOADED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_MODULE_NOT_LOADED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_INVALID_SUBSERVICEID:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_INVALID_SUBSERVICEID", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_BUFFER_TOO_SMALL:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_BUFFER_TOO_SMALL", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_INVALID_ATTRIBUTE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_INVALID_ATTRIBUTE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_ATTRIBUTE_NOT_IN_CONTEXT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_ATTRIBUTE_NOT_IN_CONTEXT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_MODULE_MANAGER_INITIALIZE_FAIL:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_MODULE_MANAGER_INITIALIZE_FAIL", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_MODULE_MANAGER_NOT_FOUND:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_MODULE_MANAGER_NOT_FOUND", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSSM_EVENT_NOTIFICATION_CALLBACK_NOT_FOUND:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSSM_EVENT_NOTIFICATION_CALLBACK_NOT_FOUND", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INTERNAL_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INTERNAL_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_MEMORY_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_MEMORY_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_MDS_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_MDS_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_INPUT_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_INPUT_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_OUTPUT_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_OUTPUT_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_FUNCTION_NOT_IMPLEMENTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_FUNCTION_NOT_IMPLEMENTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_SELF_CHECK_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_SELF_CHECK_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_OS_ACCESS_DENIED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_OS_ACCESS_DENIED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_FUNCTION_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_FUNCTION_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_CONTEXT_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_CONTEXT_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_DATA:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_DATA", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_DB_LIST:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_DB_LIST", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_CERTGROUP_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_CERTGROUP_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_CERT_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_CERT_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_CRL_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_CRL_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_FIELD_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_FIELD_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_NETWORK_ADDR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_NETWORK_ADDR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_CRL_ALREADY_SIGNED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_CRL_ALREADY_SIGNED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_NUMBER_OF_FIELDS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_NUMBER_OF_FIELDS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_VERIFICATION_FAILURE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_VERIFICATION_FAILURE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_DB_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_DB_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_UNKNOWN_FORMAT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_UNKNOWN_FORMAT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_UNKNOWN_TAG:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_UNKNOWN_TAG", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_PASSTHROUGH_ID:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_PASSTHROUGH_ID", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_CSP_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_CSP_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_DL_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_DL_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_CL_HANDLE: // == CSSMERR_DL_INVALID_CL_HANDLE
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_CL_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_DB_LIST_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_DB_LIST_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_TP_BASE_TP_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSM_TP_BASE_TP_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_CALLERAUTH_CONTEXT_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_CALLERAUTH_CONTEXT_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_IDENTIFIER_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_IDENTIFIER_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_KEYCACHE_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_KEYCACHE_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_CERTGROUP:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_CERTGROUP", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_CRLGROUP:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_CRLGROUP", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_CRLGROUP_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_CRLGROUP_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_AUTHENTICATION_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_AUTHENTICATION_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_CERTGROUP_INCOMPLETE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_CERTGROUP_INCOMPLETE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_CERTIFICATE_CANT_OPERATE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_CERTIFICATE_CANT_OPERATE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_CERT_EXPIRED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_CERT_EXPIRED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_CERT_NOT_VALID_YET:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_CERT_NOT_VALID_YET", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_CERT_REVOKED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_CERT_REVOKED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_CERT_SUSPENDED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_CERT_SUSPENDED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INSUFFICIENT_CREDENTIALS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INSUFFICIENT_CREDENTIALS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_ACTION:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_ACTION", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_ACTION_DATA:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_ACTION_DATA", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_ANCHOR_CERT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_ANCHOR_CERT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_AUTHORITY:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_AUTHORITY", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_VERIFY_ACTION_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_VERIFY_ACTION_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_CERTIFICATE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_CERTIFICATE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_CERT_AUTHORITY:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_CERT_AUTHORITY", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_CRL_AUTHORITY:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_CRL_AUTHORITY", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_CRL_ENCODING:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_CRL_ENCODING", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_CRL_TYPE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_CRL_TYPE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_CRL:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_CRL", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_FORM_TYPE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_FORM_TYPE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_ID:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_ID", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_IDENTIFIER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_IDENTIFIER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_INDEX:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_INDEX", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_NAME:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_NAME", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_POLICY_IDENTIFIERS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_POLICY_IDENTIFIERS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_TIMESTRING:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_TIMESTRING", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_REASON:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_REASON", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_REQUEST_INPUTS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_REQUEST_INPUTS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_RESPONSE_VECTOR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_RESPONSE_VECTOR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_SIGNATURE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_SIGNATURE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_STOP_ON_POLICY:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_STOP_ON_POLICY", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_CALLBACK:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_CALLBACK", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_TUPLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_TUPLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_NOT_SIGNER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_NOT_SIGNER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_NOT_TRUSTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_NOT_TRUSTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_NO_DEFAULT_AUTHORITY:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_NO_DEFAULT_AUTHORITY", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_REJECTED_FORM:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_REJECTED_FORM", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_REQUEST_LOST:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_REQUEST_LOST", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_REQUEST_REJECTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_REQUEST_REJECTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_UNSUPPORTED_ADDR_TYPE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_UNSUPPORTED_ADDR_TYPE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_UNSUPPORTED_SERVICE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_UNSUPPORTED_SERVICE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_TUPLEGROUP_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_TUPLEGROUP_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_TP_INVALID_TUPLEGROUP:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_TP_INVALID_TUPLEGROUP", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_INTERNAL_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_INTERNAL_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_MEMORY_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_MEMORY_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_MDS_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_MDS_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_INVALID_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_INVALID_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_INVALID_INPUT_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_INVALID_INPUT_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_INVALID_OUTPUT_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_INVALID_OUTPUT_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_FUNCTION_NOT_IMPLEMENTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_FUNCTION_NOT_IMPLEMENTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_SELF_CHECK_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_SELF_CHECK_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_OS_ACCESS_DENIED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_OS_ACCESS_DENIED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_FUNCTION_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_FUNCTION_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_INVALID_CONTEXT_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_INVALID_CONTEXT_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_INVALID_DATA:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_INVALID_DATA", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_INVALID_DB_LIST:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_INVALID_DB_LIST", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_INVALID_PASSTHROUGH_ID:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_INVALID_PASSTHROUGH_ID", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_INVALID_DL_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_INVALID_DL_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_INVALID_CL_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_INVALID_CL_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_INVALID_TP_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_INVALID_TP_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_INVALID_DB_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_INVALID_DB_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_INVALID_DB_LIST_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_INVALID_DB_LIST_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_AC_BASE_AC_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSM_AC_BASE_AC_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_INVALID_BASE_ACLS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_INVALID_BASE_ACLS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_INVALID_TUPLE_CREDENTIALS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_INVALID_TUPLE_CREDENTIALS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_INVALID_ENCODING:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_INVALID_ENCODING", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_INVALID_VALIDITY_PERIOD:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_INVALID_VALIDITY_PERIOD", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_INVALID_REQUESTOR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_INVALID_REQUESTOR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_AC_INVALID_REQUEST_DESCRIPTOR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_AC_INVALID_REQUEST_DESCRIPTOR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_INTERNAL_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_INTERNAL_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_MEMORY_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_MEMORY_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_MDS_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_MDS_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_INVALID_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_INVALID_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_INVALID_INPUT_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_INVALID_INPUT_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_INVALID_OUTPUT_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_INVALID_OUTPUT_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_FUNCTION_NOT_IMPLEMENTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_FUNCTION_NOT_IMPLEMENTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_SELF_CHECK_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_SELF_CHECK_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_OS_ACCESS_DENIED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_OS_ACCESS_DENIED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_FUNCTION_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_FUNCTION_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_INVALID_CONTEXT_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_INVALID_CONTEXT_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_INVALID_CERTGROUP_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_INVALID_CERTGROUP_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_INVALID_CERT_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_INVALID_CERT_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_INVALID_CRL_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_INVALID_CRL_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_INVALID_FIELD_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_INVALID_FIELD_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_INVALID_DATA:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_INVALID_DATA", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_CRL_ALREADY_SIGNED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_CRL_ALREADY_SIGNED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_INVALID_NUMBER_OF_FIELDS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_INVALID_NUMBER_OF_FIELDS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_VERIFICATION_FAILURE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_VERIFICATION_FAILURE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_UNKNOWN_FORMAT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_UNKNOWN_FORMAT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_UNKNOWN_TAG:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_UNKNOWN_TAG", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_INVALID_PASSTHROUGH_ID:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_INVALID_PASSTHROUGH_ID", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_CL_BASE_CL_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSM_CL_BASE_CL_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_INVALID_BUNDLE_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_INVALID_BUNDLE_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_INVALID_CACHE_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_INVALID_CACHE_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_INVALID_RESULTS_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_INVALID_RESULTS_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_INVALID_BUNDLE_INFO:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_INVALID_BUNDLE_INFO", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_INVALID_CRL_INDEX:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_INVALID_CRL_INDEX", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_INVALID_SCOPE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_INVALID_SCOPE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_NO_FIELD_VALUES:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_NO_FIELD_VALUES", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CL_SCOPE_NOT_SUPPORTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CL_SCOPE_NOT_SUPPORTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INTERNAL_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INTERNAL_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_MEMORY_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_MEMORY_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_MDS_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_MDS_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_INPUT_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_INPUT_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_OUTPUT_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_OUTPUT_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_FUNCTION_NOT_IMPLEMENTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_FUNCTION_NOT_IMPLEMENTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_SELF_CHECK_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_SELF_CHECK_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_OS_ACCESS_DENIED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_OS_ACCESS_DENIED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_FUNCTION_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_FUNCTION_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_CSP_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_CSP_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_DL_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_DL_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_DB_LIST_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_DB_LIST_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_OPERATION_AUTH_DENIED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_OPERATION_AUTH_DENIED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_OBJECT_USE_AUTH_DENIED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_OBJECT_USE_AUTH_DENIED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_OBJECT_MANIP_AUTH_DENIED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_OBJECT_MANIP_AUTH_DENIED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_OBJECT_ACL_NOT_SUPPORTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_OBJECT_ACL_NOT_SUPPORTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_OBJECT_ACL_REQUIRED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_OBJECT_ACL_REQUIRED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_ACCESS_CREDENTIALS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_ACCESS_CREDENTIALS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_ACL_BASE_CERTS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_ACL_BASE_CERTS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_ACL_BASE_CERTS_NOT_SUPPORTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_ACL_BASE_CERTS_NOT_SUPPORTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_SAMPLE_VALUE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_SAMPLE_VALUE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_SAMPLE_VALUE_NOT_SUPPORTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_SAMPLE_VALUE_NOT_SUPPORTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_ACL_SUBJECT_VALUE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_ACL_SUBJECT_VALUE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_ACL_SUBJECT_TYPE_NOT_SUPPORTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_ACL_SUBJECT_TYPE_NOT_SUPPORTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_ACL_CHALLENGE_CALLBACK:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_ACL_CHALLENGE_CALLBACK", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_ACL_CHALLENGE_CALLBACK_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_ACL_CHALLENGE_CALLBACK_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_ACL_ENTRY_TAG:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_ACL_ENTRY_TAG", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_ACL_ENTRY_TAG_NOT_FOUND:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_ACL_ENTRY_TAG_NOT_FOUND", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_ACL_EDIT_MODE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_ACL_EDIT_MODE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_ACL_CHANGE_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_ACL_CHANGE_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_NEW_ACL_ENTRY:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_NEW_ACL_ENTRY", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_NEW_ACL_OWNER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_NEW_ACL_OWNER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_ACL_DELETE_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_ACL_DELETE_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_ACL_REPLACE_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_ACL_REPLACE_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_ACL_ADD_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_ACL_ADD_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_DB_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_DB_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_PASSTHROUGH_ID:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_PASSTHROUGH_ID", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_NETWORK_ADDR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_NETWORK_ADDR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_DL_BASE_DL_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSM_DL_BASE_DL_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_DATABASE_CORRUPT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_DATABASE_CORRUPT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_RECORD_INDEX:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_RECORD_INDEX", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_RECORDTYPE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_RECORDTYPE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_FIELD_NAME:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_FIELD_NAME", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_UNSUPPORTED_FIELD_FORMAT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_UNSUPPORTED_FIELD_FORMAT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_UNSUPPORTED_INDEX_INFO:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_UNSUPPORTED_INDEX_INFO", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_UNSUPPORTED_LOCALITY:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_UNSUPPORTED_LOCALITY", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_UNSUPPORTED_NUM_ATTRIBUTES:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_UNSUPPORTED_NUM_ATTRIBUTES", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_UNSUPPORTED_NUM_INDEXES:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_UNSUPPORTED_NUM_INDEXES", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_UNSUPPORTED_NUM_RECORDTYPES:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_UNSUPPORTED_NUM_RECORDTYPES", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_UNSUPPORTED_RECORDTYPE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_UNSUPPORTED_RECORDTYPE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_FIELD_SPECIFIED_MULTIPLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_FIELD_SPECIFIED_MULTIPLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INCOMPATIBLE_FIELD_FORMAT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INCOMPATIBLE_FIELD_FORMAT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_PARSING_MODULE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_PARSING_MODULE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_DB_NAME:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_DB_NAME", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_DATASTORE_DOESNOT_EXIST:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_DATASTORE_DOESNOT_EXIST", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_DATASTORE_ALREADY_EXISTS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_DATASTORE_ALREADY_EXISTS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_DB_LOCKED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_DB_LOCKED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_DATASTORE_IS_OPEN:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_DATASTORE_IS_OPEN", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_RECORD_NOT_FOUND:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_RECORD_NOT_FOUND", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_MISSING_VALUE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_MISSING_VALUE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_UNSUPPORTED_QUERY:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_UNSUPPORTED_QUERY", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_UNSUPPORTED_QUERY_LIMITS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_UNSUPPORTED_QUERY_LIMITS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_UNSUPPORTED_NUM_SELECTION_PREDS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_UNSUPPORTED_NUM_SELECTION_PREDS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_UNSUPPORTED_OPERATOR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_UNSUPPORTED_OPERATOR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_RESULTS_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_RESULTS_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_DB_LOCATION:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_DB_LOCATION", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_ACCESS_REQUEST:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_ACCESS_REQUEST", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_INDEX_INFO:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_INDEX_INFO", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_SELECTION_TAG:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_SELECTION_TAG", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_NEW_OWNER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_NEW_OWNER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_RECORD_UID:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_RECORD_UID", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_UNIQUE_INDEX_DATA:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_UNIQUE_INDEX_DATA", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_MODIFY_MODE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_MODIFY_MODE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_OPEN_PARAMETERS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_OPEN_PARAMETERS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_RECORD_MODIFIED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_RECORD_MODIFIED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_ENDOFDATA:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_ENDOFDATA", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_QUERY:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_QUERY", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_INVALID_VALUE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_INVALID_VALUE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_MULTIPLE_VALUES_UNSUPPORTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_MULTIPLE_VALUES_UNSUPPORTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_DL_STALE_UNIQUE_RECORD:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_DL_STALE_UNIQUE_RECORD", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INTERNAL_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INTERNAL_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MEMORY_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MEMORY_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MDS_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MDS_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_INPUT_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_INPUT_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_OUTPUT_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_OUTPUT_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_FUNCTION_NOT_IMPLEMENTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_FUNCTION_NOT_IMPLEMENTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_SELF_CHECK_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_SELF_CHECK_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_OS_ACCESS_DENIED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_OS_ACCESS_DENIED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_FUNCTION_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_FUNCTION_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_OPERATION_AUTH_DENIED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_OPERATION_AUTH_DENIED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_OBJECT_USE_AUTH_DENIED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_OBJECT_USE_AUTH_DENIED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_OBJECT_MANIP_AUTH_DENIED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_OBJECT_MANIP_AUTH_DENIED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_OBJECT_ACL_NOT_SUPPORTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_OBJECT_ACL_NOT_SUPPORTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_OBJECT_ACL_REQUIRED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_OBJECT_ACL_REQUIRED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ACCESS_CREDENTIALS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ACCESS_CREDENTIALS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ACL_BASE_CERTS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ACL_BASE_CERTS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_ACL_BASE_CERTS_NOT_SUPPORTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_ACL_BASE_CERTS_NOT_SUPPORTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_SAMPLE_VALUE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_SAMPLE_VALUE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_SAMPLE_VALUE_NOT_SUPPORTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_SAMPLE_VALUE_NOT_SUPPORTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ACL_SUBJECT_VALUE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ACL_SUBJECT_VALUE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_ACL_SUBJECT_TYPE_NOT_SUPPORTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_ACL_SUBJECT_TYPE_NOT_SUPPORTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ACL_CHALLENGE_CALLBACK:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ACL_CHALLENGE_CALLBACK", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_ACL_CHALLENGE_CALLBACK_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_ACL_CHALLENGE_CALLBACK_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ACL_ENTRY_TAG:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ACL_ENTRY_TAG", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_ACL_ENTRY_TAG_NOT_FOUND:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_ACL_ENTRY_TAG_NOT_FOUND", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ACL_EDIT_MODE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ACL_EDIT_MODE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_ACL_CHANGE_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_ACL_CHANGE_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_NEW_ACL_ENTRY:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_NEW_ACL_ENTRY", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_NEW_ACL_OWNER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_NEW_ACL_OWNER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_ACL_DELETE_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_ACL_DELETE_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_ACL_REPLACE_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_ACL_REPLACE_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_ACL_ADD_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_ACL_ADD_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_CONTEXT_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_CONTEXT_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_PRIVILEGE_NOT_GRANTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_PRIVILEGE_NOT_GRANTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_DATA:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_DATA", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_PASSTHROUGH_ID:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_PASSTHROUGH_ID", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_CRYPTO_DATA:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_CRYPTO_DATA", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSM_CSP_BASE_CSP_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSM_CSP_BASE_CSP_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INPUT_LENGTH_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INPUT_LENGTH_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_OUTPUT_LENGTH_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_OUTPUT_LENGTH_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_PRIVILEGE_NOT_SUPPORTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_PRIVILEGE_NOT_SUPPORTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_DEVICE_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_DEVICE_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_DEVICE_MEMORY_ERROR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_DEVICE_MEMORY_ERROR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_ATTACH_HANDLE_BUSY:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_ATTACH_HANDLE_BUSY", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_NOT_LOGGED_IN:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_NOT_LOGGED_IN", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_KEY:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_KEY", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_KEY_REFERENCE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_KEY_REFERENCE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_KEY_CLASS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_KEY_CLASS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_ALGID_MISMATCH:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_ALGID_MISMATCH", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_KEY_USAGE_INCORRECT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_KEY_USAGE_INCORRECT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_KEY_BLOB_TYPE_INCORRECT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_KEY_BLOB_TYPE_INCORRECT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_KEY_HEADER_INCONSISTENT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_KEY_HEADER_INCONSISTENT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_UNSUPPORTED_KEY_FORMAT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_UNSUPPORTED_KEY_FORMAT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_UNSUPPORTED_KEY_SIZE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_UNSUPPORTED_KEY_SIZE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_KEY_POINTER:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_KEY_POINTER", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_KEYUSAGE_MASK:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_KEYUSAGE_MASK", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_UNSUPPORTED_KEYUSAGE_MASK:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_UNSUPPORTED_KEYUSAGE_MASK", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_KEYATTR_MASK:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_KEYATTR_MASK", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_UNSUPPORTED_KEYATTR_MASK:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_UNSUPPORTED_KEYATTR_MASK", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_KEY_LABEL:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_KEY_LABEL", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_UNSUPPORTED_KEY_LABEL:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_UNSUPPORTED_KEY_LABEL", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_KEY_FORMAT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_KEY_FORMAT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_DATA_COUNT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_DATA_COUNT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_VECTOR_OF_BUFS_UNSUPPORTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_VECTOR_OF_BUFS_UNSUPPORTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_INPUT_VECTOR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_INPUT_VECTOR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_OUTPUT_VECTOR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_OUTPUT_VECTOR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_CONTEXT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_CONTEXT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ALGORITHM:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ALGORITHM", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_KEY:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_KEY", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_KEY:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_KEY", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_INIT_VECTOR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_INIT_VECTOR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_INIT_VECTOR:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_INIT_VECTOR", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_SALT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_SALT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_SALT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_SALT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_PADDING:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_PADDING", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_PADDING:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_PADDING", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_RANDOM:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_RANDOM", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_RANDOM:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_RANDOM", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_SEED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_SEED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_SEED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_SEED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_PASSPHRASE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_PASSPHRASE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_PASSPHRASE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_PASSPHRASE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_KEY_LENGTH:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_KEY_LENGTH", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_KEY_LENGTH:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_KEY_LENGTH", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_BLOCK_SIZE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_BLOCK_SIZE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_BLOCK_SIZE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_BLOCK_SIZE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_OUTPUT_SIZE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_OUTPUT_SIZE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_OUTPUT_SIZE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_OUTPUT_SIZE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_ROUNDS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_ROUNDS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_ROUNDS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_ROUNDS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_ALG_PARAMS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_ALG_PARAMS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_ALG_PARAMS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_ALG_PARAMS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_LABEL:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_LABEL", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_LABEL:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_LABEL", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_KEY_TYPE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_KEY_TYPE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_KEY_TYPE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_KEY_TYPE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_MODE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_MODE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_MODE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_MODE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_EFFECTIVE_BITS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_EFFECTIVE_BITS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_EFFECTIVE_BITS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_EFFECTIVE_BITS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_START_DATE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_START_DATE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_START_DATE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_START_DATE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_END_DATE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_END_DATE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_END_DATE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_END_DATE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_VERSION:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_VERSION", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_VERSION:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_VERSION", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_PRIME:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_PRIME", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_PRIME:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_PRIME", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_BASE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_BASE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_BASE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_BASE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_SUBPRIME:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_SUBPRIME", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_SUBPRIME:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_SUBPRIME", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_ITERATION_COUNT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_ITERATION_COUNT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_ITERATION_COUNT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_ITERATION_COUNT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_DL_DB_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_DL_DB_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_DL_DB_HANDLE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_DL_DB_HANDLE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_ACCESS_CREDENTIALS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_ACCESS_CREDENTIALS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_ACCESS_CREDENTIALS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_ACCESS_CREDENTIALS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_PUBLIC_KEY_FORMAT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_PUBLIC_KEY_FORMAT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_PUBLIC_KEY_FORMAT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_PUBLIC_KEY_FORMAT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_PRIVATE_KEY_FORMAT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_PRIVATE_KEY_FORMAT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_PRIVATE_KEY_FORMAT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_PRIVATE_KEY_FORMAT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_SYMMETRIC_KEY_FORMAT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_SYMMETRIC_KEY_FORMAT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_SYMMETRIC_KEY_FORMAT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_SYMMETRIC_KEY_FORMAT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_ATTR_WRAPPED_KEY_FORMAT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_ATTR_WRAPPED_KEY_FORMAT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_MISSING_ATTR_WRAPPED_KEY_FORMAT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_MISSING_ATTR_WRAPPED_KEY_FORMAT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_STAGED_OPERATION_IN_PROGRESS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_STAGED_OPERATION_IN_PROGRESS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_STAGED_OPERATION_NOT_STARTED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_STAGED_OPERATION_NOT_STARTED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_VERIFY_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_VERIFY_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_SIGNATURE:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_SIGNATURE", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_QUERY_SIZE_UNKNOWN:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_QUERY_SIZE_UNKNOWN", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_BLOCK_SIZE_MISMATCH:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_BLOCK_SIZE_MISMATCH", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_PRIVATE_KEY_NOT_FOUND:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_PRIVATE_KEY_NOT_FOUND", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_PUBLIC_KEY_INCONSISTENT:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_PUBLIC_KEY_INCONSISTENT", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_DEVICE_VERIFY_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_DEVICE_VERIFY_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_LOGIN_NAME:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_LOGIN_NAME", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_ALREADY_LOGGED_IN:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_ALREADY_LOGGED_IN", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_PRIVATE_KEY_ALREADY_EXISTS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_PRIVATE_KEY_ALREADY_EXISTS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_KEY_LABEL_ALREADY_EXISTS:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_KEY_LABEL_ALREADY_EXISTS", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_INVALID_DIGEST_ALGORITHM:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_INVALID_DIGEST_ALGORITHM", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        case CSSMERR_CSP_CRYPTO_DATA_CALLBACK_FAILED:
            return NSLocalizedStringFromTableInBundle(@"CSSMERR_CSP_CRYPTO_DATA_CALLBACK_FAILED", @"CSSM Errors", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
        default:
            return NSLocalizedStringFromTableInBundle(@"Unknown", @"Misc Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    }
}
