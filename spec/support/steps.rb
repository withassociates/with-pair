step "I request ping" do
  visit "/ping"
end

step "I receive pong" do
  expect(page).to have_content("pong")
end
