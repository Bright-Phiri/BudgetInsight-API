# frozen_string_literal: true

class ProjectRepresenter
  def initialize(project)
    @project = project
  end

  def as_json
    {
      id: project.id,
      name: project.name,
      description: project.description,
      start_date: project.start_date,
      end_date: project.end_date,
      owner: project.user.user_name
    }
  end

  private

  attr_reader :project
end
