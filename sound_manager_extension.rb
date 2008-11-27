# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class SoundManagerExtension < Radiant::Extension
  version "1.0"
  description "Adds SoundManager 2 support."
  url "http://github.com/eostrom/radiant-sound-manager-extension/tree/master"
  
  # define_routes do |map|
  #   map.connect 'admin/sound_manager/:action', :controller => 'admin/sound_manager'
  # end
  
  def activate
    Page.send :include, SoundManagerTags
  end
  
  def deactivate
    # admin.tabs.remove "Sound Manager"
  end
  
end
