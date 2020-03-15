class AddGithubAndDemoUrlToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :github_url, :string
    add_column :projects, :demo_url, :string
  end
end
