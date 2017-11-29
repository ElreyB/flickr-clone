require 'rails_helper'

describe Image do
  it { should belong_to :user }
  it { should have_and_belong_to_many :tags }
  it { should have_many :comments }
  it { should have_many :favorites}

  it 'return users favorite images' do
    user = FactoryBot.create(:user)
    image = FactoryBot.create(:image)
    image2 = FactoryBot.create(:image)
    image3 = FactoryBot.create(:image)
    user.favorites.create({ image_id: image.id, user_id: user.id })
    user.favorites.create({ image_id: image2.id, user_id: user.id })
    expect(Image.get_favorites(user.id)).to eq [image, image2]
  end

  it 'will tag an image' do
    image = FactoryBot.create(:image)
    tag1 = image.tags.create( { name: "tiger"} )
    tag2 = image.tags.create( { name: "white tiger"} )
    expect(image.tags).to eq [tag1, tag2]

  end
end
