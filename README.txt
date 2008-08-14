== rqr

* http://rubyforge.org/projects/rqr/

== DESCRIPTION:

A ruby library to create QR code. Output: PS, JPEG, PNG, EPS, TIFF.

== SYNOPSIS:

	require "rubygem"
	require "rqr"

  # Block is available from version 0.2.1
	RQR::QRCode.create do |qr|
	  qr.save("http://www.amazon.com", "path/to/qrcode.jpg")
	end


	# QRCode options
	#Use options with hash values.
	#:level       L:0, M:1(default), Q:2, H:3
	#:version     S:0(default), M:1, L:2
	#:auto_extent  true|false auto extent if over version size
	#:masking     masking pattern 0-7, -1(default auto)
	#:length      data length
	#:module_size module size (pixel)
	#:eps_preview true|false

	# This sample creates a EPS with preview.
	RQR::QRCode.new(:eps_preview => true, :auto_extent=false) do |qr|
		qr.save("http://www.ebay.com", "path/to/qrcode.eps")
  end


  # Old style (0.2.0, 0.1.1, 0.1.0)
	qr = RQR::QRCode.new()

	#Define a file format with extensions.
	qr.save("http://www.google.com", "path/to/qrcode.jpg")

	#Define a file format with symbol.
	qr.save("http://www.yahoo.com", "path/to/qrcodefile", :png)	
	

== REQUIREMENTS:

* libjpeg
* libpng
* libtiff

== Note:
If using OSX, Use Fink(http://www.finkproject.org) Universal Binary libs.
* sudo fink install libjpeg
* sudo fink install libpng
* sudo fink install libtiff

or use MacPorts (http://www.macports.com)
* sudo port install jpeg
* sudo port install libpng
* sudo port install tiff


== INSTALL:

* sudo gem install rqr


== LICENSE:

(The MIT License)

Copyright (c) 2008 Ryota Maruko, Keiko Soezima

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.