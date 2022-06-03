require "test_helper"

class MessagesTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:fmf)
    @other = users(:other)
  end

  test "message interface" do
    log_in_as(@user)

    # 無効な送信
    assert_no_difference 'Message.count' do
      post messages_path, params: { message: { to_id: @other.id, body: "" } }
    end

    assert_select 'textarea'
    
    # 有効な送信
    content = "hola 123"
    assert_difference 'Message.count', 1 do
      post messages_path, params: { message: { to_id: @other.id, body: content } }
    end
    assert_redirected_to messages_sent_url
    follow_redirect!
    assert_match @other.name, response.body
    assert_match content, response.body

    # 受信した側の確認
    log_in_as(@other)
    get messages_received_url
    assert_match @user.name, response.body
    assert_match content, response.body

  end

end
