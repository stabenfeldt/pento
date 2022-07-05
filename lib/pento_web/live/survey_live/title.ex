defmodule PentoWeb.SurveyLive.Title do
  use Phoenix.Component

  def my_title(assigns) do
    ~H"""
    <pre> 
    My Title - <%= @name %>
    </pre>
    """
  end
end

