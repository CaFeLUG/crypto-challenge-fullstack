class Contest < ApplicationRecord
  include AASM

  has_and_belongs_to_many :challenges, join_table: "challenges_contests"

  def self.check_status
    Contest.where('status = ? or status = ?', 'pending', 'running').each do |c|
      puts c.status
      if c.status == 'running' and Time.now >= c.ends_at
        c.finish!
      elsif c.status == 'pending' and Time.now >= c.begins_at
        c.run!
      end
    end
  end

  aasm column: :status do
    state :pending, initial: true
    state :running
    state :finished

    event :run do
      transitions from: :pending, to: :running
    end

    event :finish do
      transitions from: :running, to: :finished
    end
  end
end
