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
end
