class Dragon
  attr_reader :name, :age # user cannot change it

  def initialize(name)
    @name = name
    @age = 0
    @hunger_level = 5 # 0-10, 10 being hungry, 0 being full
    @tiredness_level = 5 # 0-10, 10 is max tired, 0 being awake/energetic
    @happiness_level = 5  # 0-10, 10 being happy, 0 being sad
    @thirst_level = 5 # 0-1, 0 is thirsty, 10 is full
    @color = ["red", "blue", "rainbow", "green", "yellow", "pink", "white", "silver","gold"].sample
    @flying_ability = 0
  end

  # PUBLIC methods we can call on (they should be action verbs)
  def take_on_walk
    puts "\n* #{name} has a wonderful time on her walk, but it has worn her out."
    more_tired
    more_hungry
    more_thirsty
    more_happy
    if hungry?
      gets_hangry
    end
    if tired?
      falls_asleep
    end
  end

  def play
    puts "\n* You throw #{name} a ball and she retrieves it!
    She is so happy she starts talking to you!"
    more_hungry
    yell_at_human
    more_thirsty
    more_happy
    if thirsty?
      gets_thirsty
    end
  end

  def feed
    puts "\n* Yum!"
    more_happy
    less_hungry
    more_thirsty
  end

   def tuck_into_bed
    if @tiredness_level > 4
      puts "\n* zzzzz!"
      less_tired
      more_hungry
      more_thirsty
    else
      puts "\n* #{name} is not sleepy!"
      ignore
    end
    # this should subtract 5 from tiredness_level, or to 0
  end

  def drink
    puts "\n* slurp, slurp, slurp!"
    less_thirsty
  end

  def talk_to_dragon
    puts "\n* Dragons of different colors have different instinctual calls."
    yell_at_human
  end

  def practice_flying
    puts "\n* #{name} loves flying!"
    increase_flying_ability
    more_happy
    more_tired
    more_hungry
  end

  def ignore
    actions = ["eats your sofa.", "chases the mailman.", "gets stuck in the air vent.", "discovers a new passion for knitting.", "attempts to get the cookies from the top shelf on her own and falls.", "takes a bubble bath."]
    puts "\n* #{name} is very bored and #{actions.sample}"
    less_happy
  end

  def teach_dragon
    teach_arr = ["sing", "fly", "dance"]
    puts "\n* You teach #{@name} to #{teach_arr.sample}!"
    more_happy
  end

  def abandon
    puts "\n* You give your dragon to the local ASPCA."
    dragon_pic
    exit
  end

  def check_dragon
    puts "You check on #{@name}."

    check_stat("Happiness", @happiness_level, ["Overjoyed!", "Smiling", "Neutral", "Very bummed"])
    check_stat("Hunger", @hunger_level, ["Starving!", "Tummy rumbling", "Fine", "Stuffed!"])
    check_stat("Thirst", @thirst_level, ["Super hydrated", "Fine", "A bit parched", "Dehydrated!"])
    check_stat("Energy", @tiredness_level, ["Half-asleep", "Yawning a bit", "Pretty peppy", "Bouncing off the walls!"])

  end



  private

  def increase_flying_ability
    @flying_ability += 5
    if @flying_ability == 15
      less_hungry
      puts "\n* #{name} is getting better at flying!"
      puts "\n* She is so good that she uses her new ability to fly to a nearby farm and kill local lifestock."
    elsif @flying_ability == 25
      puts "\n* #{name} is excellent at flying!"
      puts "#{name} flies to the north and defeats the army of white walkers."
      puts "Then #{name} flies to the south and vanquishes the Lannisters."
      puts "You become Queen of the Seven Kingdoms."
      puts crown_pic
      exit
    end
  end

  def yell_at_human
    puts "\n* #{@name} is a #{@color} dragon and thus yells, "
    case @color
    when "red"
      puts "ROARRRR!"
    when "blue"
      puts "To be, or not to be?!"
    when "rainbow"
      puts "PURRRRRRRRRR"
    when "green"
      puts "nothing."
    when "yellow"
      puts "MEOWWW"
    when "pink"
      puts "LA LA LA LA LAAAA!!"
    when "white"
      puts "WOOF"
    when "silver"
      puts "AM I DEATH AND DESTRUCTION?"
    when "gold"
      puts "I shall sprinkle golden glitter EVERYWHERE!"
    else
      puts "HISSSS!"
    end
  end

  def more_happy
    if @happiness_level > 8
      @happiness_level = 10
    else
      @happiness_level += 2
    end
    if happy?
      is_really_happy
    end
  end

  def less_happy
    if @happiness_level < 2
      @happiness_level = 0
    else
      @happiness_level -=2
    end
  end

  def more_thirsty
    if @thirst_level < 2
      @thirst_level = 0
    else
      @thirst_level -= 1
    end
    if thirsty?
      gets_thirsty
    end
  end

  def less_thirsty
    if @thirst_level > 8
      @thirst_level = 10
    else
      @thirst_level += 2
    end
  end

  def more_tired
    if @tiredness_level > 8
      @tiredness_level = 10
    else
      @tiredness_level += 2
    end

    if @tiredness_level < 4
      less_happy
    end

    if tired?
      falls_asleep
    end
  end

  def less_tired
    if @tiredness_level < 2
      @tiredness_level = 0
    else
      @tiredness_level -= 2
    end
  end

  def more_hungry(level=2)
    if @hunger_level > (10 - level)
      @hunger_level = 10
    else
      @hunger_level += level
    end
    if hungry?
      gets_hangry
    end
    if @hunger_level < 4
      less_happy
    end
  end

  def less_hungry
    if @hunger_level < 2
      @hunger_level = 0
    else
      @hunger_level -= 2
    end
  end

  def check_stat(stat,variable,messages)
    print "*#{stat.capitalize}: "
    if variable > 7
      print messages[0]
    elsif variable > 5
      print messages[1] + "\n"
    elsif variable > 2
      print messages[2] + "\n"
    else
      print messages[3] + "\n"
    end
  end

  def falls_asleep
    puts "\n* Shhh... #{@name} fell asleep!"
    @tiredness_level -= 5
  end

  def gets_hangry
    puts "\n* OH NO! #{@name} is starving! She's HANGRY. #{@name} is going to eat you!"
    dragon_pic
    exit
  end

  def gets_thirsty
    puts "\n* #{@name} is TOO THIRSTY. She's turned to ash!"
    dragon_pic
    exit
  end

  def has_an_accident
    puts "\n* #{@name} has an accident. EW!"
  end

  def is_really_unhappy
    if @happiness_level <= 0
      puts "\n* #{@name} is miserable in your care."
      puts "\n* She leaves you for your ex."
      dragon_pic
      exit
    end
  end

  def is_really_happy
    puts "#{@name} is so happy she giggles fire!"
  end

  def happy?
    return @happiness_level == 10
  end

  def unhappy?
      return @happiness_level == 0
  end

  def hungry?
    return @hunger_level == 10
  end

  def thirsty?
    return @thirst_level == 0
  end

  def tired?
    return @tiredness_level == 10
  end

  def dragon_pic
    puts "Thanks for playing!
    ____ __
       { --.\\  |          .)%%%)%%
        '-._\\ | (\\___   %)%%(%%(%%%
            `\\|{/ ^ _)-%(%%%%)%%;%%%
        .'^^^^^^^  /`    %%)%%%%)%%%'
