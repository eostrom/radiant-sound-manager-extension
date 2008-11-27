namespace :radiant do
  namespace :extensions do
    namespace :sound_manager do
      
      desc "Runs the migration of the Sound Manager extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          SoundManagerExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          SoundManagerExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Sound Manager to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[SoundManagerExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(SoundManagerExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
      
      desc "Copies assets from SoundManager distribution to the extension directory."
      task :pull => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        smroot = ENV['SM_ROOT'] || raise(ArgumentError,
          "Specify SoundManager distribution directory with SM_ROOT"
        )
        basename = File.basename(SoundManagerExtension.root)
        dest = "#{SoundManagerExtension.root}/public/javascripts/#{basename}"
        mkdir_p dest
        rm Dir["#{dest}/*.{js,swf}"]
        cp Dir["#{smroot}/*.swf"], dest
        cp Dir["#{smroot}/script/*.js"], dest
        cp Dir["#{smroot}/demo/play-mp3-links/script/*.js"], dest
      end
    end
  end
end
