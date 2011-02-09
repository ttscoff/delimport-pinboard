//
//  CSSMUtils.m
//  Keychain
//
//  Created by Wade Tregaskis on Thu Mar 13 2003.
//
//  Copyright (c) 2003, Wade Tregaskis.  All rights reserved.
//  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
//    * Neither the name of Wade Tregaskis nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import "CSSMUtils.h"

#import "UtilitySupport.h"
#import "CSSMErrors.h"
#import "Logging.h"


NSString* KEYCHAIN_BUNDLE_IDENTIFIER = @"Keychain.framework";

#define UNKNOWN (NSLocalizedStringFromTableInBundle(@"Unknown", @"Misc Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil))


NSString* GUIDAsString(CSSM_GUID GUID) {
    return [NSString stringWithFormat:@"%08x-%04hx%04hx-%08x", GUID.Data1, GUID.Data2, GUID.Data3, *((uint32_t*)GUID.Data4)];
}

NSString* localizedStringWithFallback(NSString *key, NSString *table) {
    /* I assume NSLocalizedStringFromTableInBundle can handle a nil key or table name, so that we don't have to explicitly; a nil result is of course perfectly fine for us. */
    NSString *result = NSLocalizedStringFromTableInBundle(key, table, [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    
    if (!result) {
        /* If we can't obtain a match, we lookup a localized "unknown" string.  This is actually a format string, into which we will provide the parameters of this function for use as desired.  In addition, we'll PDEBUG here so that these problems can be more directly noticed & diagnosed by the developer. */
        
        PDEBUG(@"Could not find key \"%@\" in/or table \"%@\".\n", key, table);
        
        result = UNKNOWN;
        
        if (!result) { /* At this point things are getting silly. */
            result = @"Unknown (%@)";
        }
        
        result = [NSString stringWithFormat:result, key, table];
    }
    
    return result;
}

NSString* nameOfCertificateType(CSSM_CERT_TYPE certificateType) {
    return localizedStringWithFallback([NSString stringWithFormat:@"%u", certificateType], @"Certificate Types");
}

NSString* nameOfCertificateEncoding(CSSM_CERT_ENCODING certificateEncoding) {
    return localizedStringWithFallback([NSString stringWithFormat:@"%u", certificateEncoding], @"Certificate Encodings");
}

NSString* nameOfBERCode(CSSM_BER_TAG tag) {
    return localizedStringWithFallback([NSString stringWithFormat:@"%hhu", tag], @"BER Names");
}

NSString* stringRepresentationOfBEREncodedData(const CSSM_DATA *dat, CSSM_BER_TAG tag) {
    if (NULL == dat) {
        return nil;
    } else {
    	switch (tag) {
        	case BER_TAG_BOOLEAN:
            	if (*((BOOL*)dat->Data)) {
                	return NSLocalizedStringFromTableInBundle(@"YES", @"Misc Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
            	} else {
                	return NSLocalizedStringFromTableInBundle(@"NO", @"Misc Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
            	}

            	break;
        	case BER_TAG_INTEGER:
            	return [NSString stringWithFormat:@"%d", *((int*)dat->Data)];
        	case BER_TAG_PRINTABLE_STRING:
        	case BER_TAG_PKIX_UNIVERSAL_STRING:
        	case BER_TAG_GENERAL_STRING:
        	case BER_TAG_ISO646_STRING:
        	case BER_TAG_PKIX_UTF8_STRING:
            	return [NSString stringWithCString:(char*)(dat->Data) length:dat->Length]; break;
        	case BER_TAG_NULL:
        	    return @"<NULL>"; break;
        	case BER_TAG_REAL:
            	if (dat->Length == sizeof(float)) {
                	return [NSString stringWithFormat:@"%f", *((float*)dat->Data)];
            	} else {
                	return [NSString stringWithFormat:@"%lf", *((double*)dat->Data)];
            	}

            	break;
        	case BER_TAG_UTC_TIME:
        	case BER_TAG_GENERALIZED_TIME:
            	return [calendarDateForTime((CSSM_X509_TIME_PTR)dat) description]; break;
        	default:
            	return [NSDataFromData(dat) description]; break;
    	}
    }
}

CSSM_DATE CSSMDateForCalendarDate(NSCalendarDate *date) {
    CSSM_DATE result;
    int temp;
    
    if (date) {
        temp = [date yearOfCommonEra];
        
        if ((0 < temp) || (9999 < temp)) {
            PDEBUG(@"Year of date %@ is out of range 0-9999 (inclusive) - cannot represent as a CSSM_DATE.\n", date);
            memset(&result, 0, sizeof(result));
        } else {
            /* I'm guessing this is not much bigger than a 4-iteration loop, and should be faster due to the absence of branches. */
            result.Year[0] = '0' + (temp / 1000);
            temp %= 1000;
            result.Year[1] = '0' + (temp / 100);
            temp %= 100;
            result.Year[2] = '0' + (temp / 10);
            result.Year[3] = '0' + (temp % 10);
            
            temp = [date monthOfYear];
            result.Month[0] = '0' + (temp / 10);
            result.Month[1] = '0' + (temp % 10);
            
            temp = [date dayOfMonth];
            result.Day[0] = '0' + (temp / 10);
            result.Day[1] = '0' + (temp % 10);
            
            //PDEBUG(@"CSSMDateForCalendarDate(%@) -> %s.\n", date, [[date descriptionWithCalendarFormat:@"%Y%m%d"] cString]);
            //PDEBUG(@"result == %c%c%c%c%c%c%c%c.\n", result->Year[0], result->Year[1], result->Year[2], result->Year[3], result->Month[0], result->Month[1], result->Day[0], result->Day[1]);
        }
    } else {
        memset(&result, 0, sizeof(result));
    }

    return result;
}

NSCalendarDate* calendarDateForCSSMDate(const CSSM_DATE *date) {
    if (NULL == date) {
        PDEBUG(@"Parameter 'date' is nil.\n");
        return nil;
    } else {
        int day, month, year, i;
        uint8_t *rawBytesOfDate = (uint8_t*)date;
        
        //PDEBUG(@"calendarDateForCSSMDate() given: %c%c%c%c%c%c%c%c.\n", date->Year[0], date->Year[1], date->Year[2], date->Year[3], date->Month[0], date->Month[1], date->Day[0], date->Day[1]);
        
        for (i = 0; i < sizeof(CSSM_DATE); ++i) {
            if (('0' > rawBytesOfDate[i]) || ('9' < rawBytesOfDate[i])) {
                if (0 == rawBytesOfDate[i]) {
                    PDEBUG(@"Digit %d of the given date is NULL, indicating an invalid date.\n", i);
                } else {
                    PDEBUG(@"Digit %d (value %hhu) of the given date is outside the valid range of ASCII decimal values ('0' to '9' inclusive).\n", i, rawBytesOfDate[i]);
                }
                
                return nil;
            }
        }
        
        day = ((date->Day[0] - '0') * 10) + (date->Day[1] - '0');
        month = ((date->Month[0] - '0') * 10) + (date->Month[1] - '0');
        year = ((date->Year[0] - '0') * 1000) + ((date->Year[1] - '0') * 100) + ((date->Year[2] - '0') * 10) + (date->Year[3] - '0');
        
        //PDEBUG(@"day = %d, month = %d, year = %d.\n", day, month, year);
        //PDEBUG(@"result == %@.\n", [NSCalendarDate dateWithYear:year month:month day:day hour:0 minute:0 second:0 timeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]]);
        
        return [NSCalendarDate dateWithYear:year month:month day:day hour:0 minute:0 second:0 timeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        
        //return [NSString stringWithFormat:@"%c%c/%c%c/%c%c%c%c", date->Day[0], date->Day[1], date->Month[0], date->Month[1], date->Year[0], date->Year[1], date->Year[2], date->Year[3]];
    }
}

NSCalendarDate* calendarDateForTime(const CSSM_X509_TIME *time) {
    NSCalendarDate *result = nil;
        
    if (NULL == time) {
        PDEBUG(@"Argument (time) is NULL.\n");
    } else {
        PDEBUG(@"time == \"%s\".\n", time->time.Data);

    	NSString *timeString = [[NSString stringWithCString:(char*)(time->time.Data) length:time->time.Length] stringByAppendingString:@"0"];

    	//PDEBUG(timeString);
    
    	if (time->timeType == BER_TAG_UTC_TIME) {
        	result = [NSCalendarDate dateWithString:timeString calendarFormat:@"%y%m%d%H%M%S%z"];
        	[result setTimeZone:[NSTimeZone localTimeZone]];
    	} else if (time->timeType == BER_TAG_GENERALIZED_TIME) {
        	// Note that the BER spec allows the generalized time to provide fractions of a second, too, which we don't support here (yet)... note that this will conflict with our timezone stuff...
        	result = [NSCalendarDate dateWithString:timeString calendarFormat:@"%Y%m%d%H%M%S%z"];
        	[result setTimeZone:[NSTimeZone localTimeZone]];
    	} else {
        	result = nil;
        	PDEBUG(@"Time (%p) is in a format (%d) I don't understand.\n", time, time->timeType);
    	}
    }
    
    return result;
}

void copyNSCalendarDateToTime(NSCalendarDate *date, CSSM_X509_TIME *time, CSSM_BER_TAG format) {
    NSTimeZone *previousTimeZone;
    
    if (NULL == time) {
        PDEBUG(@"Invalid parameters - time is NULL.\n");
    } else {
        time->timeType = format;

        if (date) {
            if (time->time.Data != NULL) {
                free(time->time.Data);
            }
            
            previousTimeZone = [date timeZone];
            [date setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];

            switch (format) {
                case BER_TAG_UTC_TIME: // 13+1 bytes (trailing \0)
                    time->time.Length = 13;
                    time->time.Data = malloc(14);

                    [[date descriptionWithCalendarFormat:@"%y%m%d%H%M%SZ"] getCString:(char*)(time->time.Data) maxLength:13];
                    break;
                case BER_TAG_GENERALIZED_TIME: // 15+1 bytes (trailing \0)
                    time->time.Length = 15;
                    time->time.Data = malloc(16);

                    // Note that the BER spec allows the generalized time to provide fractions of a second, too, which we don't support here (yet)
                    
                    [[date descriptionWithCalendarFormat:@"%Y%m%d%H%M%SZ"] getCString:(char*)(time->time.Data) maxLength:15];
                    break;
                default:
                    PDEBUG(@"Told to convert to a format (%d) I don't understand.\n", format);
            }

            [date setTimeZone:previousTimeZone];
        } else {
            time->time.Length = 0;
            time->time.Data = NULL;
        }
    }
}

NSString* nameOfKeyBlob(CSSM_KEYBLOB_TYPE type) {
    return localizedStringWithFallback([NSString stringWithFormat:@"%u", type], @"Keyblob Types");
}

NSString* nameOfTypedFormat(CSSM_KEYBLOB_FORMAT format, CSSM_KEYBLOB_TYPE type) {
    return localizedStringWithFallback([NSString stringWithFormat:@"%u-%u", type, format], @"Keyblob Formats");
}

NSString* nameOfAlgorithm(CSSM_ALGORITHMS algo) {
    return localizedStringWithFallback([NSString stringWithFormat:@"%u", algo], @"Algorithms");
}

NSString* nameOfKeyClass(CSSM_KEYCLASS class) {
    return localizedStringWithFallback([NSString stringWithFormat:@"%u", class], @"Key Classes");
}

NSString* localizedNameOfBitMapValue(uint32_t value, NSString *table) {
    BOOL firstItem = YES;
    NSMutableString *result = [NSMutableString stringWithCapacity:50];
	int i;
    
    for (i = 0; i < 32; ++i) {
        if (value & (1 << i)) {
            if (!firstItem) {
                [result appendString:@", "];
			}
            
            firstItem = NO;
            
            [result appendString:localizedStringWithFallback([NSString stringWithFormat:@"0x%08x", (1 << i)], table)];
        }
    }
    
    if (firstItem) { // i.e. if no items
        [result appendString:@"None"]; /* TODO - localise */
    }
    
    return result;
}

NSString* namesOfAttributes(CSSM_KEYATTR_FLAGS attr) {
    return localizedNameOfBitMapValue(attr, @"Key Attributes");
}

NSString* namesOfUsages(CSSM_KEYUSE use) {
    return localizedNameOfBitMapValue(use, @"Key Usage");
}

NSString* nameOfAlgorithmMode(CSSM_ENCRYPT_MODE mode) {
    return localizedStringWithFallback([NSString stringWithFormat:@"%u", mode], @"Algorithm Modes");
}

NSString* nameOfOIDAlgorithm(const CSSM_OID *oid) {
    if (OIDsAreEqual(oid, &CSSMOID_MD2)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_MD2", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_MD4)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_MD4", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_MD5)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_MD5", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_RSA)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_RSA", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_MD2WithRSA)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_MD2WithRSA", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_MD4WithRSA)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_MD4WithRSA", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_MD5WithRSA)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_MD5WithRSA", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_SHA1WithRSA)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_SHA1WithRSA", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_DH)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_DH", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_DSA)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_DSA", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_SHA1WithDSA)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_SHA1WithDSA", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_SHA1)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_SHA1", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_APPLE_ISIGN)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_APPLE_ISIGN", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_APPLE_X509_BASIC)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_APPLE_X509_BASIC", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_APPLE_TP_SSL)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_APPLE_TP_SSL", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_APPLE_TP_LOCAL_CERT_GEN)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_APPLE_TP_LOCAL_CERT_GEN", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_APPLE_TP_CSR_GEN)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_APPLE_TP_CSR_GEN", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_APPLE_FEE)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_APPLE_FEE", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_APPLE_ASC)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_APPLE_ASC", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_APPLE_FEE_MD5)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_APPLE_FEE_MD5", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_APPLE_FEE_SHA1)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_APPLE_FEE_SHA1", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_APPLE_FEED)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_APPLE_FEED", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_APPLE_FEEDEXP)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_APPLE_FEEDEXP", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_APPLE_ECDSA)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_APPLE_ECDSA", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else {
        return NSLocalizedStringFromTableInBundle(@"Unknown", @"Misc Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    }
}

NSString* x509AlgorithmAsString(const CSSM_X509_ALGORITHM_IDENTIFIER *algo) {
    return [NSString stringWithFormat:@"Algorithm: %@\tParameters: %@", nameOfOIDAlgorithm(&algo->algorithm), [NSDataFromData(&algo->parameters) description]];
}

NSString* nameOfOIDType(const CSSM_OID *type) {
    if (OIDsAreEqual(&CSSMOID_CommonName, type)) {
        return @"Common Name";
    } else if (OIDsAreEqual(&CSSMOID_OrganizationName, type)) {
        return @"Organisation";
    } else if (OIDsAreEqual(&CSSMOID_CountryName, type)) {
        return @"Country";
    } else if (OIDsAreEqual(&CSSMOID_StateProvinceName, type)) {
        return @"State";
    } else if (OIDsAreEqual(&CSSMOID_Surname, type)) {
        return @"Surname";
    } else if (OIDsAreEqual(&CSSMOID_SerialNumber, type)) {
        return @"Serial Number";
    } else if (OIDsAreEqual(&CSSMOID_LocalityName, type)) {
        return @"Locality";
    } else if (OIDsAreEqual(&CSSMOID_CollectiveStateProvinceName, type)) {
        return @"Collective State";
    } else if (OIDsAreEqual(&CSSMOID_StreetAddress, type)) {
        return @"Street Address";
    } else if (OIDsAreEqual(&CSSMOID_CollectiveStreetAddress, type)) {
        return @"Collective Street Address";
    } else if (OIDsAreEqual(&CSSMOID_CollectiveOrganizationName, type)) {
        return @"Collective Organisation Name";
    } else if (OIDsAreEqual(&CSSMOID_OrganizationalUnitName, type)) {
        return @"Organisational Unit Name";
    } else if (OIDsAreEqual(&CSSMOID_CollectiveOrganizationalUnitName, type)) {
        return @"Collective Organisational Unit Name";
    } else if (OIDsAreEqual(&CSSMOID_Title, type)) {
        return @"Title";
    } else if (OIDsAreEqual(&CSSMOID_Description, type)) {
        return @"Description";
    } else if (OIDsAreEqual(&CSSMOID_BusinessCategory, type)) {
        return @"Business Category";
    } else if (OIDsAreEqual(&CSSMOID_PostalAddress, type)) {
        return @"Postal Address";
    } else if (OIDsAreEqual(&CSSMOID_CollectivePostalAddress, type)) {
        return @"Collective Postal Address";
    } else if (OIDsAreEqual(&CSSMOID_PostalCode, type)) {
        return @"Postcode";
    } else if (OIDsAreEqual(&CSSMOID_CollectivePostalCode, type)) {
        return @"Collective Postcode";
    } else if (OIDsAreEqual(&CSSMOID_PostOfficeBox, type)) {
        return @"Post Office Box";
    } else if (OIDsAreEqual(&CSSMOID_CollectivePostOfficeBox, type)) {
        return @"Collective Post Office Box";
    } else if (OIDsAreEqual(&CSSMOID_PhysicalDeliveryOfficeName, type)) {
        return @"Physical Delivery Office Name";
    } else if (OIDsAreEqual(&CSSMOID_CollectivePhysicalDeliveryOfficeName, type)) {
        return @"Collective Physical Delivery Office Name";
    } else if (OIDsAreEqual(&CSSMOID_TelephoneNumber, type)) {
        return @"Telephone Number";
    } else if (OIDsAreEqual(&CSSMOID_CollectiveTelephoneNumber, type)) {
        return @"Collective Telephone Number";
    } else if (OIDsAreEqual(&CSSMOID_FacsimileTelephoneNumber, type)) {
        return @"Fax Number";
    } else if (OIDsAreEqual(&CSSMOID_CollectiveFacsimileTelephoneNumber, type)) {
        return @"Collective Fax Telephone Number";
    } else if (OIDsAreEqual(&CSSMOID_Name, type)) {
        return @"Name";
    } else if (OIDsAreEqual(&CSSMOID_GivenName, type)) {
        return @"Given Name";
    } else if (OIDsAreEqual(&CSSMOID_Initials, type)) {
        return @"Initials";
    } else if (OIDsAreEqual(&CSSMOID_EmailAddress, type)) {
        return @"Email Address";
    } else if (OIDsAreEqual(&CSSMOID_UnstructuredName, type)) {
        return @"Unstructured Name";
    } else if (OIDsAreEqual(&CSSMOID_UnstructuredAddress, type)) {
        return @"Unstructured Address";
    } else {
        PDEBUG(@"Unable to provide a name for a pair type (%p).  It may be an unknown type, but more likely it is a known but unsupported type.", type);
        return nil;
    }
}

NSString* nameOfOIDAttribute(const CSSM_OID *oid) {
    if (OIDsAreEqual(oid, &CSSMOID_ObjectClass)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_ObjectClass", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_AliasedEntryName)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_AliasedEntryName", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_KnowledgeInformation)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_KnowledgeInformation", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_CommonName)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_CommonName", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_Surname)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_Surname", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_SerialNumber)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_SerialNumber", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_CountryName)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_CountryName", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_LocalityName)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_LocalityName", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_StateProvinceName)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_StateProvinceName", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_CollectiveStateProvinceName)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_CollectiveStateProvinceName", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_StreetAddress)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_StreetAddress", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_CollectiveStreetAddress)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_CollectiveStreetAddress", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_OrganizationName)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_OrganizationName", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_CollectiveOrganizationName)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_CollectiveOrganizationName", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_OrganizationalUnitName)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_OrganizationalUnitName", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_CollectiveOrganizationalUnitName)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_CollectiveOrganizationalUnitName", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_Title)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_Title", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_Description)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_Description", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_SearchGuide)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_SearchGuide", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_BusinessCategory)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_BusinessCategory", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_PostalAddress)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_PostalAddress", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_CollectivePostalAddress)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_CollectivePostalAddress", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_PostalCode)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_PostalCode", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_CollectivePostalCode)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_CollectivePostalCode", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_PostOfficeBox)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_PostOfficeBox", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_CollectivePostOfficeBox)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_CollectivePostOfficeBox", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_PhysicalDeliveryOfficeName)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_PhysicalDeliveryOfficeName", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_CollectivePhysicalDeliveryOfficeName)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_CollectivePhysicalDeliveryOfficeName", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_TelephoneNumber)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_TelephoneNumber", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_CollectiveTelephoneNumber)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_CollectiveTelephoneNumber", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_TelexNumber)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_TelexNumber", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_CollectiveTelexNumber)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_CollectiveTelexNumber", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_TelexTerminalIdentifier)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_TelexTerminalIdentifier", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_CollectiveTelexTerminalIdentifier)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_CollectiveTelexTerminalIdentifier", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_FacsimileTelephoneNumber)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_FacsimileTelephoneNumber", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_CollectiveFacsimileTelephoneNumber)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_CollectiveFacsimileTelephoneNumber", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_X_121Address)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_X_121Address", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_InternationalISDNNumber)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_InternationalISDNNumber", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_CollectiveInternationalISDNNumber)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_CollectiveInternationalISDNNumber", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_RegisteredAddress)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_RegisteredAddress", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_DestinationIndicator)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_DestinationIndicator", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_PreferredDeliveryMethod)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_PreferredDeliveryMethod", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_PresentationAddress)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_PresentationAddress", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_SupportedApplicationContext)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_SupportedApplicationContext", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_Member)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_Member", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_Owner)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_Owner", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_RoleOccupant)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_RoleOccupant", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_SeeAlso)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_SeeAlso", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_UserPassword)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_UserPassword", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_UserCertificate)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_UserCertificate", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_CACertificate)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_CACertificate", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_AuthorityRevocationList)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_AuthorityRevocationList", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_CertificateRevocationList)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_CertificateRevocationList", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_CrossCertificatePair)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_CrossCertificatePair", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_Name)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_Name", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_GivenName)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_GivenName", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_Initials)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_Initials", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_GenerationQualifier)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_GenerationQualifier", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_UniqueIdentifier)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_UniqueIdentifier", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_DNQualifier)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_DNQualifier", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_EnhancedSearchGuide)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_EnhancedSearchGuide", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_ProtocolInformation)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_ProtocolInformation", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_DistinguishedName)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_DistinguishedName", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_UniqueMember)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_UniqueMember", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_HouseIdentifier)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_HouseIdentifier", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_EmailAddress)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_EmailAddress", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_UnstructuredName)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_UnstructuredName", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_ContentType)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_ContentType", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_MessageDigest)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_MessageDigest", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_SigningTime)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_SigningTime", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_CounterSignature)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_CounterSignature", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_ChallengePassword)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_ChallengePassword", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_UnstructuredAddress)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_UnstructuredAddress", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_ExtendedCertificateAttributes)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_ExtendedCertificateAttributes", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_QT_CPS)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_QT_CPS", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_QT_UNOTICE)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_QT_UNOTICE", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else {
        return NSLocalizedStringFromTableInBundle(@"Unknown", @"Misc Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    }
}

NSString* subjectPublicKeyAsString(const CSSM_X509_SUBJECT_PUBLIC_KEY_INFO *key) {
    return [NSString stringWithFormat:@"Algorithm:\n\t%@\n\tData: %@", x509AlgorithmAsString(&key->algorithm), NSDataFromData(&key->subjectPublicKey)];
}

NSString* x509NameAsString(const CSSM_X509_NAME *name) {
    int i, j;
    CSSM_X509_RDN_PTR currentRDN;
    CSSM_X509_TYPE_VALUE_PAIR_PTR currentPair;
    NSMutableString *result = [NSMutableString stringWithCapacity:100];

    for (i = 0; i < name->numberOfRDNs; ++i) {
        currentRDN = &name->RelativeDistinguishedName[i];

        for (j = 0; j < currentRDN->numberOfPairs; ++j) {
            currentPair = &currentRDN->AttributeTypeAndValue[j];

            [result appendString:nameOfOIDAttribute(&currentPair->type)];

            if (currentPair->valueType == BER_TAG_PRINTABLE_STRING) {
                [result appendString:[NSString stringWithFormat:@": %@\n", [[[NSString alloc] initWithData:NSDataFromData(&currentPair->value) encoding:NSASCIIStringEncoding] autorelease]]];
            } else {
                [result appendString:[NSString stringWithFormat:@": (%@) %@\n", nameOfBERCode(currentPair->valueType), NSDataFromData(&currentPair->value)]];
            }
        }
    }

    return result;
}

NSString* nameOfOIDExtension(const CSSM_OID *oid) {
    if (OIDsAreEqual(oid, &CSSMOID_SubjectDirectoryAttributes)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_SubjectDirectoryAttributes", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_SubjectKeyIdentifier)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_SubjectKeyIdentifier", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_KeyUsage)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_KeyUsage", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_PrivateKeyUsagePeriod)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_PrivateKeyUsagePeriod", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_SubjectAltName)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_SubjectAltName", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_IssuerAltName)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_IssuerAltName", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_BasicConstraints)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_BasicConstraints", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_CrlNumber)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_CrlNumber", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_CrlReason)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_CrlReason", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_HoldInstructionCode)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_HoldInstructionCode", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_InvalidityDate)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_InvalidityDate", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_DeltaCrlIndicator)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_DeltaCrlIndicator", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_IssuingDistributionPoints)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_IssuingDistributionPoints", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_NameConstraints)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_NameConstraints", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_CrlDistributionPoints)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_CrlDistributionPoints", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_CertificatePolicies)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_CertificatePolicies", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_PolicyMappings)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_PolicyMappings", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_PolicyConstraints)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_PolicyConstraints", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_AuthorityKeyIdentifier)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_AuthorityKeyIdentifier", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_ExtendedKeyUsage)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_ExtendedKeyUsage", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_ExtendedUseCodeSigning)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_ExtendedUseCodeSigning", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else if (OIDsAreEqual(oid, &CSSMOID_NetscapeCertType)) {
        return NSLocalizedStringFromTableInBundle(@"CSSMOID_NetscapeCertType", @"OID Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    } else {
        return NSLocalizedStringFromTableInBundle(@"Unknown", @"Misc Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    }
}

NSString* nameOfDataFormat(CSSM_X509EXT_DATA_FORMAT format) {
    switch (format) {
        case CSSM_X509_DATAFORMAT_ENCODED:
            return NSLocalizedStringFromTableInBundle(@"CSSM_X509_DATAFORMAT_ENCODED", @"Misc Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil); break;
        case CSSM_X509_DATAFORMAT_PARSED:
            return NSLocalizedStringFromTableInBundle(@"CSSM_X509_DATAFORMAT_PARSED", @"Misc Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil); break;
        case CSSM_X509_DATAFORMAT_PAIR:
            return NSLocalizedStringFromTableInBundle(@"CSSM_X509_DATAFORMAT_PAIR", @"Misc Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil); break;
        default:
            return NSLocalizedStringFromTableInBundle(@"Unknown", @"Misc Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil);
    }
}

NSString* extensionAsString(const CSSM_X509_EXTENSION *ext) {
    NSMutableString *result = [NSMutableString stringWithCapacity:100];

    [result appendString:@"Extension ID: "];
    [result appendString:nameOfOIDExtension(&ext->extnId)];

    [result appendString:@"\n\tCritical: "];

    if (ext->critical) {
        [result appendString:NSLocalizedStringFromTableInBundle(@"YES", @"Misc Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil)];
    } else {
        [result appendString:NSLocalizedStringFromTableInBundle(@"NO", @"Misc Names", [NSBundle bundleWithIdentifier:KEYCHAIN_BUNDLE_IDENTIFIER], nil)];
    }

    [result appendString:@"\n\tData Format: "];
    [result appendString:nameOfDataFormat(ext->format)];

    [result appendString:@"\n\tData:\n\t\t"];

    switch (ext->format) {
        case CSSM_X509_DATAFORMAT_ENCODED:
            [result appendString:@"Data Format: "];
            [result appendString:nameOfBERCode(ext->value.tagAndValue->type)];
            [result appendString:@"\n\tData: "];
            [result appendString:stringRepresentationOfBEREncodedData(&ext->value.tagAndValue->value, ext->value.tagAndValue->type)];
            break;
        case CSSM_X509_DATAFORMAT_PARSED:
            [result appendString:[[NSData dataWithBytes:ext->value.parsedValue length:strlen(ext->value.parsedValue)] description]]; break;
        case CSSM_X509_DATAFORMAT_PAIR:
            [result appendString:@"Data Format: "];
            [result appendString:nameOfBERCode(ext->value.valuePair->tagAndValue.type)];
            [result appendString:@"\n\tData: "];
            [result appendString:stringRepresentationOfBEREncodedData(&ext->value.valuePair->tagAndValue.value, ext->value.valuePair->tagAndValue.type)];
            [result appendString:[[NSData dataWithBytes:ext->value.valuePair->parsedValue length:strlen(ext->value.valuePair->parsedValue)] description]]; break;
        default:
            [result appendString:@"<Unreadable>"];
    }

    return result;
}

NSString* extensionsAsString(const CSSM_X509_EXTENSIONS *ext) {
    int i;
    NSMutableString *result = [NSMutableString stringWithCapacity:100];

    for (i = 0; i < ext->numberOfExtensions; ++i) {
        [result appendString:@"\n"];
        [result appendString:extensionAsString(&ext->extensions[i])];
    }

    return result;
}

NSString* signatureAsString(const CSSM_X509_SIGNATURE *sig) {
    return [NSString stringWithFormat:@"Algorithm: %@\nDate: %@", x509AlgorithmAsString(&sig->algorithmIdentifier), NSDataFromData(&sig->encrypted)];
}

// The following two functions, inToDER and DERToInt, were taken from Apple's TP module
// They have been modified to be generic standalone functions and observe aesthetically pleasing
// coding style

void intToDER(uint32 theInt, CSSM_DATA *data) {
    if (theInt < 0x100) {
        data->Length = 1;
        data->Data = (uint8*)malloc(1);
        data->Data[0] = (unsigned char)(theInt);
    } else if (theInt < 0x10000) {
        data->Length = 2;
        data->Data = (uint8*)malloc(2);
        data->Data[0] = (unsigned char)(theInt >> 8);
        data->Data[1] = (unsigned char)(theInt);
    } else if (theInt < 0x1000000) {
        data->Length = 3;
        data->Data = (uint8*)malloc(3);
        data->Data[0] = (unsigned char)(theInt >> 16);
        data->Data[1] = (unsigned char)(theInt >> 8);
        data->Data[2] = (unsigned char)(theInt);
    } else {
        data->Length = 4;
        data->Data = (uint8*)malloc(4);
        data->Data[0] = (unsigned char)(theInt >> 24);
        data->Data[1] = (unsigned char)(theInt >> 16);
        data->Data[2] = (unsigned char)(theInt >> 8);
        data->Data[3] = (unsigned char)(theInt);
    }
}

uint32 DERToInt(const CSSM_DATA *data) {
    uint32 rtn = 0, dex;
    uint8 *bp = data->Data;
    
    for (dex = 0; dex < data->Length; ++dex) {
        rtn <<= 8;
        rtn |= *bp++;
    }
    
    return rtn;
}

NSData* NSDataForDERFormattedInteger(uint32 value) {
    static CSSM_DATA theData;
    NSData *result;
    
    intToDER(value, &theData);
    result = NSDataFromData(&theData);
    free(theData.Data);
    
    return result;
}
