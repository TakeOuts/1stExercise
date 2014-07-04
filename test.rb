# coding: utf-8
#!/usr/bin/env ruby

# Задание:
# 1. Реализовать Ruby скрипт, который будет преобразовывать входящую 
# строку следующим образом: строка - латинские буквы, каждая буква 
# замещается другой линейным сдвигом по алфавиту. Размер сдвига - один из 
# входящих параметров. Например: ace, 1 -> bdf.

# Задание расширено следующим функционалом:
# 1. Если буква была строчной, то строчной она и остается. С заглавной так же.
# 2. Нельзя сдвигать: специальные символы и числа. Т.е они остаются в исходном виде.
# 3. Программа разделяется на 2 этапа: ввод строки для преобразования и величины сдвига. Каждый из этих этапов зациклен (пока пользователь не введет корректные данные).
# 4. Величина сдвига может быть как положительной, так и отрицательной.
# 5. Предусмотрена возможность кругового сдвига (z, 1 -> a)

# Контроль входных данных:
# 1. Нельзя вводить пустые строки
# 2. В качестве величины сдвига нельзя выбрать вещественное число, букву, спец. символ или пустую строку.

# Бесконечный цикл, который может прервать только корректный ввод данных
loop do
  puts "Введите строку для сдвига: "
  # Переменная @text объявлена как переменная экземпляра
  @text = gets.chomp
  # Если введенный текст не является пустой строкой, то выходим из цикла
  unless @text.empty?
    break
  # В противном случае выводим сообщение об ошибке
  else
    puts "Введена пустая строка"
  end
end

# Бесконечный цикл, который может прервать только корректный ввод данных
loop do
  puts "Величина сдвига: "
  # Возможная ошибка, которая появится при парсинге целочисленного значения будет будет перехвачена с помощью rescue.
  space = Integer(gets) rescue nil
  # В случае успешного парсинга
  unless space.nil?
    # Побитово осуществляем анализ входной строки
    @text.each_byte do |i|
      # Если текущий симол является буквой, то осуществляем сдвиг. В противном случае оставляем всё как есть.
      # Функция Fixnum#chr преобразует любое число в ASCII
      unless (/[A-Za-z]/.match i.chr).nil?
        # Если это заглавная буква
        unless (/[A-Z]/.match i.chr).nil?
          if space >= 0            
            print 'Z'.ord - i - space + 1 >= 0 ? (i+space).chr : ('A'.ord - ('Z'.ord - i - space + 1)).chr
          else
            print i - 'A'.ord + space + 1 > 0 ? (i+space).chr : ('Z'.ord + (i - 'A'.ord + space + 1)).chr
          end
        # Если это строчная буква
        else
          if space >= 0
            print 'z'.ord - i - space + 1 >= 0 ? (i+space).chr : ('a'.ord - ('z'.ord - i - space + 1)).chr
          else
            print i - 'a'.ord + space + 1 > 0 ? (i+space).chr : ('z'.ord + (i - 'a'.ord + space + 1)).chr
          end
        end
      else
        print i.chr
      end
    end
    break
  end
end
