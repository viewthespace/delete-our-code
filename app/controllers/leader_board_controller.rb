class LeaderBoardController < ApplicationController

  helper_method :stats

  def stats
    @stats ||= $github_client.contributors_stats('viewthespace/viewthespace').
      collect{|stat| Hashie::Mash.new({author: stat.author, deletions: stat.weeks.last.d})}.sort_by(&:deletions).reverse
  end

end
