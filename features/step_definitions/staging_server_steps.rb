Given(/^there is staging server named "(.*?)" with status "(.*?)"$/) do |name, status|
  Server.create!(name: name, status: status)
end

When(/^I go to the status page$/) do
  visit servers_path
end

