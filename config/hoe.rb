require 'rqr/version'

AUTHOR = 'Ryota Maruko'  # can also be an array of Authors
EMAIL = "pools _at_ rubyforge _dot_ org"
DESCRIPTION = "A ruby library to create qrcode. Output: PS, JPEG, PNG, EPS, TIFF."
GEM_NAME = 'rqr' # what ppl will type to install your gem
RUBYFORGE_PROJECT = 'rqr' # The unix name for your project
HOMEPATH = "http://#{RUBYFORGE_PROJECT}.rubyforge.org"
DOWNLOAD_PATH = "http://rubyforge.org/projects/#{RUBYFORGE_PROJECT}"

@config_file = "~/.rubyforge/user-config.yml"
@config = nil
RUBYFORGE_USERNAME = "unknown"
def rubyforge_username
  unless @config
    begin
      @config = YAML.load(File.read(File.expand_path(@config_file)))
    rescue
      puts <<-EOS
ERROR: No rubyforge config file found: #{@config_file}
Run 'rubyforge setup' to prepare your env for access to Rubyforge
 - See http://newgem.rubyforge.org/rubyforge.html for more details
      EOS
      exit
    end
  end
  RUBYFORGE_USERNAME.replace @config["username"]
end


REV = nil 
# UNCOMMENT IF REQUIRED: 
# REV = `svn info`.each {|line| if line =~ /^Revision:/ then k,v = line.split(': '); break v.chomp; else next; end} rescue nil
VERS = RQR::VERSION::STRING + (REV ? ".#{REV}" : "")
RDOC_OPTS = ['--quiet', '--title', 'rqr documentation',
    "--opname", "index.html",
    "--line-numbers", 
    "--main", "README",
    "--inline-source"]

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.new(GEM_NAME, VERS) do |p|
  p.developer(AUTHOR, EMAIL)
  p.description = DESCRIPTION
  p.summary = DESCRIPTION
  p.url = HOMEPATH
  p.rubyforge_name = RUBYFORGE_PROJECT if RUBYFORGE_PROJECT
  p.test_globs = ["test/**/test_*.rb"]
  p.clean_globs |= ['**/.*.sw?', '*.gem', '.config', '**/.DS_Store']  #An array of file patterns to delete on clean.
  
  # == Optional
  p.changes = p.paragraphs_of("History.txt", 0..1).join("\n\n")
  #p.extra_deps = []     # An array of rubygem dependencies [name, version], e.g. [ ['active_support', '>= 1.3.1'] ]
  
  #p.spec_extras = {}    # A hash of extra values to set in the gemspec.
  if PACKAGE_PLATFORM =~ /mswin32/
    platform = Gem::Platform.respond_to?(:new) ? Gem::Platform.new('mswin32') : Gem::Platform::WIN32
    p.spec_extras[:platform] = platform
  else
    p.spec_extras[:extensions] = ['ext/rqr/extconf.rb']
  end

end

CHANGES = $hoe.paragraphs_of('History.txt', 0..1).join("\\n\\n")
PATH    = (RUBYFORGE_PROJECT == GEM_NAME) ? RUBYFORGE_PROJECT : "#{RUBYFORGE_PROJECT}/#{GEM_NAME}"
$hoe.remote_rdoc_dir = File.join(PATH.gsub(/^#{RUBYFORGE_PROJECT}\/?/,''), 'rdoc')
$hoe.rsync_args = '-av --delete --ignore-errors'