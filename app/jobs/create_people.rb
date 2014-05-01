class CreatePeople
  def self.perform
    definitions.each do |attrs|
      person = Person.find_or_create_by(attrs.slice('email'))
      person.update_attributes(attrs)
      yield(person) if block_given?
    end
  end

  def self.definitions
    YAML::load_file(Rails.root.join('config', 'people.yml'))
  end
end
