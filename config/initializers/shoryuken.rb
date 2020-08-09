# Use long polling
Shoryuken.sqs_client_receive_message_opts = {
  wait_time_seconds: 20,
  # max_number_of_messages: 10
}

# Adding queue here since the queue name is dynamic based on the environment
Shoryuken.add_group('default', 1)
Shoryuken.add_queue('notification-testing.fifo', 1, 'default')