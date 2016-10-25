require 'rails_helper'

RSpec.describe "contests/edit", type: :view do
  before(:each) do
    @contest = assign(:contest, Contest.create!(
      :name => "MyString",
      :status => "MyString",
      :rules => "MyText"
    ))
  end

  it "renders the edit contest form" do
    render

    assert_select "form[action=?][method=?]", contest_path(@contest), "post" do

      assert_select "input#contest_name[name=?]", "contest[name]"

      assert_select "input#contest_status[name=?]", "contest[status]"

      assert_select "textarea#contest_rules[name=?]", "contest[rules]"
    end
  end
end
