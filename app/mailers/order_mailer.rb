class OrderMailer < ApplicationMailer

  def new_order(order)
    @order = order
    @url = 'http://fitohoney.ru'
    @order.order_items.each do | item |
      attachments[item.photo] = File.read(Rails.root.to_s + "/public#{item.photo}")
    end

    mail(to: 'maxstbn@yandex.ru', subject: "Новый заказ #{@order.number} на сайте fitohoney.ru")
  end

  def confirm_order(order)
    @order = order
    @url = 'http://fitohoney.ru'
    @order.order_items.each do | item |
      attachments[item.photo] = File.read(Rails.root.to_s + "/public#{item.photo}")
    end

    mail(to: @order.email, subject: 'Вы успешно оформили заказа на сайте santemax.ru')
  end

end
