# frozen_string_literal: true

require "sequel"

DB = Sequel.connect adapter: "postgres",
                    host: ENV.delete("DATABASE_HOST") || "localhost",
                    database: ENV.delete("DATABASE_NAME"),
                    user: ENV.delete("DATABASE_USER"),
                    password: ENV.delete("DATABASE_PASSWORD")
DB.extension(:pg_array, :pg_json)
