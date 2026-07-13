# this initialize a codespace server, actually its only a test message.

# i will make cooldown soon, to prevent malicious users from spamming /iniciar and /fechar, which can causes issues in the minecraft server world.


module InitiateServer
  def self.setup(bot)
    bot.register_application_command(:iniciar, 'Initiate codespace server and crafty server.', server_id: '837301573670797382')
    bot.application_command(:iniciar) do |initializing|
      # for the discord dont having timeout
      initializing.defer

        # authentication
        system("echo #{ENV['GHCLI']} | gh auth login --with-token --git-protocol ssh")

        # start codespace and minecraft server
        system("gh codespace ssh -c #{ENV['CDNAME']} -- 'nohup /workspaces/freefire4/minecraft/run_crafty.sh > crafty.log 2>&1 & nohup playit > playit.log 2>&1 &'")
        puts 'Iniciando CodeSpace e servidor de Minecraft'

        initializing.edit_response(content: 'Opa, verifique se o servidor de Minecraft está aberto, caso ele não esteja em até 1 minuto, mande mensagem para @jakedodrip')
    end
  end
end



module StopServer
  def self.setup(bot)
    bot.register_application_command(:fechar, 'Initiate codespace server and crafty server.', server_id: '837301573670797382')
    bot.application_command(:fechar) do |stopping|
      # for the discord dont having timeout
      stopping.defer

      system("echo #{ENV['GHCLI']} | gh auth login --with-token --git-protocol ssh")

      # start codespace and stop minecraft server
      puts 'Mundo  salvado e fechando'
      system(
        "gh", "codespace", "ssh", "-c", ENV['CDNAME'], "--",
        "curl -k -X POST https://127.0.0.1:8443/api/v2/servers/#{ENV['SERVER_ID']}/action -H 'Authorization: Bearer #{ENV['CRAFTY_TOKEN']}' -H 'Content-Type: application/json' -d '{\"action\": \"stop_server\"}'"
      )

      sleep(15)

      system("gh", "codespace", "stop", "-c", ENV['CDNAME'])
      puts 'Servidor codespace fechado.'

      stopping.edit_response(content: 'Servidor foi fechado.')
    end
  end
end
