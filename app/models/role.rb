class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    # self.auditions.map{|audition| audition.actor}
    self.auditions.pluck(:actor)
  end

  def locations
    # self.auditions.map{|audition| audition.location}
    self.auditions.pluck(:location)
  end

  def lead
    # look at all audititons for role, if any have hired value as true, return that audition
    # if none have a value of true return 'no actor has been hired for this role'
    audition = self.auditions.find{|audition| audition.hired }
    if audition
        audition
    else
        'no actor has been hired for this role'
    end
  end

  def understudy
    # look at all auditions for this role, and see if 2 actors have been hired, if so return the second actor
    # if there is not a second actor hired, return 'no actor has been hired for understudy for this role'

    auditions = self.auditions.filter{|audition| audition.hired}
    
    # if auditions.length >= 2
    if auditions[1]
        auditions[1]
    else
        'no actor has been hired for understudy for this role'
    end


  end
end