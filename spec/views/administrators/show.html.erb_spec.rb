require 'rails_helper'

RSpec.describe "administrators/show", type: :view do
  before(:each) do
    assign(:administrator, Administrator.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
