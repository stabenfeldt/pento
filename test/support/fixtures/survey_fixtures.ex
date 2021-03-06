defmodule Pento.SurveyFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pento.Survey` context.
  """

  @doc """
  Generate a demographics.
  """
  def demographics_fixture(attrs \\ %{}) do
    {:ok, demographics} =
      attrs
      |> Enum.into(%{
        gender: "some gender",
        year_of_birth: 42
      })
      |> Pento.Survey.create_demographics()

    demographics
  end

  @doc """
  Generate a rating.
  """
  def rating_fixture(attrs \\ %{}) do
    {:ok, rating} =
      attrs
      |> Enum.into(%{
        stars: 42
      })
      |> Pento.Survey.create_rating()

    rating
  end
end
