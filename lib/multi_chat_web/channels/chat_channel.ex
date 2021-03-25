defmodule MultiChatWeb.ChatChannel do
  use MultiChatWeb, :channel

  alias MultiChat.Chats

  @impl true
  def join("chat:" <> _room, _payload, socket) do
      push(socket, "joined", %{"message" => "hello"})
      {:ok, socket}
  end

  @impl true
  def handle_in("shout", payload, socket) do
    "chat:" <> room = socket.topic # retrieve the subtopic
    payload = Map.merge(payload, %{"room" => room}) # append the room name to the payload
    Chats.create_message(payload) # store the payload into the database
    broadcast socket, "shout", payload # broadcast the payload
    {:noreply, socket}
  end
end
