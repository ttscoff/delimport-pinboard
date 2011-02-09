/*
 *  Logging.h
 *  Keychain
 *
 *  Created by Wade Tregaskis on 26/01/05.
 *  Copyright 2005 Wade Tregaskis. All rights reserved.
 *
 */

/*! @header Logging
    @abstract Defines various macro's for logging output to various places.
    @discussion To make the Keychain framework suitable for many uses, it must be able to configure it's logging in various ways.  These included turning it on/off at compile time, and determining where debug output goes (either the console, standard out or standard error, for example).

                There are various compile-time flags which change how these macro's are defined.  They are:

                    <li>NO_CONSOLE_OUTPUT - If defined, any output that would normally go to the console (via NSLog) is ignored.</li>
                    <li>NO_ERROR_OUTPUT - If defined, any output that would normally go to standard error is ignored.</li>
                    <li>NO_STANDARD_OUTPUT - If defined, any output that would normally got to standard output is ignored.</li>
                    <li>NDEBUG - If defined, any output that would normally be given via a PDEBUG call will be ignored.  This flag is a generic one usually set by the compiler (or XCode) based on your compile preferences.</li>
                    <li>DEBUG_TO_STD_OUT - If defined all debug output will go to standard out (rather than the console, which is the default).  The behaviour is undefined if DEBUG_TO_STD_ERR is also defined.</li>
                    <li>DEBUG_TO_STD_ERR - If defined all debug output will go to standard error (rather than the console, which is the default).  The behaviour is undefined if DEBUG_TO_STD_OUT is also defined.</li>
                    <li>STD_ERR_TO_CONSOLE - If defined all output to standard error (via PERR) will be instead routed to the console (i.e. PCONSOLE).<li>
                    <li>STD_OUT_TO_CONSOLE - If defined all output to standard out (via POUT) will be instead routed to the console (i.e. PCONSOLE).<li>

                The macro's which you can use for output are documented (as function calls) individually.  Refer to the appropriate documentation (which should be accessible via the index for this, the Logging, header file).  These macro's will only be defined if they have not already been defined.  In this way you can override them with your own custom versions by simply defining them before you import this header file. */

#include <Foundation/Foundation.h>


/*! @function PCONSOLE
    @abstract Logs NSString-style formatted output to the console.
    @discussion Unlike PERR, POUT and other such macro's, PCONSOLE assumes the format string is NSString-style, meaning it supports all the printf-style arguments as well as %@ for Objective-C objects.  This behaviour is presently required, so please do support it if you override PCONSOLE.

                You may use PCONSOLE for any user-orientated messages in a GUI application, where POUT/PERR may not produce user-visible output.  Note however that you can use the STD_ERR_TO_CONSOLE and STD_OUT_TO_CONSOLE compiler flags to route PERR/POUT to the console, which has the advantage of increased flexibility by separating normal and error messages.  It's best to use PCONSOLE only if you explicitly want the output to go to the console, not standard out/error.
    @param format The format string (as an NSString, not a C string).  Should not be nil.
    @param args A variable number of arguments suitable for the given 'format' string. */

#ifndef PCONSOLE
    #ifndef NO_CONSOLE_OUTPUT
        #define PCONSOLE(format, ...) NSLog(format, ## __VA_ARGS__)
    #else
        #define PCONSOLE(format, ...) /* Do nothing */
    #endif
#endif

/*! @function PCONSOLEC
    @abstract Logs printf-style formatted output to the console.
    @discussion PCONSOLEC is a C-style version of PCONSOLE.  That is, it takes a C string instead of an NSString as the argument, and is guaranteed only to support printf-style format strings - NSString extensions may or may not be supported, and should not be relied upon.

                You may use PCONSOLEC for any user-orientated messages in a GUI application, where POUT/PERR may not produce user-visible output.  Note however that you can use the STD_ERR_TO_CONSOLE and STD_OUT_TO_CONSOLE compiler flags to route PERR/POUT to the console, which has the advantage of increased flexibility by separating normal and error messages.  It's best to use PCONSOLEC only if you explicitly want the output to go to the console, not standard out/error.
    @param format The format string (as a C string, not an NSString).  Should not be NULL.
    @param args A variable number of arguments suitable for the given 'format' string. */

