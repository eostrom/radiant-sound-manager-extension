module SoundManagerTags
  include Radiant::Taggable

  tag 'sound_manager' do |tag|
    script = (tag.attr['debug'] ?
      'soundmanager2.js' :
      'soundmanager2-nodebug-jsmin.js'
    )
    [
      sound_manager_script_tag("/javascripts/sound_manager/#{script}"),
      tag.expand,
      sound_manager_script_tag("/javascripts/sound_manager_extension.js")
    ].join("\n")
  end

  tag 'sound_manager:inlineplayer' do |tag|
    sound_manager_script_tag("/javascripts/sound_manager/inlineplayer.js")
  end
  
private
  
  def sound_manager_script_tag(script)
    %Q(<script src="#{script}" type="text/javascript"></script>)
  end
end
