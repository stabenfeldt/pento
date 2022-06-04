defmodule PentoWeb.UserAuthLive do
  import Phoenix.LiveView
  alias Pento.Accounts

  def on_mount(_, params, %{"user_token" => user_token}, socket) do
    user = Accounts.get_user_by_session_token(user_token)
    socket =
      socket
      |> assign(:current_user, user)
    if socket.assigns.current_user do
      {:cont, socket}
    else
      {:halt, redirect(socket, to: "/login")}
    end
  end

  #def mount(_params, session, socket) do {
  #  :ok, assign(
  #    socket,
  #    score: 0,
  #    message: "Guess a number.", session_id: session["live_socket_id"]
  #  ) }
  #end

end
