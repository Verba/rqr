namespace :testlib do
  desc 'Make .bundle for test on OSX.'
  task :make do
    require "fileutils"
    base_dir = File.expand_path("#{File.dirname(__FILE__)}/..")
    puts "\n#{base_dir}\n"
    Dir.chdir("#{base_dir}/ext/rqr")
    `ruby extconf.rb`
    `make`
    FileUtils.rm_f("#{base_dir}/lib/rqr/QR.bundle")
    FileUtils.move("#{base_dir}/ext/rqr/QR.bundle", "#{base_dir}/lib/rqr/")
    `make clean`
    Dir.chdir("#{base_dir}")
  end

  desc 'Clean .bundle for test on OSX.'
  task :clean do
    require "fileutils"
    base_dir = File.expand_path("#{File.dirname(__FILE__)}/..")
    puts "#{base_dir}"
    Dir.chdir("#{base_dir}/ext/rqr")
    `make clean`
    FileUtils.rm_f("#{base_dir}/ext/rqr/Makefile")
    FileUtils.rm_f("#{base_dir}/lib/rqr/QR.bundle")
    Dir.chdir("#{base_dir}")
  end
end