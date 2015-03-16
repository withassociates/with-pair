step "I request ping" do
  visit '/ping'
end

step "I receive pong" do
  expect(page).to have_content('pong')
end

step "there is a session available today with Tom" do
  tom = Person.create(
    name: 'Tom Example',
    email: 'tom@example.com',
    skills: 'Javascript, CSS, Ruby'
  )
  Session.create(
    person: tom,
    starts_at: 1.hour.from_now,
    ends_at: 1.hour.from_now + 30.minutes
  )
end

step "I visit the site" do
  visit "/"
end

step "I click :button" do |button|
  click_on button
end

step "I fill in my contact details" do
  fill_in "Name", with: "Jo Smith"
  fill_in "Skype ID", with: "jo.smith"
  fill_in "Email", with: "jo.smith@example.com"
end

step "I fill in the hidden field" do
  find(:xpath, "//input[@id='winnie']").set "Anything"
end

step "I describe what I want to work on" do
  fill_in "Project", with: "Foo bar " * 10
end

step "I see :content" do |content|
  expect(page).to have_content(content)
end

step "Tom gets an email notification of the booking" do
  email = ActionMailer::Base.deliveries.find { |delivery|
    delivery.to.include?('tom@example.com')
  }
  expect(email).not_to be_nil
  expect(email.decoded).to include('jo.smith')
end

step "I get an email notification of the booking" do
  email = ActionMailer::Base.deliveries.find { |delivery|
    delivery.to.include?('jo.smith@example.com')
  }
  expect(email).not_to be_nil
end

step "I visit :path" do |path|
  visit path
end

step "I fill in :field with :value" do |field, value|
  fill_in field, with: value
end

step "there is a person with email :email" do |email|
  Person.create(
    name: 'Example Person',
    email: 'example@withassociates.com',
    skills: 'Javascript, Testing'
  )
end

step "I am signed in to Google as :email" do |email|
  OmniAuth.config.add_mock(:google_oauth2, {
    'info' => {
      'email' => email
    }
  })
end

step "I am in :timezone" do |timezone|
  Time.zone = timezone
end

step "it is :time" do |time|
  Timecop.freeze(time)
end

step "I am signed in" do
  person = Person.create(
    name: 'Example Person',
    email: 'example@withassociates.com',
    skills: 'Javascript, Testing'
  )

  OmniAuth.config.add_mock(:google_oauth2, {
    'info' => {
      'email' => person.email
    }
  })
end

step "there have been some bookings" do
  person = Person.first

  person.sessions.create!(
    starts_at: 2.weeks.ago,
    ends_at: 2.weeks.ago + 30.minutes
  )
  person.sessions.create!(
    starts_at: 1.week.ago,
    ends_at: 1.week.ago + 30.minutes
  )

  person.sessions.first.bookings.create!(
    name: 'Jo Smith',
    email: 'jo.smith@example.com',
    project: 'Need help promoting our small business online.'
  )

  person.sessions.last.bookings.create!(
    name: 'Flo Green',
    email: 'flo.green@example.com',
    project: 'Help setting up a Rails production server.'
  )
end

step "I see a list of past bookings" do
  Booking.past.each do |booking|
    expect(page).to have_content booking.name
  end
end

step "I receive a 422 response code" do
  expect(page.status_code).to eq 422
end

step "no booking is saved" do
  expect(Booking.count).to eq 0
end

placeholder :time do
  match /(.+)/ do |t|
    Chronic.parse(t)
  end
end
