require 'rails_helper'

RSpec.describe "contests/index", type: :view do
  before(:each) do
    assign(:contests, [
      Contest.create!(
        :name => "Name",
        :status => "Status",
        :rules => "MyText"
      ),
      Contest.create!(
        :name => "Name",
        :status => "Status",
        :rules => "MyText"
      )
    ])
  end

  it "renders a list of contests" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
