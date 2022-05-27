defmodule PentoWeb.WrongLive do
  use Phoenix.LiveView, layout: {PentoWeb.LayoutView, "live.html"}

  @number_to_guess :rand.uniform(10)

  def mount(_params, _session, socket) do
    {:ok, 
      assign(socket, 
        score: 0,
        message: "Make a guess:",
        number_to_guess: @number_to_guess,
        time: DateTime.utc_now |> to_string
      )
    }
  end

  def render(assigns) do
    ~H"""
    <h1>Your score: <%= @score %></h1>
    <h2>
      <%= @message %>
    <br/>
      It's <%= @time %>
    </h2>
    <h2>
      <%= for n <- 1..10 do %>
        <a href="#" phx-click="guess" phx-value-number= {n} ><%= n %></a>
      <% end %>
    </h2>
    """
  end

  def time() do
    DateTime.utc_now |> to_string
  end

  def handle_event("guess", %{"number" => guess}=_data, socket) do
    IO.puts "@number_to_guess = #{@number_to_guess}"
    IO.puts "Guess is #{guess}"
    message = ""
    if @number_to_guess == @number_to_guess do
      IO.puts "equal"
    end

    score = socket.assigns.score
    IO.puts "Score was #{score}"

    score = calulate_new_score(score, guess)

    {
      :noreply,
      assign(
        socket,
        message: message,
        score: score,
        time: DateTime.utc_now |> to_string
      )
    }
  end

    def calulate_new_score(score, guess) do
      if String.to_integer(guess) ==  @number_to_guess do
        IO.puts "correct"
        message = "Your guess: #{guess}. CORRECT!"
        score = score + 1
      else
        IO.puts "NOT correct"
        message = "Your guess: #{guess}. Wrong. Guess again. "
        score = score - 1
      end

      IO.puts "Score is now #{score}"
        score = score + 1
      score
    end
end
