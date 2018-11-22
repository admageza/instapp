class PostMailer < ApplicationMailer
   def post_mail(emailu)
     
      mail to: emailu, subject: "confirmation  of new Post"
   end
end
