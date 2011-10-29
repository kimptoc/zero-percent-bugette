require 'active_support/concern'
require 'active_support/callbacks'

module ActiveSupport
  module Testing
    module SetupAndTeardown

      module ForMiniTest
        def run(runner)
          puts "ForMinitTest"
          result = '.'
          begin
            run_callbacks :setup do
              result = super
            end
          rescue Exception => e
            result = runner.puke(self.class, method_name, e)
          ensure
            begin
              run_callbacks :teardown
            rescue Exception => e
              result = runner.puke(self.class, method_name, e)
            end
          end
          result
        end
      end


      module ForClassicTestUnit
        # This redefinition is unfortunate but test/unit shows us no alternative.
        # Doubly unfortunate: hax to support Mocha's hax.
        def run(result)
          puts "ForClassicTestUnit"

          return if @method_name.to_s == "default_test"

          mocha_counter = retrieve_mocha_counter(result)
          yield(Test::Unit::TestCase::STARTED, name)
          @_result = result

          begin
            begin
              _run_setup_callbacks do
                setup
                __send__(@method_name)
                mocha_verify(mocha_counter) if mocha_counter
              end
            result.add_pass
            rescue Mocha::ExpectationError => e
              add_failure(e.message, e.backtrace)
            rescue Test::Unit::AssertionFailedError => e
              add_failure(e.message, e.backtrace)
            rescue Exception => e
              raise if PASSTHROUGH_EXCEPTIONS.include?(e.class)
              add_error(e)
            ensure
              begin
                teardown
                _run_teardown_callbacks
              rescue Test::Unit::AssertionFailedError => e
                add_failure(e.message, e.backtrace)
              rescue Exception => e
                raise if PASSTHROUGH_EXCEPTIONS.include?(e.class)
                add_error(e)
              end
            end
          ensure
            mocha_teardown if mocha_counter
          end

          result.add_run
          yield(Test::Unit::TestCase::FINISHED, name)
        end
      end
    end
  end
end