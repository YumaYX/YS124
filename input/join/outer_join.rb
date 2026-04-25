users = [
  { id: 1, name: 'Alice' },
  { id: 2, name: 'Bob' },
  { id: 3, name: 'Charlie' }
]

posts = [
  { id: 1, user_id: 1, title: 'Post 1' },
  { id: 2, user_id: 2, title: 'Post 2' }
]

users.map do |user|
  post = posts.find { |p| p[:user_id] == user[:id] }
  user.merge(post || { title: nil })
end
