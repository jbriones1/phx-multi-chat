defmodule MultiChatWeb.PageController do
  use MultiChatWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
