class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status, :count
  def initialize(sender, receiver, amount)
    #status= "pending", "complete", "rejected", "reversed"
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  #reject a transfer if the accounts aren't valid
  #if the sender doesn't have the money
  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end
  def execute_transaction
    if @sender.balance < @amount || self.valid? == false
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
      puts "Transaction was already excuted"
    else
      @sender.deposit( @amount * -1 )
      @receiver.deposit( @amount )
      @status = "complete"
    end
  end
  def reverse_transfer
    if @status == "complete"
      @sender.deposit( @amount ) 
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end
  end
end