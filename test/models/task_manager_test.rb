require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_task
    task_manager.create({title: "TDD", description: "Learn to Test"})

    task = task_manager.find(1)

    assert_equal "TDD", task.title
    assert_equal "Learn to Test", task.description
    assert_equal 1, task.id
  end

  def test_find_returns_correct_task
    task_manager.create({title: "TDD1", description: "Learn to Test"})
    task_manager.create({title: "TDD2", description: "Learn to Test Again"})

    task = task_manager.find(2)

    assert_equal "TDD2", task.title
  end

  def test_all_returns_all_tasks
    task_manager.create({title: "TDD1", description: "Learn to Test"})
    task_manager.create({title: "TDD2", description: "Learn to Test Again"})
    task_manager.create({title: "TDD3", description: "Learn to Test A third time"})

    assert_equal 3, task_manager.all.length
    assert_equal 1, task_manager.all[0].id
    assert_equal Task, task_manager.all[1].class
  end

  def test_update_updates_given_task
    task_manager.create({title: "TDD1", description: "Learn to Test"})

    new_task = {title: "ABCDEF", description: "Learn to Test"}
    task_manager.update(1,new_task)

    assert_equal "ABCDEF", task_manager.all[0].title
    assert_equal 1, task_manager.all[0].id
    assert_equal 1, task_manager.all.length
  end

  def test_destroy_removes_task
    task_manager.create({title: "TDD1", description: "Learn to Test"})
    task_manager.create({title: "TDD2", description: "Learn to Test Again"})

    task_manager.destroy(1)
    assert_equal 1, task_manager.all.length
    assert_equal 2, task_manager.all[0].id
  end

end
