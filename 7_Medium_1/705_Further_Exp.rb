class InvalidCommand < StandardError
  def initialize(failed_command)
    @failed_command = failed_command
  end
  
  def message
    "Invalid token: " + @failed_command
  end
end

class StackEmpty < StandardError
  def message
    "Empty stack!"
  end
end

class Minilang
  VALID_COMMANDS = ['ADD', 'SUB', 'MULT', 'DIV', 'MOD', 'PUSH', 'POP', 'PRINT']
  
  def initialize(program)
    @program = program
    @register = 0
    @stack = []
  end
  
  def eval
    begin
      @program.split(' ').each do |command|
        case command
        when is_num?(command) then @register = command.to_i
        when 'ADD'            then add
        when 'SUB'            then subtract
        when 'MULT'           then multiply
        when 'DIV'            then divide
        when 'MOD'            then modulus
        when 'PUSH'           then push
        when 'POP'            then pop
        when 'PRINT'          then prints
        else                  raise InvalidCommand.new(command)
        end
      end
    rescue InvalidCommand => e
      puts e.message
    rescue StackEmpty => e
      puts e.message
    end
  end
  
  private
  
  def is_num?(command)
    return command if command.to_i != 0 || command == '0'
  end
  
  def is_invalid?(command)
    return command if !VALID_COMMANDS.include?(command)
    false
  end
  
  def add
    @register += @stack.pop
  end
  
  def subtract
    @register -= @stack.pop
  end
  
  def multiply
    @register *= @stack.pop
  end
  
  def divide
    @register /= @stack.pop
  end
  
  def modulus
    @register %= @stack.pop
  end
  
  def push
    @stack.push(@register)
  end
  
  def pop
    if @stack.empty?
      raise StackEmpty.new
    else
      @register = @stack.pop
    end
  end
  
  def prints
    puts @register
  end
end



Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)

CENTIGRADE_TO_FAHRENHEIT =
  '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
Minilang.new(format(CENTIGRADE_TO_FAHRENHEIT, degrees_c: 100)).eval
# 212
Minilang.new(format(CENTIGRADE_TO_FAHRENHEIT, degrees_c: 0)).eval
# 32
Minilang.new(format(CENTIGRADE_TO_FAHRENHEIT, degrees_c: -40)).eval
# -40

minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
minilang.eval(degrees_c: 100)
# 212
minilang.eval(degrees_c: 0)
# 32
minilang.eval(degrees_c: -40)
# -40