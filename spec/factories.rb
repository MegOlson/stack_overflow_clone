FactoryBot.define do
  factory(:user) do
    email('john@gmail.com')
    password('12345')
  end

  factory(:question) do
    question('What am I?')
    user_id(1)
  end

  factory(:answer) do
    response('A dog.')
    user_id(1)
    question_id(1)
  end
end
