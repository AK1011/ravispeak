#!/usr/bin/env ruby
require 'rubygems'
$:.unshift File.expand_path '../lib', File.dirname(__FILE__)
require 'skype'

def RaviSpeak (message)
  originalmessage = newmessage = message.body

  replace = File.open("replace.rv").read
  remove = File.open("remove.rv").read

  replace.each_line do |line|
    pairs = line.split(":")
    reg = pairs[0].strip
    newmessage = newmessage.gsub(/(^|[^a-zA-Z])#{reg}($|[^a-zA-Z])/, pairs[1].chomp)
    newmessage = newmessage.gsub(/(^|[^a-zA-Z])#{reg}($|[^a-zA-Z])/, pairs[1].chomp)
    newmessage = newmessage.strip
  end

  remove.each_line do |line|
    newmessage = newmessage.chomp(line.strip)
  end
  newmessage = newmessage.slice(0,1).capitalize + newmessage.slice(1..-1)

  if (originalmessage.strip != newmessage)
    message.edit(newmessage)
  end
end

puts "skype rubygem v#{Skype::VERSION}: RaviSpeak starting, your messages should be deRavified in a few seconds once we catch up to the recent skype chats."

runtime = Time.new

chats = Skype.chats
username = File.open("user.rv", &:readline)


chats.each do |c|
  Thread.new do
    last_id = 0
    loop do
      c.messages.each do |m|
        if (m.time > runtime)
          next unless last_id < m.id
          last_id = m.id
          if (m.user == username)
            RaviSpeak m
          end
        end
      end
      sleep 1
    end
  end
end

loop do

end