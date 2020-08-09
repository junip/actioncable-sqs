import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("room connected")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server

  },

  received(data) {
    console.log("----Received data", data)
    // Called when there's incoming data on the websocket for this channel
  }
});
