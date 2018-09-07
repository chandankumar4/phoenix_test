defmodule OpenebsciDashnoardApi.ProjectsControllerTest do
  use OpenebsciDashnoardApi.ConnCase

  alias OpenebsciDashnoardApi.Projects
  @valid_attrs %{http_url_to_repo: "some http_url_to_repo", name: "some name", ssh_url_to_repo: "some ssh_url_to_repo"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, projects_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing projects"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, projects_path(conn, :new)
    assert html_response(conn, 200) =~ "New projects"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, projects_path(conn, :create), projects: @valid_attrs
    projects = Repo.get_by!(Projects, @valid_attrs)
    assert redirected_to(conn) == projects_path(conn, :show, projects.id)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, projects_path(conn, :create), projects: @invalid_attrs
    assert html_response(conn, 200) =~ "New projects"
  end

  test "shows chosen resource", %{conn: conn} do
    projects = Repo.insert! %Projects{}
    conn = get conn, projects_path(conn, :show, projects)
    assert html_response(conn, 200) =~ "Show projects"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, projects_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    projects = Repo.insert! %Projects{}
    conn = get conn, projects_path(conn, :edit, projects)
    assert html_response(conn, 200) =~ "Edit projects"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    projects = Repo.insert! %Projects{}
    conn = put conn, projects_path(conn, :update, projects), projects: @valid_attrs
    assert redirected_to(conn) == projects_path(conn, :show, projects)
    assert Repo.get_by(Projects, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    projects = Repo.insert! %Projects{}
    conn = put conn, projects_path(conn, :update, projects), projects: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit projects"
  end

  test "deletes chosen resource", %{conn: conn} do
    projects = Repo.insert! %Projects{}
    conn = delete conn, projects_path(conn, :delete, projects)
    assert redirected_to(conn) == projects_path(conn, :index)
    refute Repo.get(Projects, projects.id)
  end
end
