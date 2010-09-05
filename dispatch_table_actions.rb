module DispatchTableActions
  
  def register(message)
    self.users[message['account']] = message['name']
  end
  
  def subscribe(message)
    self.account_to_feeds[message['account']] << message['feed_id']
  end  
  
end