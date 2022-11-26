class PostMailer < ApplicationMailer

  def send_mail(post)
    @post = post

    mail(
      subject: '投稿確認メールです。',
      to: @post.user.email
    )
  end
end
