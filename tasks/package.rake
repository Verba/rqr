desc "Build all the packages for mswin32"
task :package_for_mswin32 => [:package] do
  mv "pkg/#{GEM_NAME}-#{VERS}.gem", "pkg/#{GEM_NAME}-#{VERS}-mswin32.gem"
  mv "pkg/#{GEM_NAME}-#{VERS}.tgz", "pkg/#{GEM_NAME}-#{VERS}-mswin32.tgz"
  mv "pkg/#{GEM_NAME}-#{VERS}", "pkg/#{GEM_NAME}-#{VERS}-mswin32"
end