//
//  SKeyPlus.h
//  Keychain
//
//  Created by Wade Tregaskis on 26/01/05.
//  Copyright 2005 Wade Tregaskis. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <Security/cssmtype.h>


@interface SKeyPlusGenerator : NSObject {
    CSSM_DATA base;
    unsigned int usesRemaining;
    
    CSSM_DATA current;
}

/*! @method generatorWithPassword:uses:
    @abstract Generates a new S/Key with a given base password and number of uses.
    @discussion The returned S/Key will be able to generate passwords from the sequence based on 'password', with up to 'uses' unique passwords generated.

                Note that unlike some other Keychain framework classes, this method will always return a new SKeyPlusGenerator instance, even if another one already exists with the same password & uses count.  There are many situations where you may want two independant copies, since using them changes them.

                Also note that you do not have to call nextPassword before using the returned SKeyPlusGenerator - it is automatically initialised to the first password in sequence.
    @param password The base password to use.  This will be copied and stored internally, and will never be revealed again.  Make sure you keep your own copy if you don't want to lose it.
    @param uses The maximum number of uses permitted of the S/Key.  This must be the same for all users of the S/Key (e.g. client & server), otherwise they will not be able to match up to each other, even with the same base password.  You will not be able to retrieve this value from the returned instance, so make sure you keep a copy of it if necessary.
    @result Returns a new SKeyPlusGenerator instance if successful, nil if an error occurs. */

+ (SKeyPlusGenerator*)generatorWithPassword:(NSString*)password uses:(unsigned int)uses;

/*! @method initWithPassword:uses:
    @abstract Initialises a new S/Key with a given base password and number of uses.
    @discussion The returned S/Key will be able to generate passwords from the sequence based on 'password', with up to 'uses' unique passwords generated.  You cannot call this method on an already initialised SKeyPlusGenerator instance - it will return nil, and leave the original unmodified.

                Note that unlike some other Keychain framework classes, this method will always return either nil or the receiver; it will not try to return any existing instance which may have the same initialisation parameters.  SKeyPlusGenerator's are always considered unequal to each other (this includes when used with methods such as isEqual:).

                Also note that you do not have to call nextPassword before using the returned SKeyPlusGenerator - it is automatically initialised to the first password in sequence.
    @param password The base password to use.  This will be copied and stored internally, and will never be revealed again.  Make sure you keep your own copy if you don't want to lose it.
    @param uses The maximum number of uses permitted of the S/Key.  This must be the same for all users of the S/Key (e.g. client & server), otherwise they will not be able to match up to each other, even with the same base password.  You will not be able to retrieve this value from the returned instance (only the <i>current</i> number of uses remaining), so make sure you keep a copy of it if necessary.
    @result Returns the receiver if successful, nil if an error occurs. */

- (SKeyPlusGenerator*)initWithPassword:(NSString*)password uses:(unsigned int)uses;

/*! @function usesRemaining
    @abstract Returns the number of uses remaining of the SKeyPlusGenerator.
    @discussion This number will always decrement over time, although is not guaranteed to change between calls (this method itself does not change the receiver).

                A return value of 0 indicates the receiver has expired and can no longer generate passwords.  The 'currentPassword' and 'nextPassword' methods will logically return nil, in this case.

                Note that this number of uses includes the current password - i.e. a return value of 1 means the next call to nextPassword will <b>not</b> generate a new password, but rather nil as the receiver will have expired.
    @result Returns the number of uses remaining. */

- (unsigned int)usesRemaining;

/*! @function currentPassword
    @abstract Returns the current password for the current number of uses remaining.
    @discussion See the description on how S/Key systems work for more details.

                This method will not change the receiver - that is, it will not decrement the number of uses count.  You may call it any number of times and will receive the same password (provided of course you don't call nextPassword inbetween).
    @result Returns the current password, or nil if the receiver has expired. */

- (NSData*)currentPassword;

/*! @function nextPassword
    @abstract Generates and returns the next password in the receiver's sequence.
    @discussion This method will change the receiver, and should only be called at appropriate times.  It first decrements the number of uses remaining, and then generates the password for the new number of uses.  It then returns the new password.

                If the number of uses remaining drops to 0, the receiver expires and nil will be returned.  If the number of uses remaining is already 0 when this method is invoked, nil will be returned immediately.

                Note that you can retrieve the 'current' password - that is, the password returned by the most recent call to this method, using the currentPassword method.

                Also note that you do *not* have to call this method after initialisation - the class is automatically initialised to the first password in the sequence.
    @result Returns the next password in the sequence, or nil if the receiver has expired. */

- (NSData*)nextPassword;

@end


@interface SKeyPlusVerifier : NSObject {
    unsigned int usesRemaining;
    CSSM_DATA current;
    
    BOOL allowSkips;
}

+ (SKeyPlusVerifier*)verifierWithCurrentPassword:(NSData*)currentPassword usesRemaining:(unsigned int)currentUsesRemaining;

- (SKeyPlusVerifier*)initWithCurrentPassword:(NSData*)currentPassword usesRemaining:(unsigned int)currentUsesRemaining;

- (void)setAllowsSkips:(BOOL)shouldAllowSkips;
- (BOOL)allowsSkips;

- (BOOL)verifyAgainst:(NSData*)password usesRemaining:(unsigned int)uses;
- (BOOL)verifyAndUpdateAgainst:(NSData*)password usesRemaining:(unsigned int)uses;

- (unsigned int)usesRemaining;

@end
