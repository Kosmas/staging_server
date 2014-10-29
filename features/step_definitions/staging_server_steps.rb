Given(/^there is staging server named "(.*?)" with status "(.*?)"$/) do |name, status|
  Server.create!(name: name, status: status)
end

When(/^I go to the status page$/) do
  visit servers_path
end

Then(/^I should see "(.*?)"$/) do |status_message|
  expect(page).to have_content(status_message)
end
