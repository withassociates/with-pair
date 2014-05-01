class RemoveSessions
  def self.perform
    Session.destroy_all
  end
end
