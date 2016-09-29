require 'io/console'

module LocalScript
  def self.non_enter_input(end_word = 'exit', &block)
    command = ''
    until command =~ /#{end_word}$/
      c = STDIN.getch
      command << c
      yield(c, command)
    end
  end
end
