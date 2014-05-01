step "I request ping" do
  visit '/ping'
end

step "I receive pong" do
  expect(page).to have_content('pong')
end

step "there is a session available today with Tom" do
  tom = Person.create(
    name: 'Tom Marshall',
    email: 'thomas@withassociates.com',
    skills: 'Javascript, CSS, Ruby',
    screenhero_url: 'http://join.screenhero.com/code'
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

step "I describe what I want to work on" do
  fill_in "Project", with: "Foo bar " * 10
end

step "I see :content" do |content|
  expect(page).to have_content(content)
end

step "Tom gets an email notification of the booking" do
  email = ActionMailer::Base.deliveries.find { |delivery|
    delivery.to.include?('thomas@withassociates.com')
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

step "I am signed in to Google as :email" do |email|
  OmniAuth.config.add_mock(:google_apps, {
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

placeholder :time do
  match /(.+)/ do |t|
    Chronic.parse(t)
  end
end
