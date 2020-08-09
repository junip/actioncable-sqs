class SqsSend

  def initialize(message)
    @message = message
  end
  
  def send_message
    Shoryuken.sqs_client = Aws::SQS::Client.new(
      region: ENV['AWS_REGION']
      credentials: Aws::Credentials.new(
        ENV['AWS_ACCESS_KEY_ID'],
        ENV['AWS_SECRET_ACCESS_KEY']
      )
    )
    Shoryuken::Client.queues('notification-testing.fifo').send_message(message_body: @message)
  end
end