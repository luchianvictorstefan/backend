import { integer, pgTable, serial, unique, varchar } from 'drizzle-orm/pg-core';

const gigConsumers = pgTable('gig_consumers', {
  id: serial('id').primaryKey(),
  userId: integer('user_id').notNull(),
  // TODO: is this needed?
  address: varchar('address', { length: 255 }), // personal identifiable information
  description: varchar('description', { length: 255 }),
  contactNumber: varchar('contact_number', { length: 255 }).notNull(), // personal identifiable information
}, table => ({
  userIdIdx: unique('gig_consumer_user_id_idx').on(table.userId)
}));

export default gigConsumers;