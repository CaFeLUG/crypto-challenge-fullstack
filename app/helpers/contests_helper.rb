module ContestsHelper
  def check_challenge_solved(challenge, user)
    #code
    if user.solutions.pluck(:challenge_id).include? challenge.id
      "&nbsp;&nbsp;&nbsp;<span class='label label-success'>Solved!</span>".html_safe
    end
  end
end
