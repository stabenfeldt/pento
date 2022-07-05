defmodule PentoWeb.SurveyLive do
	use PentoWeb, :live_view
  alias __MODULE__.Component
  alias __MODULE__.Title

	def mount(_params, _session, socket) do
		{:ok, socket}
	end

end

