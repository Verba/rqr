PACKAGE_PLATFORM = (ARGV[0] =~ /mswin32$/) ? 'mswin32' : RUBY_PLATFORM
require 'config/requirements'
require 'config/hoe' # setup Hoe + all gem configuration

Dir['tasks/**/*.rake'].each { |rake| load rake }