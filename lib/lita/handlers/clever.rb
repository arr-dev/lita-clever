require 'lita'
require 'clever-api'

module Lita
  module Handlers
    class Clever < Handler
      on :unhandled_message, :clever

      def clever(payload)
        msg = payload[:message]
        if msg && msg.body && !msg.body.empty? && msg.command?
          bot = CleverBot.new
          source = payload[:message].source

          response = bot.think payload[:message].body
          robot.send_message(source, response)
        end
      end
    end

    Lita.register_handler(Clever)
  end
end
