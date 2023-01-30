require 'rails_helper'

RSpec.describe "administrators/edit", type: :view do
  let(:administrator) {
    Administrator.create!()
  }

  before(:each) do
    assign(:administrator, administrator)
  end

  it "renders the edit administrator form" do
    render

    assert_select "form[action=?][method=?]", administrator_path(administrator), "post" do
    end
  end
end
