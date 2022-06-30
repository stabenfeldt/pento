defmodule Pento.SurveyTest do
  use Pento.DataCase

  alias Pento.Survey

  describe "demographics" do
    alias Pento.Survey.Demographics

    import Pento.SurveyFixtures

    @invalid_attrs %{gender: nil, year_of_birth: nil}

    test "list_demographics/0 returns all demographics" do
      demographics = demographics_fixture()
      assert Survey.list_demographics() == [demographics]
    end

    test "get_demographics!/1 returns the demographics with given id" do
      demographics = demographics_fixture()
      assert Survey.get_demographics!(demographics.id) == demographics
    end

    test "create_demographics/1 with valid data creates a demographics" do
      valid_attrs = %{gender: "some gender", year_of_birth: 42}

      assert {:ok, %Demographics{} = demographics} = Survey.create_demographics(valid_attrs)
      assert demographics.gender == "some gender"
      assert demographics.year_of_birth == 42
    end

    test "create_demographics/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Survey.create_demographics(@invalid_attrs)
    end

    test "update_demographics/2 with valid data updates the demographics" do
      demographics = demographics_fixture()
      update_attrs = %{gender: "some updated gender", year_of_birth: 43}

      assert {:ok, %Demographics{} = demographics} = Survey.update_demographics(demographics, update_attrs)
      assert demographics.gender == "some updated gender"
      assert demographics.year_of_birth == 43
    end

    test "update_demographics/2 with invalid data returns error changeset" do
      demographics = demographics_fixture()
      assert {:error, %Ecto.Changeset{}} = Survey.update_demographics(demographics, @invalid_attrs)
      assert demographics == Survey.get_demographics!(demographics.id)
    end

    test "delete_demographics/1 deletes the demographics" do
      demographics = demographics_fixture()
      assert {:ok, %Demographics{}} = Survey.delete_demographics(demographics)
      assert_raise Ecto.NoResultsError, fn -> Survey.get_demographics!(demographics.id) end
    end

    test "change_demographics/1 returns a demographics changeset" do
      demographics = demographics_fixture()
      assert %Ecto.Changeset{} = Survey.change_demographics(demographics)
    end
  end
end
