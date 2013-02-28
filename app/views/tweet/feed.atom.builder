atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated

  @tweets.each do |item|
    next if item.updated_at.blank?

    feed.entry( item ) do |entry|
      entry.url edit_admin_tweet_url(item)
      entry.title item.text
      entry.content item.text, :type => 'html'
      entry.author do |author|
        entry.author_name "@#{item.screen_name}"
      end

      # the strftime is needed to work with Google Reader.
      entry.updated(item.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 
    end
  end
end