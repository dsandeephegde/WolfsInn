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

ActiveRecord::Schema.define(version: 0) do

  create_table "Buys", primary_key: ["serviceId", "checkinId"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "serviceId", default: 0, null: false
    t.integer "checkinId", default: 0, null: false
    t.integer "price", null: false
    t.index ["checkinId"], name: "c_buys_fk1"
  end

  create_table "Checkins", primary_key: "checkinId", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.date "startDate", null: false
    t.date "endDate", null: false
    t.time "checkinTime", null: false
    t.time "checkoutTime"
    t.integer "numberOfGuests", null: false
    t.integer "total"
    t.integer "customerId", null: false
    t.integer "hotelId", null: false
    t.integer "roomNumber", null: false
    t.integer "paymentId", null: false
    t.index ["customerId"], name: "c_checkins_fk1"
    t.index ["endDate"], name: "checkinEndDateIndex"
    t.index ["hotelId", "roomNumber"], name: "c_checkins_fk2"
    t.index ["paymentId"], name: "c_checkins_fk3"
  end

  create_table "Customers", primary_key: "customerId", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 50, null: false
    t.date "dateOfBirth"
    t.string "phoneNumber", limit: 10, null: false
    t.string "email", limit: 60
  end

  create_table "Hotels", primary_key: "hotelId", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "Name", limit: 100, null: false
    t.string "Address", null: false
    t.string "City", limit: 50, null: false
    t.string "State", limit: 50, null: false
    t.string "Country", limit: 50, null: false
    t.string "phoneNumber", limit: 10, null: false
    t.integer "managerId"
    t.index ["City"], name: "hotelCityIndex"
    t.index ["managerId"], name: "managerId", unique: true
  end

  create_table "PaymentInfo", primary_key: "paymentId", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "SSN", limit: 10
    t.string "billingAddress", null: false
    t.string "City", limit: 50, null: false
    t.string "State", limit: 50, null: false
    t.string "Country", limit: 50, null: false
    t.string "paymentMethod", limit: 15, null: false
    t.string "cardNumber", limit: 16
    t.integer "customerId", null: false
    t.index ["customerId"], name: "c_paymentinfo_fk"
  end

  create_table "RoomPrices", primary_key: ["category", "maxOccupancy"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "category", limit: 50, default: "", null: false
    t.integer "maxOccupancy", default: 0, null: false
    t.integer "price", null: false
  end

  create_table "Rooms", primary_key: ["roomNumber", "hotelId"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "roomNumber", default: 0, null: false
    t.integer "hotelId", default: 0, null: false
    t.string "category", limit: 50, null: false
    t.integer "maxOccupancy", null: false
    t.boolean "availability", null: false
    t.index ["category", "maxOccupancy"], name: "c_rooms_fk2"
    t.index ["hotelId"], name: "c_rooms_fk1"
  end

  create_table "Serves", primary_key: ["staffId", "checkinId"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "staffId", default: 0, null: false
    t.integer "checkinId", default: 0, null: false
    t.index ["checkinId"], name: "c_serves_fk1"
  end

  create_table "Services", primary_key: "serviceId", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 50, null: false
    t.integer "basePrice", null: false
  end

  create_table "Staff", primary_key: "staffId", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 50, null: false
    t.integer "age"
    t.string "jobTitle", limit: 50, null: false
    t.string "phoneNumber", limit: 10, null: false
    t.string "address"
    t.string "City", limit: 50
    t.string "State", limit: 50
    t.string "Country", limit: 50
    t.integer "hotelId"
    t.index ["hotelId"], name: "c_staff_fk"
  end

  add_foreign_key "Buys", "Checkins", column: "checkinId", primary_key: "checkinId", name: "c_buys_fk1"
  add_foreign_key "Buys", "Services", column: "serviceId", primary_key: "serviceId", name: "c_buys_fk2"
  add_foreign_key "Checkins", "Customers", column: "customerId", primary_key: "customerId", name: "c_checkins_fk1"
  add_foreign_key "Checkins", "PaymentInfo", column: "paymentId", primary_key: "paymentId", name: "c_checkins_fk3"
  add_foreign_key "Checkins", "Rooms", column: "hotelId", primary_key: "hotelId", name: "c_checkins_fk2"
  add_foreign_key "Checkins", "Rooms", column: "roomNumber", primary_key: "roomNumber", name: "c_checkins_fk2"
  add_foreign_key "Hotels", "Staff", column: "managerId", primary_key: "staffId", name: "c_hotels_fk"
  add_foreign_key "PaymentInfo", "Customers", column: "customerId", primary_key: "customerId", name: "c_paymentinfo_fk"
  add_foreign_key "Rooms", "Hotels", column: "hotelId", primary_key: "hotelId", name: "c_rooms_fk1"
  add_foreign_key "Rooms", "RoomPrices", column: "category", primary_key: "category", name: "c_rooms_fk2"
  add_foreign_key "Rooms", "RoomPrices", column: "maxOccupancy", primary_key: "maxOccupancy", name: "c_rooms_fk2"
  add_foreign_key "Serves", "Checkins", column: "checkinId", primary_key: "checkinId", name: "c_serves_fk1"
  add_foreign_key "Serves", "Staff", column: "staffId", primary_key: "staffId", name: "c_serves_fk2"
  add_foreign_key "Staff", "Hotels", column: "hotelId", primary_key: "hotelId", name: "c_staff_fk"
end
