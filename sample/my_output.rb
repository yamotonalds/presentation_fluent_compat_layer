require './new/output'

class MyOutput < Output
  def shutdown
    puts 'MyOutput (既存Plugin)'
    #super
  end
end

