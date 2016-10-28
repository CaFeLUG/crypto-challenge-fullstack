class Challenge < ApplicationRecord
  has_and_belongs_to_many :contests, join_table: "challenges_contests"
  has_many :solutions
  has_many :hints

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  def self.validate_solution(answer, challenge_id, user)
    @challenge = Challenge.find(challenge_id)
    hash = Digest::SHA256.hexdigest(answer + Rails.application.secrets.challenge_key)
    output = BCrypt::Password.new @challenge.solution_hash
      if output == hash
        s = Solution.new
        s.user =  user
        s.challenge =  @challenge
        user.score += @challenge.score
        user.save
        s.save
        return 'SOLVED'
      else
        return 'WRONG'
      end
    #end
  end
end
