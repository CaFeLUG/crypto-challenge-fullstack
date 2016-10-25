require 'rails_helper'

RSpec.describe "challenges/new", type: :view do
  before(:each) do
    assign(:challenge, Challenge.new(
      :name => "MyString",
      :description => "MyText",
      :payload => "MyText",
      :score => 1
    ))
  end

  it "renders new challenge form" do
    render

    assert_select "form[action=?][method=?]", challenges_path, "post" do

      assert_select "input#challenge_name[name=?]", "challenge[name]"

      assert_select "textarea#challenge_description[name=?]", "challenge[description]"

      assert_select "textarea#challenge_payload[name=?]", "challenge[payload]"

      assert_select "input#challenge_score[name=?]", "challenge[score]"
    end
  end
end
