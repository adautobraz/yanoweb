# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170917223152) do

  create_table "atendimentos", force: :cascade do |t|
    t.boolean  "particular"
    t.date     "data"
    t.time     "horario"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "paciente_id"
    t.integer  "medico_id"
  end

  create_table "disponibilidades", force: :cascade do |t|
    t.date     "date"
    t.time     "horario_inicial"
    t.time     "horario_final"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "medico_id"
  end

  create_table "medicos", force: :cascade do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "email"
    t.date     "data_nascimento"
    t.string   "endereco"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "estado"
    t.string   "crm"
    t.string   "especialidade"
    t.string   "local_trabalho"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "pacientes", force: :cascade do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "email"
    t.date     "data_nascimento"
    t.string   "endereco"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "estado"
    t.string   "plano_de_saude"
    t.string   "num_registro"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
