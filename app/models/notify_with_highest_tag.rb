class NotifyWithHighestTag
  def self.call
    most_used_tag = Tag.most_used
    SendWebhookJob.perform_later('https://webhook.site/f465cea7-b8b3-47d9-a609-bcda480041bd', most_used_tag.as_json)
  end
end
