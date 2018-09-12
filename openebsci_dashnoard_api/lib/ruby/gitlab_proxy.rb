require "gitlab"
require 'json'
require 'awesome_print'
require Logger

def gitlab_client 
  Gitlab.configure do |config|
    config.endpoint = "https://gitlab.openebs.ci/api/v4"
    config.private_token = "Q3VWd1rxg3NL5Zv75jw3"
  end
  Logger.info "testtesttesttest"

  @g = Gitlab.client(endpoint: "https://gitlab.openebs.ci/api/v4", private_token: "Q3VWd1rxg3NL5Zv75jw3")
end 

def get_project_names
  Tuple.new([:ok, gitlab_client.projects.reduce([]) {|x,y| x << y.name}.to_json ])
end 

def get_projects 
  Tuple.new([:ok, gitlab_client.projects.reduce([]) {|x,y| x << y.to_hash}.to_json ])
end 

def get_pipelines(project_id)
  Tuple.new([:ok, gitlab_client.pipelines(project_id).reduce([]) {|x,y| x << y.status}.to_json ])
end 