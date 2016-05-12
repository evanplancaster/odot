require 'spec_helper'

describe "Destroying todo lists" do
  let!(:todo_list) { todo_list = TodoList.create(title: "Groceries", description: "Grocery List.") }

  it "destroys a todo list successfully" do
    visit "/todo_lists"
    within "#todo_list_#{todo_list.id}" do
      click_link "Destroy"
    end

    expect(page).to_not have_content(todo_list.title)
    expect(TodoList.count).to eq(0)
  end
end