#ifndef PCONSOLEC
    #ifndef NO_CONSOLE_OUTPUT
        #define PCONSOLEC(format, ...) PCONSOLE(@"%@", [NSString stringWithFormat:format, ## __VA_ARGS__])
    #else
        #define PCONSOLEC(format, ...) /* Do nothing */
    #endif
#endif

/*! @function PERRC
    @abstract Logs printf-style formatted output to standard error.
    @discussion Unlike PCONSOLEC, PERRC assumes the format string is printf-style, meaning it is a C string (not an NSString) and supports only printf-style arguments, not the %@ for Objective-C objects.

                Use PERRC for any user-orientated error messages.  Remember, though, that GUI applications may not have a user-visible standard error, and so the messages may be lost.  Best to only use this macro in CLI programs, or when the STD_ERR_TO_CONSOLE compile-time flag is defined.
    @param format The format string (as a C string, not an NSString).  Should not be NULL.
    @param args A variable number of arguments suitable for the given 'format' string. */

#ifndef PERRC
    #ifdef NO_ERROR_OUTPUT
        #define PERRC(format, ...) /* Do nothing */
    #elif defined(STD_ERR_TO_CONSOLE)
        #define PERRC(format, ...) PCONSOLEC(format, __VA_ARGS__)
    #else
        #define PERRC(format, ...) fprintf(stderr, format, ## __VA_ARGS__)
    #endif
#endif

/*! @function PERR
    @abstract Logs NSString-style formatted output to standard error.
    @discussion PERR assumes the format string is an NSString containing NSString-style formatting, meaning it supports both printf-style arguments and the %@ for Objective-C objects.

                Use PERR for any user-orientated error messages.  Remember, though, that GUI applications may not have a user-visible standard error, and so the messages may be lost.  Best to only use this macro in CLI programs, or when the STD_ERR_TO_CONSOLE compile-time flag is defined.
    @param format The format string (as an NSString, not a C string).  Should not be nil.
    @param args A variable number of arguments suitable for the given 'format' string. */

#ifndef PERR
    #ifdef NO_ERROR_OUTPUT
        #define PERR(format, ...) /* Do nothing */
    #elif defined(STD_ERR_TO_CONSOLE)
        #define PERR(format, ...) PCONSOLE(format, ## __VA_ARGS__)
    #else
        #define PERR(format, ...) PERRC("%s", [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String])
    #endif
#endif

/*! @function POUTC
    @abstract Logs printf-style formatted output to standard output.
    @discussion POUTC assumes the format string is printf-style, meaning it supports only printf-style arguments, not the %@ for Objective-C objects.

                Use POUTC for any user-orientated messages that don't explicitly relate to an error.  You might use it to print status indications, general information, or similar such purposes.  Remember that in GUI programs there may not be a user-visible standard out, and so these messages will be lost.  Best to only use this macro in CLI programs, or when the STD_OUT_TO_CONSOLE compile-time flag is defined.
    @param format The format string (as a C string, not an NSString).  Should not be NULL.
    @param args A variable number of arguments suitable for the given 'format' string. */

#ifndef POUTC
    #ifdef NO_STANDARD_OUTPUT
        #define POUTC(format, ...) /* Do nothing */
    #elif defined(STD_OUT_TO_CONSOLE)
        #define POUTC(format, ...) PCONSOLEC(format, ## __VA_ARGS__)
    #else
        #define POUTC(format, ...) fprintf(stdout, format, ## __VA_ARGS__)
    #endif
#endif

/*! @function POUT
    @abstract Logs NSString-style formatted output to standard output.
    @discussion POUT assumes the format string is an NSString in NSString-style, meaning it supports both printf-style arguments and the %@ for Objective-C objects.

                Use POUT for any user-orientated messages that don't explicitly relate to an error.  You might use it to print status indications, general information, or similar such purposes.  Remember that in GUI programs there may not be a user-visible standard out, and so these messages will be lost.  Best to only use this macro in CLI programs, or when the STD_OUT_TO_CONSOLE compile-time flag is defined.
    @param format The format string (as an NSString, not a C string).  Should not be nil.
    @param args A variable number of arguments suitable for the given 'format' string. */

