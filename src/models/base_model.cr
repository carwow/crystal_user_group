class BaseModel

  def self.all
    DB.exec("select * from #{self.table_name}").to_hash
  end

  def self.table_name
    raise "No table name found. this method must be overriden by all models"
  end
end