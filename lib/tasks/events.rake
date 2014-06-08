namespace :events do
  task broadcast: :app do
    to_notify = <<-SQL
      SELECT
        subscriptions.id,
        events.id AS event_id
      FROM subscriptions
      JOIN events
        ON ST_Intersects(subscriptions.geom, events.geom)
        AND subscriptions.publisher_id = events.publisher_id
        AND events.processed_at IS NULL
    SQL

    Subscription.with_sql(to_notify).paged_each do |subscription|
      Georelevent::Workers::Notifier.perform_async(subscription.id, subscription[:event_id])
    end
  end
end
