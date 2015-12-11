require 'thread'
require 'bingo_game/seed_generator'
require 'bingo_game/flipper'

module BingoGame
  class Cli
    def initialize(args)
      @args = args
    end

    def call
      case @args.first
      when 'seed'
        seed_generator.generate
        puts 'Success'
      else
        shutto_suruyatu
        flipper.call
      end
    end

    private

    def shutto_suruyatu
      t = Thread.start {
        loop { random_number }
      }

      gets.chomp                # stop roulette by any key
      Thread.kill(t)
      printf "\e[2A"
    end

    def random_number
      [*0..90].shuffle.each do |num|
        puts "#{num}"
        sleep 0.05
        printf "\e[1A"
      end
    end

    def seed_generator
      @seed_generator ||= SeedGenerator.new
    end

    def flipper
      @flipper ||= Flipper.new
    end
  end
end
