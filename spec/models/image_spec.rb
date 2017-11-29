require 'rails_helper'

describe Image do
  it { should belong_to :user }
  it { should have_and_belong_to_many :tags }
  it { should have_many(:users).through(:comments) }
  it { should have_many :comments }
end
