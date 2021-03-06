 require "test_helper"

class PlayerTest < ActiveSupport::TestCase

  test "should be valid" do
    cap = Captain.new(name:"Foo", id:11) # init Captain for player
    player = cap.players.build(name:"Player")
    assert player.valid?
  end

  test "check player name presence validation" do
    cap = Captain.new(name:"Foo", id:1) # init Captain for player
    player = cap.players.build
    assert_not player.save, "Name attribute is empty"
  end

  test "check player name length validation" do
    cap = Captain.new(name:"Foo", id:1) # init Captain for player
    player = cap.players.build(name: "x" * 31)
    assert_not player.valid?, "Name is too long"
  end
end