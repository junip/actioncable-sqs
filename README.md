# SQS-ActionCable-Integration

- Integration App with Action Cable and Amazon SQS.
- Added Shroyuken gem to send message to AMAZON SQS 
- Listen Queue Message with Shroyuken Listener worker.
- Process Message and Send the message to Respective Channel.


### Intialize

- Add Default Config for Shroyuken

```
Shoryuken.sqs_client_receive_message_opts = {
  wait_time_seconds: 20,
  max_number_of_messages: 10
}

Shoryuken.add_group('default', 1) // this group related to SQS group id
Shoryuken.add_queue('your-queue-name', 1, 'default')
```

- Setup QUEUE in your amazon account.
- Add the amazon credentials in .env
```
AWS_REGION=
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
```
- Listen on to receive message from SQS
```
 bundle exec Shoryuken -r .app/jobs/sqs_listener.rb -R
```
- Run sidekiq
```
bundle exec sidekiq
```
- Update the queue name to send the message to SQS.
  - Shoryuken.add_queue('your-queue-name', 1, 'default')
  - Update the queue name to the `sqs-send.rb` file. 

- Start server `rails s`
- Open Browser console and run on port 3000
- Send Message to SQS

```
SqsSend.new(your_message).send_message
```
- You will get the message in browser console.