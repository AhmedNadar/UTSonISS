class PagesController < ApplicationController

	layout "pages",    only: [ :idea, :thankyou ]
	# layout "projects", only: [ :projects, :final, :simi_final ]

  def idea
  end

  def thankyou
  end

  # def projects
  # 	# all teams
  # end

  # def simi_final
  # 	# 9 teams
  # end

  # def final
  # 	# 3 teams
  # end
end
