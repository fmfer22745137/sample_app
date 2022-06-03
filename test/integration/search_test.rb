require "test_helper"

class SearchTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:fmf)
    @other = users(:other)
  end    

  test "search interface" do
    log_in_as(@user)
    get root_path
    assert_select 'input[id="keyword"]'    
    
    # 無いものを検索
    get search_path, params: { keyword: "thisdoesntexist" } 
    assert_match "Users (0)", response.body
    assert_match "Microposts (0)", response.body
    
    # 検索結果画面でも検索できる
    assert_select 'input[id="keyword"]'    

    # あるものを検索
    get search_path, params: { keyword: @other.name } 
    assert_match "Users (1)", response.body
    assert_match "Microposts (0)", response.body
    
    get search_path, params: { keyword: "orange" } 
    assert_match "Users (0)", response.body
    assert_match "Microposts (1)", response.body
  end
end