#ifndef POUT
    #ifdef NO_STANDARD_OUTPUT
        #define POUT(format, ...) /* Do nothing */
    #elif defined(STD_OUT_TO_CONSOLE)
        #define POUT(format, ...) PCONSOLE(format, ## __VA_ARGS__)
    #else
        #define POUT(format, ...) POUTC("%s", [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String])
    #endif
#endif

/*! @function PDEBUG
    @abstract Logs NSString-style formatted output to an appropriate place (e.g. the console, standard err, etc).
    @discussion PDEBUG is just a special alias for an appropriate version of PERR, POUT or PCONSOLE, depending on the presence of certain compiler flags.  It is frequently defined out in release builds to reduce the size of the final binary.

                Note that PDEBUG will always accept NSString-style formatted output, regardless of whether the output is destined for the console, standard error, standard output, or any other location.  It automagically takes care of any NSString-to-printf style conversion.

                You should use PDEBUG for any messages which meet any of the following criteria:

                    <li>They contain only programmer-centric data which will be meaningless to an end user.</li>
                    <li>They may be printed very frequently.</li>
                    <li>They indicate events or information not necessary for normal program operation.<li>

                If necessary, use a PDEBUG and PERR/POUT pair; the PERR/POUT to convey user-orientated messages (e.g. "Certificate generation failed due to invalid parameters") and the PDEBUG to list the parameters and their actual values.
    @param format The format string (as an NSString, not a C string).  Should not be nil.
    @param args A variable number of arguments suitable for the given 'format' string. */

#ifndef PDEBUG
    #ifdef NDEBUG
        #define PDEBUG(format, ...) /* Do nothing */
    #elif defined(DEBUG_TO_STD_OUT)
        #define PDEBUG(format, ...) POUT(@"%s: %s:%d - %@", __FILE__, __func__, __LINE__, [NSString stringWithFormat:format, ## __VA_ARGS__])
    #elif defined(DEBUG_TO_STD_ERR)
        #define PDEBUG(format, ...) PERR(@"%s: %s:%d - %@", __FILE__, __func__, __LINE__, [NSString stringWithFormat:format, ## __VA_ARGS__])
    #else
        #define PDEBUG(format, ...) PCONSOLE(format, ## __VA_ARGS__)
    #endif
#endif

/*! @function PDEBUGC
    @abstract Logs printf-style formatted output to an appropriate place (e.g. the console, standard err, etc).
    @discussion PDEBUGC is just a special alias for an appropriate version of PERRC, POUTC or PCONSOLEC, depending on the presence of certain compiler flags.  It is frequently defined out in release builds to reduce the size of the final binary.

                You should use PDEBUGC for any messages which meet any of the following criteria:

                    <li>They contain only programmer-centric data which will be meaningless to an end user.</li>
                    <li>They may be printed very frequently.</li>
                    <li>They indicate events or information not necessary for normal program operation.<li>

                If necessary, use a PDEBUGC and PERRC/POUTC pair; the PERRC/POUTC to convey user-orientated messages (e.g. "Certificate generation failed due to invalid parameters") and the PDEBUGC to list the parameters and their actual values.
    @param format The format string (as a C string, not an NSString).  Should not be NULL.
    @param args A variable number of arguments suitable for the given 'format' string. */

#ifndef PDEBUGC
    #ifdef NDEBUG
        #define PDEBUGC(format, ...) /* Do nothing */
    #elif defined(DEBUG_TO_STD_OUT)
        #define PDEBUGC(format, ...) POUTC("%s: %s:%d - " format, __FILE__, __func__, __LINE__, ## __VA_ARGS__)
        //#define PDEBUGC(format, ...) POUT([NSString stringWithFormat:"%s: %s:%d - %@", __FILE__, __func__, __LINE__, [NSString stringWithFormat:format, ## __VA_ARGS__]])
    #elif defined(DEBUG_TO_STD_ERR)
        #define PDEBUGC(format, ...) PERRC("%s: %s:%d - " format, __FILE__, __func__, __LINE__, ## __VA_ARGS__)
        //#define PDEBUGC(format, ...) PERR([NSString stringWithFormat:"%s: %s:%d - %@", __FILE__, __func__, __LINE__, [NSString stringWithFormat:format, ## __VA_ARGS__]])
    #else
        #define PDEBUGC(format, ...) PCONSOLEC(format, ## __VA_ARGS__)
    #endif
#endif
