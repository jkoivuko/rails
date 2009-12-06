class FriendshipsSupport < ActiveRecord::Migration
      def self.up
          create_table "friendships" do |t|
            t.integer "id", "user_id", "friend_id"
            t.timestamps
          end
          add_index "friendships", "friend_id"
          add_index "friendships", "user_id"

      end

      def self.down
  
        drop_table "friendships"
      end
    
    
end

