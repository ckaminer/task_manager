require_relative '../test_helper'

class UserCanCreateANewTaskTest < FeatureTest

  def test_user_creates_task
    visit '/'

    click_link "New Task"

    fill_in 'task[title]', with: "Learn Capybara"
    fill_in 'task[description]', with: "Capybara and Launchy fun time"

    click_button "create task"

    #within block is used to make test scope smaller so you can look in exact place for error
    #within(".task-1") do
      assert page.has_content?("Learn Capybara")
    #end
  end

end
