require 'rails_helper'

RSpec.feature "Visitor clicks product on home page which navigates to product detail page", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'


    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
        )
    end
  end

  scenario "They see one product" do

    visit root_path

    save_screenshot
    expect(page).to have_css 'article.product', count: 10
  end

end
