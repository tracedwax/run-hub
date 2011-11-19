# features/support/paths.rb
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'
    when /^the sign in\s?page$/
      '/users/sign_in'
    when /^the sign up\s?page$/
      '/users/sign_up'
    when /^my workouts\s?page$/
      '/workouts'
    when /^my workouts on the week of 11\/6\/2011$/
      '/workouts/11-6-2011'
    when /^create a workout$/
      '/workouts/new'
    when /^the create a workout page$/
      '/workouts/new'
    when /^my profile page$/
      '/profiles/' + @user.id.to_s
    when /^my public workouts on 11\/6\/2011$/
      '/profiles/' + @user.id.to_s + '/workouts/11-6-2011'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
