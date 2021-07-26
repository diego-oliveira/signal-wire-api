class NotifyWithHighestTag
  def self.call
    most_used_tag = Tag.most_used
    SendWebhookJob.perform_later(ENV['WEBHOOK_URL'], most_used_tag.as_json)
  end
end
