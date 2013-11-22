mathew  = Person.create(
  name: "Mathew Wilson O'Day",
  email: "mathew@withassociates.com",
  skills: "Design, UX"
)
erin = Person.create(
  name: "Erin Staniland",
  email: "erin@withassociates.com",
  skills: "Ruby, Systems Architecture"
)
jenifer = Person.create(
  name: "Jenifer Dunn",
  email: "jenifer@withassociates.com",
  skills: "Javascript, CSS"
)
anna = Person.create(
  name: "Anna Goss",
  email: "anna@withassociates.com",
  skills: "UX, Project Management"
)
jamie = Person.create(
  name: "Jamie White",
  email: "jamie@withassociates.com",
  skills: "Ruby, Javascript, CSS"
)
tom = Person.create(
  name: "Tom Marshall",
  email: "thomas@withassociates.com",
  skills: "Ruby, Javascript, CSS"
)
brendan = Person.create(
  name: "Brendan Gatens",
  email: "brendan@withassociates.com",
  skills: "Design, UX"
)
joseph = Person.create(
  name: "Joseph Morrow",
  email: "joseph@withassociates.com",
  skills: "Ruby, Javascript, CSS, Design, UX"
)

epoch = Date.tomorrow + 10.hours

Person.all.each_with_index do |p, n|
  time = epoch + n.hours
  p.sessions.create(
    starts_at: time,
    ends_at: time + 30.minutes
  )
end
