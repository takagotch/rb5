class Account
  def initialize(balance)
    @balance = balance
  end
  def debit(amt)
    if @balance < amt
      fail "txt"
    else
      @balance -= amt
    end
  end
end

