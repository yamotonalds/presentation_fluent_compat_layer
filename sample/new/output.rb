module Plugin
  class Output
    def shutdown
      puts 'Plugin::Output (新クラス)'
    end
  end
end

require './new/compat_output'
Output = Compat::Output

