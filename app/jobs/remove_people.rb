class RemovePeople
  def self.perform
    Person.destroy_all
  end
end
