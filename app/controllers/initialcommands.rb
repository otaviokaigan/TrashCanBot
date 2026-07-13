# Command for testing

module TestController
  def self.setup(bot)
    bot.register_application_command(:test, 'Um comando de teste', server_id: '837301573670797382')
    bot.application_command(:test) do |testing|
      testing.respond(content: 'opa, tô testado')
    end
  end
end

# Command with bot mentions

module MentionController
  def self.handle(msgmention)
    message = msgmention.content.downcase

    case
    when message.include?('ping')
      msgmention.respond('Pong!')
    when message.include?('pong')
      msgmention.respond('Ping!')
    else
      msgmention.respond('qq há mermão? pinga eu atoa não')
    end
  end
end
