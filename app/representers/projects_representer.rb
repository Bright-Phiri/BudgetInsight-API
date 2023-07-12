# frozen_string_literal: true

class ProjectsRepresenter
  def initialize(projects)
    @projects = projects
  end

  def as_json
    projects.map do |project|
      {
        id: project.id,
        name: project.name,
        description: project.description,
        start_date: project.start_date,
        end_date: project.end_date,
        owner: project.user.user_name
      }
    end
  end

  private

  attr_reader :projects
end
