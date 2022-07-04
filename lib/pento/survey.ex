defmodule Pento.Survey do
  @moduledoc """
  The Survey context.
  """

  import Ecto.Query, warn: false
  alias Pento.Repo

  alias Pento.Survey.Demographic

  @doc """
  Returns the list of demographics.

  ## Examples

      iex> list_demographics()
      [%Demographic{}, ...]

  """
  def list_demographics do
    Repo.all(Demographic)
  end

  @doc """
  Gets a single demographics.

  Raises `Ecto.NoResultsError` if the Demographic does not exist.

  ## Examples

      iex> get_demographics!(123)
      %Demographic{}

      iex> get_demographics!(456)
      ** (Ecto.NoResultsError)

  """
  def get_demographics!(id), do: Repo.get!(Demographic, id)

  @doc """
  Creates a demographics.

  ## Examples

      iex> create_demographics(%{field: value})
      {:ok, %Demographic{}}

      iex> create_demographics(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_demographics(attrs \\ %{}) do
    %Demographic{}
    |> Demographic.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a demographics.

  ## Examples

      iex> update_demographics(demographics, %{field: new_value})
      {:ok, %Demographic{}}

      iex> update_demographics(demographics, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_demographics(%Demographic{} = demographics, attrs) do
    demographics
    |> Demographic.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a demographics.

  ## Examples

      iex> delete_demographics(demographics)
      {:ok, %Demographic{}}

      iex> delete_demographics(demographics)
      {:error, %Ecto.Changeset{}}

  """
  def delete_demographics(%Demographic{} = demographics) do
    Repo.delete(demographics)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking demographics changes.

  ## Examples

      iex> change_demographics(demographics)
      %Ecto.Changeset{data: %Demographic{}}

  """
  def change_demographics(%Demographic{} = demographics, attrs \\ %{}) do
    Demographic.changeset(demographics, attrs)
  end

  alias Pento.Survey.Rating

  @doc """
  Returns the list of ratings.

  ## Examples

      iex> list_ratings()
      [%Rating{}, ...]

  """
  def list_ratings do
    Repo.all(Rating)
  end

  @doc """
  Gets a single rating.

  Raises `Ecto.NoResultsError` if the Rating does not exist.

  ## Examples

      iex> get_rating!(123)
      %Rating{}

      iex> get_rating!(456)
      ** (Ecto.NoResultsError)

  """
  def get_rating!(id), do: Repo.get!(Rating, id)

  @doc """
  Creates a rating.

  ## Examples

      iex> create_rating(%{field: value})
      {:ok, %Rating{}}

      iex> create_rating(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_rating(attrs \\ %{}) do
    %Rating{}
    |> Rating.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a rating.

  ## Examples

      iex> update_rating(rating, %{field: new_value})
      {:ok, %Rating{}}

      iex> update_rating(rating, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_rating(%Rating{} = rating, attrs) do
    rating
    |> Rating.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a rating.

  ## Examples

      iex> delete_rating(rating)
      {:ok, %Rating{}}

      iex> delete_rating(rating)
      {:error, %Ecto.Changeset{}}

  """
  def delete_rating(%Rating{} = rating) do
    Repo.delete(rating)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking rating changes.

  ## Examples

      iex> change_rating(rating)
      %Ecto.Changeset{data: %Rating{}}

  """
  def change_rating(%Rating{} = rating, attrs \\ %{}) do
    Rating.changeset(rating, attrs)
  end

  @doc false
  def get_demographic_by_user(user) do
    Demographic.Query.for_user(user)
    |> Repo.one()
  end
end
