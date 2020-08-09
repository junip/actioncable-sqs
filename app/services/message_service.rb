class MessageService
  def initialize(params)
    @params = params
  end

  def perform
    puts "---Message Service ---"
    puts "---Here is your message ---"
    puts "---#{@params} ---"
    ActionCable.server.broadcast("room_channel", @params)
  end

end