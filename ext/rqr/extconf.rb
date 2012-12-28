=begin
  usage: ruby extconf.rb [options ...]
  configure options:
    --with-opt-dir=/path/to/libraries
    --with-jpeg-include=dir
    --with-jpeg-lib=dir
    --with-png-include=dir
    --with-png-lib=dir
    --with-tiff-include=dir
    --with-tiff-lib=dir
=end
require 'mkmf'
require 'rbconfig'

dir_config('jpeg')
dir_config('png')
dir_config('tiff')

unless RUBY_PLATFORM =~ /darwin/
  $libs = append_library($libs, "supc++")
end

have_header('jpeglib.h')
have_library('jpeg')

have_header('png.h')
have_library('png')

have_header('tiff.h')
have_library('tiff')

create_makefile('rqr/QR')
