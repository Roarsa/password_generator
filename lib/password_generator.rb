require "password_generator/version"

class Password_Generator

  CONSONANT_LETTERS = "bcdfghjklmnprstvwxz".chars.to_a + 
                                 ['bh','bl','br','ch','cl','cr','cy','cr','dw','dy','fl',
                                 'fr','gh','gl','gn','gr','gw','kn','kr','kw','ky','ly',
                                 'mc','mn','mr','ph','pl','pn','pr','ps','py', 'rh','ry',
                                 'sc','sh','sk','sl','sm','sn','sp','st','sv','sw','sy',
                                 'th','tr','ts','tw','ty','vr','vy','wh','wr','wy']
  VOWELS_LETTERS = "aeiou".chars.to_a

  def generate(password_length = 12, uppercase = true, num_length = 3)
    raise "Number length must be integer." if num_length.class != Integer
    raise "Password length must be integer." if password_length.class != Integer
    raise "Password length can't be 0 negative." if password_length <= 0
    raise "The number of digits can't be longer than the password." if num_length > password_length
    raise "The value of uppercase must be true or false." if uppercase != (true || false)

    password = VOWELS_LETTERS[rand(VOWELS_LETTERS.size)]

    while password.size < password_length-num_length do
      flag = uppercase ? rand(0..1) : 0
      password += 
      if CONSONANT_LETTERS.include?(password[password.size-1].downcase)
        symbol_generator(VOWELS_LETTERS[rand(VOWELS_LETTERS.size)],flag)
      else 
        symbol_generator(CONSONANT_LETTERS[rand(CONSONANT_LETTERS.size)],flag)
      end
    end

    password = password[0...password_length-num_length]

    if num_length != 0
      (0..num_length).each do
        password += rand(9).to_s
      end
    end

    return password
  end

  private

  def symbol_generator(letters, flag)
    if flag == 1
      letters.capitalize
    else
      letters 
    end
  end
end
