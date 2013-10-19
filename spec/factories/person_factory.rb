FactoryGirl.define do
  factory :person do
    ignore do
      tags nil
    end

    first_name 'Bob'
    last_name 'Jones'

    trait :with_tags do
      after(:create) do |instance, evaluator|
        tags = evaluator.tags.map do |tag|
          create :tag, title: tag
        end

        instance.tags << tags
        instance.save!
      end
    end
  end
end