defmodule Pento.Survey do
  @moduledoc """
  The Survey context.
  """

  import Ecto.Query, warn: false
  alias Pento.Repo

  alias Pento.Survey.Demographics

  @doc """
  Returns the list of demographics.

  ## Examples

      iex> list_demographics()
      [%Demographics{}, ...]

  """
  def list_demographics do
    Repo.all(Demographics)
  end

  @doc """
  Gets a single demographics.

  Raises `Ecto.NoResultsError` if the Demographics does not exist.

  ## Examples

      iex> get_demographics!(123)
      %Demographics{}

      iex> get_demographics!(456)
      ** (Ecto.NoResultsError)

  """
  def get_demographics!(id), do: Repo.get!(Demographics, id)

  @doc """
  Creates a demographics.

  ## Examples

      iex> create_demographics(%{field: value})
      {:ok, %Demographics{}}

      iex> create_demographics(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_demographics(attrs \\ %{}) do
    %Demographics{}
    |> Demographics.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a demographics.

  ## Examples

      iex> update_demographics(demographics, %{field: new_value})
      {:ok, %Demographics{}}

      iex> update_demographics(demographics, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_demographics(%Demographics{} = demographics, attrs) do
    demographics
    |> Demographics.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a demographics.

  ## Examples

      iex> delete_demographics(demographics)
      {:ok, %Demographics{}}

      iex> delete_demographics(demographics)
      {:error, %Ecto.Changeset{}}

  """
  def delete_demographics(%Demographics{} = demographics) do
    Repo.delete(demographics)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking demographics changes.

  ## Examples

      iex> change_demographics(demographics)
      %Ecto.Changeset{data: %Demographics{}}

  """
  def change_demographics(%Demographics{} = demographics, attrs \\ %{}) do
    Demographics.changeset(demographics, attrs)
  end
end
