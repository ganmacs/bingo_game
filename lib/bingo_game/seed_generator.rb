module BingoGame
  class SeedGenerator
    def initialize(file_path: '.seed', limit: 90)
      @file_path = file_path
      @limit = limit
    end

    def generate
      File.open(@file_path, 'w') do |file|
        file.puts(seed)
      end
    end

    private

    def seed
      [*1..@limit].shuffle
    end
  end
end
