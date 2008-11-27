require File.dirname(__FILE__) + '/../spec_helper'

describe "SoundManager tag" do
  before :each do
    @page = Page.new(:slug => 'test')
  end
  
  describe "<r:sound_manager />" do
    it 'links to the soundmanager script' do
      @page.should render("<r:sound_manager />").matching(
        /javascripts\/sound_manager\/soundmanager2[^\/]*.js/
      )
    end
    
    it 'links to the soundmanager extension script' do
      @page.should render("<r:sound_manager />").matching(
        /javascripts\/sound_manager_extension.js/
      )
    end
  end
  
  describe "<r:sound_manager:inlineplayer />" do
    it 'links to the inline player script' do
      @page.should render("<r:sound_manager:inlineplayer />").matching(
        /javascripts\/sound_manager\/inlineplayer[^\/]*.js/
      )
    end
  end
end
