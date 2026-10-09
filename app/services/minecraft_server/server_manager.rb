# frozen_string_literal: true

# a namespace for managing the minecraft server, doing the API calls e system commands.
module ServerManager
  # method that use github CLI commands to START the minecraft server
  def self.start
    # authentication
    system("echo #{ENV['GHCLI']} | gh auth login --with-token --git-protocol ssh")
    # start codespace and minecraft server
    system("gh codespace ssh -c #{ENV['CDNAME']} -- 'nohup /workspaces/freefire4/minecraft/run_crafty.sh > crafty.log 2>&1 & nohup playit > playit.log 2>&1 &'")
    puts 'Initializing codespace and Minecraft server.'
  end

  # method that use github CLI commands to STOP the minecraft server
  def self.stop
    # authentication
    system("echo #{ENV['GHCLI']} | gh auth login --with-token --git-protocol ssh")
    # start codespace and stop minecraft server
    puts 'Saving and closing Minecraft server'
    system(
      "gh", "codespace", "ssh", "-c", ENV['CDNAME'], "--",
      "curl -k -X POST https://127.0.0.1:8443/api/v2/servers/#{ENV['SERVER_ID']}/action -H 'Authorization: Bearer #{ENV['CRAFTY_TOKEN']}' -H 'Content-Type: application/json' -d '{\"action\": \"stop_server\"}'"
    )
    sleep(15)
    system("gh", "codespace", "stop", "-c", ENV['CDNAME'])
    puts 'Closing codespace server.'
  end
end
