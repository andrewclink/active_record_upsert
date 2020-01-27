class CreateDefaultingRecords < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :defaulting_records do |t|
      t.uuid :uuid, null: false, default: "gen_random_uuid()"
      t.string :name
      t.timestamps
    end
  end
end
