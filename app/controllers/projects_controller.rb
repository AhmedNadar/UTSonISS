class ProjectsController < ApplicationController

  layout "projects", only: [ :all, :final, :simi_final ]

  def experiment
    # microgravity​ experiment
  end

  def all
    # all teams
  end

  def honorable
  # 6 honorable teams
  end

  def simi_final
    # 9 teams
  end

  def final
    # 3 teams
  end

  def mentors
    # mentions all outsider mentors
  end

  def osc
    # at Ontario Scinece Center
  end

  def spaceconf; end
  def aerospace2016; end
end
