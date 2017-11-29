require 'rails_helper'

describe Favorite do
  it { should belong_to :image }
  it { should belong_to :user }
end
