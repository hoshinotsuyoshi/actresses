require 'amazon/ecs'

::Amazon::Ecs.options = {
  :associate_tag     => 'streaming010-22',
  :AWS_access_key_id => 'AKIAJ375YNN6KVUMFWKQ',       
  :AWS_secret_key    => ENV["AWS_SECRET_KEY"] 
}

module ApplicationHelper
  def affi word
    @affi ||= {}
    return @affi[word]["content"] if @affi[word] and ( @affi[word]["expire"] > Time.now )
    @affi[word] = {}
    @affi[word]["expire"]  = Time.now + (60*60*24)
    @affi[word]["content"] = search word
  end
  private
  def search word
    ::Amazon::Ecs.item_search(word, {:response_group => 'Medium', :search_index =>'All', :country => 'jp'})
  end
    
end
