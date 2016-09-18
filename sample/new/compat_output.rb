module Compat
  class Output < Plugin::Output
    def initialize
      super
      self.class.prepend CallSuperMixin
    end

    def shutdown; super; end
  end

  module CallSuperMixin
    def self.prepended(klass)
      p klass.ancestors
      c = klass.ancestors[2..-1].find { |m| m.method_defined?(:shutdown) }
      @@super_method = c.instance_method(:shutdown)
    end

    def shutdown
      super
      @@super_method.bind(self).call
    end
  end
end

