defmodule OpenebsciDashnoardApi.ProjectsTest do
  use OpenebsciDashnoardApi.ModelCase

  alias OpenebsciDashnoardApi.Projects

  @valid_attrs %{http_url_to_repo: "some http_url_to_repo", name: "some name", ssh_url_to_repo: "some ssh_url_to_repo"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Projects.changeset(%Projects{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Projects.changeset(%Projects{}, @invalid_attrs)
    refute changeset.valid?
  end
end
