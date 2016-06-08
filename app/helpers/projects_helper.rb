module ProjectsHelper
  def get_first_sentence project
    project.description.split('.').first + "."
  end
end
