class BaseModel

  def self.all
    self.from_rs(DATABASE.query("SELECT #{self.schema.keys.join(", ")} FROM #{self.table_name}"))
  end

  def self.table_name
    raise "No table name found. this method must be overriden by all models"
  end

  def self.schema
    raise "No schema defined. this method must be overriden by all models"
  end

end