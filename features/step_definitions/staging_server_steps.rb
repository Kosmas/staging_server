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

When(/^I change to testing with tester "(.*?)" and testing started at "(.*?)"$/) do |tester, test_started_at|
  visit servers_path
  click_on @server.name
  fill_in 'Tester', with: tester
  fill_in 'Test started at', with: test_started_at
  select 'Testing', from: 'Status'
  click_button 'Update Server'
end

When(/^I change to approved$/) do
  visit servers_path
  click_on @server.name
  select 'Approved', from: 'Status'
  click_button 'Update Server'
end

Then(/^I should see the current time$/) do
  expect(page).to have_content(DateTime.now.strftime("%Y-%m-%d %H:%M:%S"))
end

When(/^I change to available$/) do
  visit servers_path
  click_on @server.name
  select 'Available', from: 'Status'
  click_button 'Update Server'
end

Then(/^I should see all other fields empty$/) do
  expect(@server.issue).to be_nil
  expect(@server.programmer).to be_nil
  expect(@server.tester).to be_nil
  expect(@server.test_started_at).to be_nil
  expect(@server.approved_at).to be_nil
end
