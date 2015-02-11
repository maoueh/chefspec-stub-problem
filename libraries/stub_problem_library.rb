class Chef
  class Recipe
    class StubProblem
      def self.query
        query = Mixlib::ShellOut.new("impossible_command_to_stub")
        query.run_command
        query.error!

        query.stdout
      end
    end
  end
end
