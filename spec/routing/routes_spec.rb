require 'rails_helper'

RSpec.describe "routing to profiles", :type => :routing do
  it "routes /profile/:username to profile#show for username" do
    expect(:get => "/profiles/jsmith").to route_to(
      :controller => "profiles",
      :action => "show",
      :username => "jsmith"
    )
  end
end
