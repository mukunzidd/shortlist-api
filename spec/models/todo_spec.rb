require 'rails_helper'

# Test SUITE for the Todo model
RSpec.describe Todo, type: :model do
  # Association test
  # Ensure that Todo has a 1:m relationship with Item model
  it {should have_many(:items).dependent(:destroy)}

  # Validation test
  # Ensure that columns title and created_by are present before saving
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:created_by)}
end
