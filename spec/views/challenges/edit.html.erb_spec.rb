require 'rails_helper'

RSpec.describe "challenges/edit", type: :view do
  before(:each) do
    @challenge = assign(:challenge, Challenge.create!(
      :name => "MyString",
      :description => "MyText",
      :payload => "MyText",
      :score => 1
    ))
  end

  it "renders the edit challenge form" do
    render

    assert_select "form[action=?][method=?]", challenge_path(@challenge), "post" do

      assert_select "input#challenge_name[name=?]", "challenge[name]"

      assert_select "textarea#challenge_description[name=?]", "challenge[description]"

      assert_select "textarea#challenge_payload[name=?]", "challenge[payload]"

      assert_select "input#challenge_score[name=?]", "challenge[score]"
    end
  end
end
