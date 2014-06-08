Sequel.migration do
  up do
    alter_table :events do
      add_column :processed_at, DateTime
    end

    Event.dataset.update(processed_at: DateTime.now)
  end

  down do
    alter_table :events do
      drop_column :processed_at
    end
  end
end
