require "exception_cop/version"

module ExceptionCop
  class << self
    attr_accessor :white_list

    def configure
      yield self
      ENV['EXCEPTION_WHITE_LIST'] = white_list.to_s
      override_kernel_raise unless white_list.empty?
    end

    def reset
      ExceptionCop.configure do |config|
        config.white_list = []
      end
    end

    private
    def override_kernel_raise
      Object.class_eval do
        def raise(*args)
          exception_arg = (args.first.is_a?(String)||args.first.nil?) ? RuntimeError : args.first
          instance_eval(ENV['EXCEPTION_WHITE_LIST']).include?(exception_arg) ? nil : Kernel.raise(*args)
        end
      end
    end
  end

end

ExceptionCop.reset
