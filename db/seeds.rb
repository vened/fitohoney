require 'factory_girl_rails'

Admin.create(email: "maxstbn@gmail.com", password: "qwerty123", password_confirmation: "qwerty123")

@brand = Brand.create(title: 'Villa Ceramica')

6.times do
  category = FactoryGirl.create :category
  10.times do
    product = FactoryGirl.create :product
    property_color = FactoryGirl.build :property_color
    property_country = FactoryGirl.build :property_country
    property_width = FactoryGirl.build :property_width
    property_height = FactoryGirl.build :property_height
    product.properties << property_color
    product.properties << property_country
    product.properties << property_width
    product.properties << property_height
    # product.product_photos.create(photo: File.open(Rails.root.to_s + "/public/content/1.jpg"))
    product.product_photos.create(photo: File.open(Rails.root.to_s + "/public/content/2.jpg"))
    # product.product_photos.create(photo: File.open(Rails.root.to_s + "/public/content/3.jpg"))
    category.products << product
    @brand.products << product
  end
end

# 
# @cat = Category.create(title: 'Напольная плитка')
# @cat1 = Category.create(title: 'Плитка для ванной')
# @cat2 = Category.create(title: 'Плитка для кухни')
# 
# 4.times do
#   product = Product.create(
#       title: 'Voyage 30*60',
#       description: 'Компания "ДМ-Стайл" стремится шагать в ногу со временем и старается регулярно пополнять и обновлять 
#       свои коллекции керамической плитки. Одной из самых лучших наших находок стало раскрытие морской тематики в 
#       керамической коллекции "Vojage". Настенная плитка в светло-бежевых тонах с фоновым рисунком, имитирующим прибрежный
#       песок, выгодно подчеркнет изысканность вашей ванной комнаты.А декоративные вставки с изображением ракушек, морских 
#       звезд и гальки придадут помещению завершенный вид. Керамогранит глазурованный с ректификационной кромкой. Выпускается
#     в размерах: стена 300х600, пол 300х300, декоры ( два вида рисунка )',
#       price: 1600,
#       category_id: @cat.id                 
#   )
#   product.product_photos.create(photo: File.open(Rails.root.to_s + "/public/content/1.jpg"))
#   product.product_photos.create(photo: File.open(Rails.root.to_s + "/public/content/2.jpg"))
#   product.product_photos.create(photo: File.open(Rails.root.to_s + "/public/content/3.jpg"))
# end


Carousel.create(
    title: 'Коллекция Glamour 300*600',
    description: 'Коллекция керамической плитки Glamour от VILLA CERAMICA создана для ванных комнат. 
              Чёрно-белая, монохромная гамма коллекции в 
              совокупности со стеклянной мозаикой тех же оттенков создаёт действительно потрясающий эффект.',
    path: '',
    photo: File.open(Rails.root.to_s + "/public/content/carousel-1.jpg")
)
Carousel.create(
    title: 'Коллекция Elysse 300*600',
    description: 'Плитка из коллекции "ELYSSE" предназначена для оформления дорогих и изысканных помещений.
              Она идеально подойдёт как для ванных комнат так и для гостинных и прихожих.',
    path: '',
    photo: File.open(Rails.root.to_s + "/public/content/carousel-2.jpg")
)
