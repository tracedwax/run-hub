Then /^I should see my username$/ do
  assert (page.has_content? "#{@user.email}"), "Profile did not show username."
end
