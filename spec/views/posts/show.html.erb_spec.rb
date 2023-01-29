# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/show' do
  before do
    assign(:post, Post.create!(
                    title: 'Title'
                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
  end
end
