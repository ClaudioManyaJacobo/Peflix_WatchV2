# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_11_14_220034) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "actors", force: :cascade do |t|
    t.string "name"
    t.string "url_actor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "actors_peliculas", id: false, force: :cascade do |t|
    t.bigint "actor_id", null: false
    t.bigint "pelicula_id", null: false
    t.index ["actor_id", "pelicula_id"], name: "index_actors_peliculas_on_actor_id_and_pelicula_id"
    t.index ["pelicula_id", "actor_id"], name: "index_actors_peliculas_on_pelicula_id_and_actor_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "pelicula_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pelicula_id"], name: "index_comments_on_pelicula_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "generos", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "generos_peliculas", id: false, force: :cascade do |t|
    t.bigint "genero_id", null: false
    t.bigint "pelicula_id", null: false
    t.index ["genero_id", "pelicula_id"], name: "index_generos_peliculas_on_genero_id_and_pelicula_id"
    t.index ["pelicula_id", "genero_id"], name: "index_generos_peliculas_on_pelicula_id_and_genero_id"
  end

  create_table "peliculas", force: :cascade do |t|
    t.string "titulo"
    t.integer "anio"
    t.text "sinopsis"
    t.integer "duracion"
    t.string "director"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "foto"
    t.string "video"
  end

  create_table "peliculas_plataforms", id: false, force: :cascade do |t|
    t.bigint "plataform_id", null: false
    t.bigint "pelicula_id", null: false
    t.index ["pelicula_id", "plataform_id"], name: "index_peliculas_plataforms_on_pelicula_id_and_plataform_id"
    t.index ["plataform_id", "pelicula_id"], name: "index_peliculas_plataforms_on_plataform_id_and_pelicula_id"
  end

  create_table "plataforms", force: :cascade do |t|
    t.string "name_p"
    t.string "url_p"
    t.string "tipo_p"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "pelicula_id", null: false
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pelicula_id"], name: "index_ratings_on_pelicula_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "peliculas"
  add_foreign_key "comments", "users"
  add_foreign_key "ratings", "peliculas"
  add_foreign_key "ratings", "users"
end
