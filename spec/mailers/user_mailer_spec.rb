require "spec_helper"

describe UserMailer do

  let(:user) { create_user(:email => 'peter@example.com', token: SecureRandom.uuid) }
  let(:mail) { UserMailer.forgot_password_email(user) }

  it "email has the correct text" do
    email_text = mail.text_part.body.to_s
    expected = <<-INPUT.chomp
I see you have forgotten your password, peter@example.com. Here is a token to reset it
    INPUT
    expect(email_text).to start_with(expected)
  end

  it 'renders the subject' do
    expect(mail.subject).to eq("Reset Your Drank Password")
  end

  it 'renders the receiver email in the TO field' do
    expect(mail.to).to eq([user.email])
  end

  it 'renders the sender email in the FROM field' do
    expect(mail.from).to eq(["password@drank.com"])
  end

  it 'delivers the mail' do
    mail.deliver
    expect(UserMailer.deliveries.length).to eq(1)
  end

end