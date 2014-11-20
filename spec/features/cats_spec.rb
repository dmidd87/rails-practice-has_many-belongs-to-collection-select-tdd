require 'rails-helper'

feature "Cats" do

scenario "Cat show page lists toys that cat owns"
  cat = Cat.create! (name: "Test")
  toy = Toy.create!(
  name: fuzzyball,
  cat_id: cat.id
  )
  visit root_path
  click_on "Test"
  expect(page).to have_content "fuzzyball"
end

scenario "Toy index page should list
          the cat that owns each of the toys."
  cat = Cat.create! (name: "Test")
  toy = Toy.create!(
  name: fuzzyball,
  cat_id: cat.id
  )
  visit root_path
  click_on "Toys"
  expect(page).to have_content "fuzzyball"
end

scenario "Toy show page should list the cat that owns that toy"
  cat = Cat.create! (name: "Test")
  toy = Toy.create!(
  name: fuzzyball,
  cat_id: cat.id
  )
  visit root_path
  click_on "Toys"
  expect(page).to have_content "fuzzyball"
  expect(page).to have_content "Test"
end

scenario "Toy new page should have a collection select for all Cats."
  cat = Cat.create! (name: "Test")
  click_on "New Toy!"
  fill_in "Name", with: "ball"
  select "Test" :from => "cat_id"
  click_on "Create Toy"
  expect(page).to have_content "Test"
  expect(page).to have_content "ball"
end

scenario "Toy new page should create a new toy and cat ownership
          and list it on the index"
  cat = Cat.create! (name: "Test")
  click_on "New Toy!"
  fill_in "Name", with: "ball"
  select "Test" :from => "cat_id"
  click_on "Create Toy"
  expect(page).to have_content "Test"
  expect(page).to have_content "ball"
end
