class MessageWorker
  include Sidekiq::Worker

  def perform(params)
    service = MessageService.new(params)
    service.perform
  end
end
