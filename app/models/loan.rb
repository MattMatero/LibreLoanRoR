class Loan < ActiveRecord::Base


  def self.isLoaned(book,id)
    all_loans = Loan.where(book_id: book)
    loaned = false
    all_loans.each do |loan|
      if loan.owner_id == id.to_s
        loaned = true
      end
    end
    loaned
  end
end
