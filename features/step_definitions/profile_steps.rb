Then /^I should see my username$/ do
  assert (page.has_content? "#{@user.email}"), "Profile did not show username."
end

When /^I follow the link for my email address in the navigation bar$/ do
  click_link("#{@user.email}")
end
