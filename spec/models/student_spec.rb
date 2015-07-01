require 'rails_helper'

describe Student do
  it { should have_many :projects}
  it {should validate_presence_of :name}
end
