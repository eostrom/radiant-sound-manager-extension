namespace :sound_manager do
  desc "Copies assets from SoundManager distribution to the extension directory."
  task :pull do
    is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
    extroot = File.join(File.expand_path(File.dirname(__FILE__)), '/..')
    smroot = ENV['SM_ROOT'] || raise(ArgumentError,
      "Specify SoundManager distribution directory with SM_ROOT"
    )
    dest = "#{extroot}/public/javascripts/sound_manager"
    mkdir_p dest
    rm Dir["#{dest}/*.{js,swf}"]
    cp Dir["#{smroot}/*.swf"], dest
    cp Dir["#{smroot}/script/*.js"], dest
    cp Dir["#{smroot}/demo/play-mp3-links/script/*.js"], dest
  end
end
