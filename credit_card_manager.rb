# Define a class to represent a credit card account
class CreditCard
  attr_accessor :number, :balance

  def initialize(number)
    @number = number
    @balance = 0
  end

  def charge(amount)
    @balance += amount
  end

  def credit(amount)
    @balance -= amount
  end
end

# Define a class to manage credit card operations
class CreditCardManager
  def initialize
    @accounts = {}
  end

  def add_account(number)
    @accounts[number] = CreditCard.new(number)
  end

  def process_operation(operation)
    operation_type, number, amount = operation.split(' ')
    case operation_type
    when 'Add'
      add_account(number)
    when 'Charge'
      @accounts[number].charge(amount.to_f)
    when 'Credit'
      @accounts[number].credit(amount.to_f)
    end
  end

  def display_summary
    @accounts.each do |number, card|
      puts "Card Number: #{number}, Balance: $#{'%.2f' % card.balance}"
    end
  end
end

# Main program logic
def main
  manager = CreditCardManager.new

  # Read input from file or STDIN
  input = ARGF.read

  # Process each operation
  input.each_line do |line|
    manager.process_operation(line.strip)
  end

  # Display summary information
  manager.display_summary
end

# Entry point of the program
main if __FILE__ == $PROGRAM_NAME
