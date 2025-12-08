# command for testing
module TestController
  def self.setup(bot)
    bot.register_application_command(:test, 'Um comando de teste', server_id: '837301573670797382')
    bot.application_command(:test) do |testing|
      testing.respond(content: 'e ai, estou testado, viu?')
    end
  end
end

# command with bot mentions
module MentionController
  def self.handle(msgmention)
    message = msgmention.content.downcase
    if message.include?('e ai') || message.include?('aoi') 
        msgmention.respond('opa, tudo beleza?')
        
    elsif message.include?('vai catar coquinho') || message.include?('vai se lascar')
        msgmention.respond('vai você :( ')

    else msgmention.respond('que foi?')
    end
  end
end
