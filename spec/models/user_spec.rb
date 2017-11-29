require 'rails_helper'

describe User do
  it { should have_many :comments }
  it { should have_many :images }
  it { should have_many :favorites}

  it "add a favorite" do
    user = FactoryBot.create(:user)
    image = FactoryBot.create(:image)
    user.favorites.create({ image_id: image.id, user_id: user.id })
    expect(user.favorites.first.image_id).to eq image.id
  end
end
