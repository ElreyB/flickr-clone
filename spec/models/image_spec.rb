require 'rails_helper'

describe Image do
  it { should belong_to :user }
  it { should have_and_belong_to_many :tags }
  it { should have_many :comments }
  it { should have_many :favorites}
  # it { should have_attached_file(:photo) }
end
