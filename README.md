# delimport-pinboard

Index your [Pinboard](http://pinboard.in) bookmarks using [Spotlight](http://www.apple.com/macosx/what-is-macosx/spotlight.html)
on Mac OS X. Updates every half-hour. Includes url, title, description, and tags.

I've been heavily invested in [Delicious](http://delicious.com) as a bookmarking service for many years.
However, after learning about Delicious' [sunsetting](https://twitter.com/waxpancake/status/15483488237002752),
I've decided to join the ranks of the [Great Delicious Exodus](https://twitter.com/PinboardIN/status/20323781167816704)
and sign up for an account with [Pinboard](http://pinboard.in).

This is a fork of the awesome [delimport](http://ianhenderson.org/delimport.html), which automatically indexes
Delicious bookmarks and makes them available via Spotlight and Spotlight-powered tools (e.g.
[Alfred](http://alfredapp.com)) on Mac OS X. This fork indexes your Pinboard bookmarks instead.


## Building from Source

Ian's code requires the _Mac OS X 10.4u SDK_. I had to uninstall Xcode 3.2.x and reinstall Xcode 3.1.4 to
get the 10.4u SDK so I could compile. I've documented my own process in the post:
[Import Delicious/Pinboard Bookmarks Into Spotlight for Mac OS X](http://blog.ryanparman.com/2011/01/01/import-deliciouspinboard-bookmarks-into-spotlight-for-mac-os-x/).

Assuming you have the Mac OS X 10.4u SDK installed, it should simply be:

	git clone git://github.com/skyzyx/delimport-pinboard.git
	cd delimport-pinboard
	open delimport.xcodeproj

Then click the _Build_ button at the top of Xcode.


## Known Issues

* Pinboard tags don't seem to be indexed. I need to poke around in Ian's code a little more.


## Contributing

I don't know the first thing about Objective-C or the Cocoa frameworks. I'm just good at poking around
in the code and replacing strings here and there. I don't provide support, because I wouldn't have any
answers for you anyway. Let me know if you know Objective-C and want to contribute.


## License and Copyright

This software is copyright (c) 2007 Ian Henderson.

There is no license as far as I can find, so I'm putting myself on the line by redistributing this code.
I've contacted Ian and asked what the license is, but he hasn't responded up to this point. I hope he's
okay with this. Ian, if you're not, please let me know.
