class HashMap
  attr_accessor :size

  def initialize 
    @load_factor = 0.75
    @capacity = 16
    @size = 0
    @buckets = Array.new(@capacity) { [] }
  end

  def hash(key)
    hash_code = 0 
    prime_num = 31
    key.to_s.each_char { |char| hash_code = prime_num * hash_code + char.ord }
    hash_code
  end

  def get_index(key)
    index = hash(key) % @capacity
    raise IndexError if index.negative? || index >= @buckets.length
    index
  end

  def set(key, value)
    grow if @size >= @capacity * @load_factor
      
    index = get_index(key)
    bucket = @buckets[index]

    bucket.each do |pair|
      if pair[0] == key
        pair[1] = value
        return
      end
    end

    bucket << [key, value]
    @size += 1
  end

  def get(key)
    index = get_index(key)
    @buckets[index].each { |k, v| return v if k == key }
    nil
  end

  def has?(key)
    !get(key).nil?
  end

  def remove(key)
    index = get_index(key)
    bucket = @buckets[index]

    bucket.each_with_index do |pair, i|
      if pair[0] == key
        @size -= 1
        return bucket.delete_at(i)[1]
      end
    end
    nil
  end

  def length
    @size
  end

  def clear
    @capacity = 16
    @size = 0
    @buckets = Array.new(@capacity) { [] }
  end

  def keys
    entries.map { |pair| pair[0] }
  end

  def values
    entries.map { |pair| pair[1] }
  end

  def entries
    all_entries = []
    @buckets.each do |bucket|
      bucket.each { |pair| all_entries << pair }
    end
    all_entries
  end

  private

  def grow
    current_entries = entries
    @capacity *= 2
    @size = 0
    @buckets = Array.new(@capacity) { [] }

    current_entries.each { |key, value| set(key, value) }
  end
end