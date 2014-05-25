class MatchesController < ApplicationController

  def ajax_get_match
    @match = Match.find(params[:match_id])
    render :layout => false
  end
end
