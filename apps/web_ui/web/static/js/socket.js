import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {token: window.userToken}})

socket.connect()

// Now that you are connected, you can join channels with a topic:
let channel = socket.channel("price", {})
channel.join()
  .receive("error", resp => { console.log("Unable to join channel", resp) })

channel.on("new_price", payload => {
  var priceSpan = document.getElementById("price");
  priceSpan.innerText = payload.price;
})

export default socket
