Sequel.migration do
    change do
        alter_table :events do
            add_column :description, :text
        end
    end
end
