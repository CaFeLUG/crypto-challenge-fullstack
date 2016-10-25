require 'rails_helper'

RSpec.describe "contests/new", type: :view do
  before(:each) do
    assign(:contest, Contest.new(
      :name => "MyString",
      :status => "MyString",
      :rules => "MyText"
    ))
  end

  it "renders new contest form" do
    render

    assert_select "form[action=?][method=?]", contests_path, "post" do

      assert_select "input#contest_name[name=?]", "contest[name]"

      assert_select "input#contest_status[name=?]", "contest[status]"

      assert_select "textarea#contest_rules[name=?]", "contest[rules]"
    end
  end
end
