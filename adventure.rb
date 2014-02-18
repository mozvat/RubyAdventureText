# Ruby Sample program scabbed the basics from www.sapphiresteel.com 
# then extended the code base.

# illustrates how to creating descendent objects
# reading and writing attributes
# object (instance) variables
# class variables

	# Thing
    class Thing
      # class variable to count the number of 'things'
      @@num_things = 0 
      
      attr_accessor( :description )
      attr_reader( :name )
      
      def initialize( aName, aDescription )
        @name         = aName
        @description  = aDescription
        @@num_things +=1  # increment @@num_things
      end
      
      # to_s should be used as a 'Look at @name
      # override default to_s method
      def to_s 
        return "The #{@name} is #{@description}"
      end
      
      def count
        return "There are #{@@num_things} [Thing] objects in this game"
      end      
    end
    
  # Non-Player Characters
  class NPC < Thing
    @@num_NPCs = 0 
    def initialize( aName, aDescription )
      super(aName, aDescription)
    end
  end  
  
  # Player Characters
  class PC < Thing
    def initialize( aName, aDescription )
      super(aName, aDescription)
    end
  end 
    
  # Room
      class Room < Thing
        attr_accessor(:name, :description, :exits, :items)  
        def initialize( aName, aDescription )
          super(aName, aDescription)
        end
        
        def to_s 
          return "The[#{@name}]\n is #{@description}"
        end
                        
        def AddItems ( aItems )
          @items = aItems          
        end
        
        def AddExits ( aExits )
          @exits = aExits
        end
      end

	# Treasure
    class Treasure < Thing
      attr_reader :value
      attr_writer :value
      
      def initialize( aName, aDescription, aValue )
          super( aName, aDescription )
          @value = aValue
      end
    end
    
    
    # Map
    class Map 
	  # @rooms will be an array - an ordered list 
	  # of Room objects
      def initialize( someRooms )
        @rooms = someRooms
      end
      
      # The to_s method iterates over all the Room objects in @rooms
      # and prints information on each. We'll come back to look at the
      # implementation of this method later on
      def to_s
        @rooms.each {
          |a_room|
          puts(a_room)          
        }
      end    
    end
    
    # Launch game
    class Launch
    
    end

  #Program start
  print "\n\n****************************************************"
  print "\n*                                                  *"
  print "\n*                                                  *"
  print "\n*                Adventure Text                    *"
  print "\n*                                                  *"
  print "\n*                                                  *"
  print "\n****************************************************\n\n"  
  # First create and populate the starting objects
  #   Create the treasures
  t1 = Treasure.new("Hammer", "a Dwarven weapon forged of gold",800)
  t2 = Treasure.new("Flask", "a container full of glowing dragon's blood", 550)
  #   Create the room name and descriptions
  room1 = Room.new("Crystal Grotto", "a glittery cavern")
  room2 = Room.new("Dark Cave", "a gloomy hole in the rocks")
  room3 = Room.new("Forest Glade", "a verdant clearing filled with shimmering light")
  room4 = Room.new("Quiet riverfront", "a slow moving shallow river")
  #   Construct the map
  exits = {'North'=>room1, 'East'=>room2}
  room1.AddExits(exits)
  #   populate the room's initial items 
  items = {'Sword'=>t1, 'Flask'=>t2}
  room1.AddItems(items)
  #   Map - which is an array containing the Rooms just created 
  mymap = Map.new([room1,room2,room3, room4])
  
  avatar = PC.new("Fiacre", "Dark Elf Cleric")
  
  print "\n\nGreetings adventurer. Your eyes are closed and your uncomfortably laying on the ground. You slowly gather your senses and open your eyes. Type [Look or L] to look around your surroundings.\n\n"
  
  action = ""
  quitKey = "Q"
  ictr = 0
  while action != quitKey  do     
     print "Action: " 
     action = gets().chomp() 
     if(action == "L")
       puts "#{room1.to_s} \nExits[#{room1.exits}]"
     end
     if(action == "Y")
       puts "Fiacre inhales and screams to the heavens!"
     end
  end
  
  #Show the 
  
  # room1.
  
  # Now let's take a look at what we've got...
  # 
  # puts "\nLet's try out the Thing.to_s method..."
  # puts "Yup, treasure 2 is #{t2.to_s}"
  # puts "\nNow let's see how our attribute accessors work"
  # puts "We'll evaluate this:"
  # puts 't1 name=#{t1.name}, description=#{t1.description}, value=#{t1.value}'
  # puts "t1 name=#{t1.name}, description=#{t1.description}, value=#{t1.value}"
  # puts "\nNow we'll assign 100 to t1.value and alter t1.description..."
  # t1.value = 100
  # t1.description << " (now somewhat tarnished)" # note << appends specified string to existing string
  # puts "t1 (NOW) name=#{t1.name}, description=#{t1.description}, value=#{t1.value}"
  # puts "\nLet's take a look at room1..."
  #puts "room1 name=#{room1.name}, description=#{room1.description}"
  # puts "\nAnd the map..."
  # puts "mymap = #{mymap.to_s}"
  # puts "\nFinally, let's check how many Thing objects we've created..."
  # puts( t1.show_classvars )
 
 # As an exercise, try adding a class variable to the Map class to maintain
 # a count of the total number of rooms that have been created