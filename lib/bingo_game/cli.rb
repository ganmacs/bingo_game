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
        flipper.call
      end
    end

    private

    def seed_generator
      @seed_generator ||= SeedGenerator.new
    end

    def flipper
      @flipper ||= Flipper.new
    end
  end
end
