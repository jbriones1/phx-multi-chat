defmodule MultiChatWeb.PageController do
  use MultiChatWeb, :controller

  def index(conn, _params) do
    redirect(conn, to: "/chat/general")
  end
end
