defmodule OpenebsciDashnoardApi.ProjectsView do
  use OpenebsciDashnoardApi.Web, :view

  def render("index.json", %{projects: projects}) do
    %{data: render_many(projects, OpenebsciDashnoardApi.ProjectsView, "projects.json")}
  end

  def render("show.json", %{projects: projects}) do
    %{data: render_one(projects, OpenebsciDashnoardApi.ProjectsView, "projects.json")}
  end

  def render("projects.json", %{projects: projects}) do
    %{id: projects.id,
      name: projects.name,
      ssh_url_to_repo: projects.ssh_url_to_repo,
      http_url_to_repo: projects.http_url_to_repo}
  end
end
