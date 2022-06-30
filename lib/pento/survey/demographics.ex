defmodule Pento.Survey.Demographics do
  use Ecto.Schema
  import Ecto.Changeset

  schema "demographics" do
    field :gender, :string
    field :year_of_birth, :integer
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(demographics, attrs) do
    demographics
    |> cast(attrs, [:gender, :year_of_birth])
    |> validate_required([:gender, :year_of_birth])
    |> unique_constraint(:user_id)
  end
end
