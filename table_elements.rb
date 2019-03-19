# encoding: utf-8
# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Подключим библиотеку json
require 'json'

# Прочитаем таблицу элементов в ассоциативный массив
file = File.read("#{__dir__}/data/table_elements.json", encoding: 'UTF-8')
elements = JSON.parse(file)

# Напишем пользователю, какие элементы у нас есть
puts "У нас всего элементов: #{elements.keys.size}"
puts elements.keys.join(', ')

# Спросим пользователя, о каком элементе он хочет узнать
puts 'О каком элементе хотите узнать?'
element = gets.chomp

# Если такой элемент есть в нашем хэше, покажем информацию о нём
if elements.key?(element)
  puts("Порядковый номер: #{elements[element]["number"]}")
  puts("Название: #{elements[element]["name"]}")
  puts("Первооткрыватель: #{elements[element]["discoverer"]} (#{elements[element]["year"]})")
  puts("Плотность: #{elements[element]["density"]} г/см³")
else
  puts 'Об этом история умалчивает... Спросите что-нибудь попроще.'
end
