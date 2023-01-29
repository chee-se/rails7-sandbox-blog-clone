# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/index' do
  before do
    assign(:users, [
             User.create!,
             User.create!
           ])
  end

  it 'renders a list of users' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
