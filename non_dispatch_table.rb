require 'rubygems'
require 'json'
require 'dispatch_table_actions'
class MessageParser
  attr_accessor :users
  attr_accessor :account_to_feeds
  
  def initialize
    self.users = {}
    self.account_to_feeds = Hash.new{|h,k| h[k] = []}
  end
  
  def accept(message)
    json_message = JSON.parse(message)
    message_type = parse_message_type(json_message)
    if(message_type == :register)
      self.users[message['account']] = message['name']
    elsif(message_type == :subscribe)
      self.account_to_feeds[message['account']] << message['feed_id']
    else
      raise "Unknown Message"
    end
  end
  
  def parse_message_type(json_message)
    json_message['type'].to_sym
  end
    
end
MessageParser.new.accept("{\"type\":\"register\", \"name\":\"MrJaba\", \"account\":\"0000000\"}")
MessageParser.new.accept("{\"type\":\"subscribe\", \"account\":\"0000000\", \"feed_id\":\"555\"}")

