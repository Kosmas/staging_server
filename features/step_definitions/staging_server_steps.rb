Given(/^there is a staging server named "(.*?)" with status "(.*?)"$/) do |name, status|
  @server = Server.create!(name: name, status: status)
end

When(/^I go to the status page$/) do
  visit servers_path
end

Then(/^I should see "(.*?)"$/) do |status_message|
  expect(page).to have_content(status_message)
end

When(/^I change to pending testing with "(.*?)" and "(.*?)"$/) do |issue, programmer|
  visit servers_path
  click_on @server.name
  fill_in 'Issue', with: issue
  fill_in 'Programmer', with: programmer
  select 'Pending Testing', from: 'Status'
  click_button 'Update Server'
end
