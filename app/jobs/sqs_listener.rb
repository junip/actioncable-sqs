class SqsListener
  include Shoryuken::Worker

  shoryuken_options queue: 'notification-testing.fifo', auto_delete: false

  def perform(sqs_msg, message)
    puts "-------#{message}"
    MessageWorker.perform_async(message)
    sqs_msg.delete
  end
end
