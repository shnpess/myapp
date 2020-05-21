json.array! @messages do |message|
  json.content message.content
  json.created_at message.created_at.strftime("%Y年%m月%d日 %H時%M分")
  json.user_name message.user.nickname
  json.message_id message.id
  json.current_user_id current_user.id
  json.id message.user_id
  json.picture message.user.picture.url
end