jgs     //\\   ) ,  /       '%%%%(%%'
 ,  _.'/  `\<-- \<
  `^^^`     ^^   ^^  "
  end

  def crown_pic
      puts " Thanks for playing!
       _.+._
      (^\/^\/^)
       \@*@*@/
      {_____} "
  end
end # end of the class

  ###############################
  ######## TEST CLASS ###########
  ##### Create Instances ########
  ### Run instance methods ######
  ###############################

  #Create a new Dragon
  # should be able to:
  puff = Dragon.new("Puff")
puts "Welcome to the dragon game!"
puts "

@@@@@@@@@@@@@@@@@@@@@**^^~~~~^@@^*@*@@**@@@@@@@@@@@
@@@@@@@@@@@@@*^^'~~   , - ' '; ,@@b. '  -e@@@@@@@@@
@@@@@@@@*^~~      . '     . ' ,@@@@(  e@*@@@@@@@@@@
@@@@@^~         .       .   ' @@@@@@, ~^@@@@@@@@@@@
@@@~ ,e**@@*e,  ,e**e, .    ' '@@@@@@e,  ~*@@@@@'^@
@',e@@@@@@@@@@ e@@@@@@       ' '*@@@@@@    @@@'   0
@@@@@@@@@@@@@@@@@@@@@',e,     ;  ~^*^'    ;^~   ' 0
@@@@@@@@@@@@@@@^~~^@@e@@@   .'           ,'   .'  @
@@@@@@@@@@@@@@'    '@@@@@ '         ,  ,e'  .    ;@
@@@@@@@@@@@@@' ,&&,  ^@*'     ,  .  i^~@e, ,e@e  @@
@@@@@@@@@@@@' ,@@@@,          ;  ,& !,,@@@e@@@@ e@@
@@@@@,~*@@*' ,@@@@@@e,   ',   e^~^@,   ~'@@@@@@,@@@
@@@@@@, ~~ ,e@@@@@@@@@*e*@*  ,@e  @@~~@e,,@@@@@@@@@
@@@@@@@@ee@@@@@@@@@@@@@@@~ ,e@' ,e@' e@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@~ ,@~ ,e@@e,,@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@~ ,@@@,,0@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@,,@@@@@@@@@@@@@@@@@@@@@@@@@
"
  dragon_is_alive = true

  while dragon_is_alive
    puts
    puts "Enter command: (check, play, feed, take on walk, drink, talk, tuck into bed, practice flying, teach, ignore, abandon)"
    input = gets.chomp.downcase
    case input
    when "check"
      puff.check_dragon
    when "play"
      puff.play
    when "feed"
      puff.feed
    when "take on walk"
      puff.take_on_walk
    when "drink"
      puff.drink
    when "talk"
      puff.talk_to_dragon
    when "tuck into bed"
      puff.tuck_into_bed
    when "practice flying"
      puff.practice_flying
    when "teach"
      puff.teach_dragon
    when "ignore"
      puff.ignore
    when "abandon"
      puff.abandon
    else
      puts "Invalid"
    end
  end
