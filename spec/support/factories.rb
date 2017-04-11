FactoryGirl.define do
  factory :escape do
    sequence :name do |n|
      "Escape #{n}"
    end

    sequence :description do |n|
      "Description #{n}"
    end

    price "200.00"

    sequence :city do |n|
      "City #{n}"
    end

    image "image.url"
  end

  sequence :category_title do |n|
      "Category#{n}"
  end

  factory :category do
    title { generate(:category_title) }

    factory :category_with_escapes do
      escapes { create_list(:escape, 2) }
    end
  end

end
