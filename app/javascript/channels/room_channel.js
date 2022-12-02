import consumer from "./consumer"

document.addEventListener("turbolinks:load", () => {
  const data = document.getElementById("data")
  const room_id = data.getAttribute("data-room-id")
  const user_id = data.getAttribute("data-user-id")

  consumer.subscriptions.create(
    { channel: "RoomChannel", room_id: room_id, user_id: user_id },
    {
      connected() {
        // Called when the subscription is ready for use on the server
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        // Called when there's incoming data on the websocket for this channel
      }
    }
  )
})
