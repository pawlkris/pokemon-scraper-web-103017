class Pokemon

  attr_accessor :name, :type, :db, :hp
  attr_reader :id

  def initialize(pokemon_hash)
    @name = pokemon_hash[:name]
    @type = pokemon_hash[:type]
    @db = pokemon_hash[:db]
    @id = pokemon_hash[:id]
    @hp = pokemon_hash[:hp]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}')")
  end

  def self.find(index, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = '#{index}'").flatten
    poke_hash = Hash.new
    poke_hash[:id] = poke[0]
    poke_hash[:name] = poke[1]
    poke_hash[:type] = poke[2]
    poke_hash[:db] = db
    poke_hash[:hp] = poke[3]
    Pokemon.new(poke_hash)
  end

  def alter_hp(points, db)
    db.execute("UPDATE pokemon SET hp = #{points} WHERE id = #{self.id}")
  end





end
