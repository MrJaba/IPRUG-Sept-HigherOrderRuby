require 'rubygems'
require 'json'
require 'dispatch_table_actions'
class MessageParser
  include DispatchTableActions
  attr_accessor :users
  attr_accessor :account_to_feeds
  
  def initialize
    self.users = {}
    self.account_to_feeds = Hash.new{|h,k| h[k] = []}
    @dispatch_table = {
                        :register => method(:register),
                        :subscribe => method(:subscribe)
                      }
  end
  
  def accept(message)
    json_message = JSON.parse(message)
    message_type = parse_message_type(json_message)
    @dispatch_table[message_type].call(json_message)
  end
  
  def parse_message_type(json_message)
    json_message['type'].to_sym
  end
    
end
MessageParser.new.accept("{\"type\":\"register\", \"name\":\"MrJaba\", \"account\":\"0000000\"}")
MessageParser.new.accept("{\"type\":\"subscribe\", \"account\":\"0000000\", \"feed_id\":\"555\"}")

