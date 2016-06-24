class AddGithubAndDemoUrlToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :github_url, :string
    add_column :projects, :demo_url, :string
  end
end
