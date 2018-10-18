require 'rails_helper'

# Test SUITE for Todo Model 
RSpec.describe Item, type: :model do
  # Association Test
  # Ensure that an item belongs to a single todo
  it {should belong_to(:todo)}

  # Validation Test
  # Ensure that column name is prensent before saving
  it {should validate_presence_of(:name)}
end
