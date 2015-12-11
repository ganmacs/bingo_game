module BingoGame
  class Flipper
    def initialize(file_path = '.seed')
      @file_path = file_path
    end

    def call
      if finish?
        puts 'Bingo game is over. Go Home!!!'
      else
        n = loaded_seed.first
        update_seed
        store_seed(n)
        puts n
      end
    end

    private

    def store_seed(n)
      File.open('.cards', 'a') do |file|
        file.puts(n)
      end
    end

    def update_seed
      File.open(@file_path, 'w') do |file|
        file.puts(loaded_seed.drop(1))
      end
    end

    def finish?
      loaded_seed.size <= 0
    end

    def loaded_seed
      @loaded_seed ||= File.open(@file_path).map(&:strip)
    end
  end
end
